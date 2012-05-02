class UltraVioletFilter < Nanoc3::Filter
    identifier :ultraviolet

    def protect(str) 
        str.gsub(%r{<([^>]*)>}) do
            "&lt;#{$1}&gt;"
        end
    end

    def run(content, params={})
        require 'rubygems'
        code_rule = %r{(<code class="([^"]+?)"( file="([^"]+?)")?>\n?(.+?)</code>)}m
        new_content=content.gsub(code_rule) do |full|
            @full, @lang, @filename, @code = $1, $2, $4, $5
            @codeprefix=''
            if not @filename.nil? and @filename != ""
                create_file_for_code
            end
            @codeprefix+"\n\n<pre><code class=\"#{@lang}\">"+protect(@code)+"</code></pre>\n\n"
        end
        return new_content
    end

    private
    def create_file_for_code
        # Create a plaintext file version for download.
        webpath = @item.path

        url = webpath + 'code/' + @filename
        @codeprefix=%{<div class="codefile"><a href="#{url}">&#x27A5; #{@filename}</a></div>\n}

        code_path = "output#{webpath}code"
        FileUtils.mkdir_p code_path
        File.open(%{#{code_path}/#{@filename}}, 'w'){|f|f.write(@code)}
    end
end 
