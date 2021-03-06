# Helper to find an image corresponding to the current 
# article
def blogimage(filename,title="no name", divclass=nil)
    imgpath=blogimagedir + filename
    if not divclass.nil?
        if divclass !~ /^\s*$/
            cls=%{ class="#{divclass}"}
        end
    end
    return %{<img alt="#{title}" src="#{imgpath}"#{cls}/>}
end

def blogfigure(filename,title="no name", divclass=nil)
    imgpath=blogimagedir + filename
    if not divclass.nil?
        cls=%{ class="#{divclass}"}
    end
    return %{<figure><img alt="#{title}" src="#{imgpath}"#{cls}/><figcaption>#{title}</figcaption></figure>}
end

# Return a blog image with class left added
def leftblogimage(filename,title="no name")
    return blogimage(filename, title, "left")
end

def blogimagedir
    if depthOf( @item ) == 4
        imgpath=@item.parent.path
    else
        imgpath=@item.path
    end
    imgpath=imgpath.sub(%r{#{@config[:webprefix]}/../},@config[:webprefix]+'/img/')
end
