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
            if debug
                puts 'IGNORE: <'+m[0]+m[1]+'/>' + depth.to_s
                puts 'parents='+parents.join('; ')
            end
            next
        end
        if m[0] == "" 
            parents[depth]=m[1]
            depth+=1
            if debug
                puts '<'+m[0]+m[1]+'> ' + depth.to_s
                puts 'parents='+parents.join('; ')
            end
        else
            depth-=1
            if (not debug) and (depth <0) 
                puts 'ERROR repair_html: '
                puts 'HTML: ' + html
                puts '---'
                repair_html(html,true)
                puts 'END_ERROR'
            end
            if debug
                puts '<'+m[0]+m[1]+'> ' + depth.to_s
            end
        end
    end
    res=html.sub(/<[^>]*$/m,'')
    depth -= 1
    if (depth < 0) 
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
