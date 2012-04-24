# All files in the 'lib' directory will be loaded
# before nanoc starts compiling.

# repair cutted XML code by closing the tags
# work even if the XML is cut into a tag.
# example:
#    transform '<div> <code> toto </code> <p> hello <a href="http://tur'
#    into      '<div> <code> toto </code> <p> hello </p></div>'
def repair_html( html, debug=false )
    parents=[]
    depth=0
    html.scan( %r{<(/?)(\w*)([^>]*)>} ).each do |m|
        if m[-1] == "/"
            next
        end
        if m[0] == "" 
            parents[depth]=m[1]
            depth+=1
        else
            depth-=1
            # -1 is normal for my layout
            if (depth <= -2)
                puts "WARNING: Intermiedate Depth <= -2"
            end
        end
    end
    res=html.sub(/<[^>]*$/m,'')
    depth -= 1
    if (depth < -1) 
        puts "ERROR: Final Depth < 0" 
        parents=[]
        depth=0
        html.scan( %r{<(/?)(\w*)[^>]*(/?)>} ).each do |m|
            if m[2] == "/"
                puts 'IGNORE: <'+m[0]+m[1]+m[2]+'> ' + depth.to_s
                next
            end
            if m[0] == "" 
                parents[depth]=m[1]
                depth+=1
                puts '<'+m[0]+m[1]+'> ' + depth.to_s
                puts 'parents='+parents.join('; ')
            else
                depth-=1
                puts '<'+m[0]+m[1]+'> ' + depth.to_s
            end
        end
    end
    depth.downto(0).each { |x| res<<= %{</#{parents[x]}>} }
    res
end

def showArticle( article, language )
    if /<img [^>]*>/ =~ article.compiled_content 
        image=$&
    else
        image=%{<img src="/Scratch/img/presentation.png" alt="basic logo"/>}
    end
    presentation=%{<figure>#{image}
        <figcaption> 
            #{article[:title]} <span class="nicer">»</span>
        </figcaption></figure>}
    %{<div class="popularblock">#{link_to(presentation, article)}</div>}
end
