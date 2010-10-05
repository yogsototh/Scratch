class UltraVioletFilter < Nanoc3::Filter
    identifier :ultraviolet

    def run(content, params={})
        require 'rubygems'
        require 'uv'
        code_rule = %r{(<code class="([^"]+?)"( file="([^"]+?)")?>(.+?)</code>)}m
        new_content=content.gsub(code_rule) do |full|
            @lang, @filename, @code = $2, $4, $5
            if @lang =~ /^(zsh|bash|sh|csh|shell)$/
                @lang='shell-unix-generic'
            end
            @codeprefix=''
            @codesuffix=''
            if not @filename.nil? and @filename != ""
                create_file_for_code
            end
            @codeprefix+
                Uv.parse(@code, "xhtml", @lang, false, @config[:ultraviolet_theme])+
                @codesuffix
        end
        return new_content
    end

    private
    def create_file_for_code
        # Create a plaintext file version for download.
        webpath = @item.path

        url = webpath + 'code/' + @filename
        @codeprefix=%{<div class="code"><div class="file"><a href="#{url}"> &#x27A5; #{@filename} </a></div><div class="withfile">\n}
        @codesuffix=%{\n</div></div>}

        code_path = "output#{webpath}code"
        puts %{\t\tEcriture de #{code_path}/#{@filename}}
        FileUtils.mkdir_p code_path
        File.open(%{#{code_path}/#{@filename}}, 'w'){|f|f.write(@code)}
    end

end 
