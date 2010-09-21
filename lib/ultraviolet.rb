class UltraVioletFilter < Nanoc3::Filter
    identifier :ultraviolet

    def create_file_for_code(code, filename)
        # Create a plaintext file version for download.
        codeprefix=''
        codesuffix=''
        if filename
            webpath = @item.path
            code_path = "output#{webpath}code"
            url = webpath + 'code/' + filename
            if (url == @url)
                puts %{# erreur de redo : #{url}}
            end
            @url=url
            codeprefix=%{<div class="code"><div class="file"><a href="#{url}"> &#x27A5; #{filename} </a></div><div class="withfile">\n}
            codesuffix=%{\n</div></div>}
            return [ codeprefix, codesuffix ]
            copy_text_to_file(code, filename, code_path)
        end
        return [ codeprefix, codesuffix ]
    end

    def run(content, params={})
        require 'rubygems'
        require 'uv'
        code_rule = %r{(<code class="([^"]+?)"( file="([^"]+?)")?>(.+?)</code>)}m
        new_content=content.gsub(code_rule) do |full|
            original, lang, filename, code = $1, $2, $4, $5
            if lang =~ /^(zsh|bash|sh|csh|shell)$/
                lang='shell-unix-generic'
            end
            codeprefix, codesuffix = create_file_for_code(code, filename)
            codeprefix+Uv.parse(code, "xhtml", lang, false, @config[:ultraviolet_theme])+codesuffix
        end
        if new_content.nil?
            puts "NIL:::: #{@item.path}"
        end
        return new_content
    end

    private
    def copy_text_to_file(str, fname, dir)
        FileUtils.mkdir_p dir
        File.open(%{#{dir}/#{fname}}, 'w'){|f|f.write(str)}
        puts %{\t\tEcriture de #{dir}/#{fname}}
    end
end 
