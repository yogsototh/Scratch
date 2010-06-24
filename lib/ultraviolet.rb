class UltraVioletFilter < Nanoc3::Filter
    identifier :ultraviolet
    def run(content, params={})
        require 'rubygems'
        require 'uv'
        code_rule = %r{(<code class="([^"]+?)"( file="([^"]+?)")?>(.+?)</code>)}m
        content.gsub!(code_rule) do |full|
            # original, lang, filename, code = full[0], full[1], full[3], full[4]
            original, lang, filename, code = $1, $2, $4, $5
            if lang =~ /^(zsh|bash|sh|csh|shell)$/
                lang='shell-unix-generic'
            end
            # Create a plaintext file version for download.
            codeprefix=''
            codesuffix=''
            if filename
                webpath = @item.path
                code_path = "/output/#{webpath}/code"
                url = webpath + 'code/' + filename
                if (url == @url)
                    puts %{# erreur de redo : #{url}}
                    break
                end
                @url=url
                copy_text_to_file(code, filename, code_path)
                codeprefix=%{<div class="code"><div class="file"><a href="#{url}"> &#x27A5; #{filename} </a></div><div class="withfile">\n}
                codesuffix=%{\n</div></div>}
            end
            # Substitute the un-highlighted code with the highlighted code.
            codeprefix+Uv.parse(code, "xhtml", lang, false, @config[:ultraviolet_theme])+codesuffix
        end
        content
    end

    private
    def copy_text_to_file(str, fname, dir)
        FileUtils.mkdir_p dir
        File.open(%{#{dir}/#{fname}}, 'w'){|f|f.write(str)}
        puts %{Ecriture de #{dir}/#{fname}}
    end
end 
