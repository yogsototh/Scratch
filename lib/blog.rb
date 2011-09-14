# Helper to find an image corresponding to the current 
# article
def blogimage(val,title="no name", divclass=nil)
    if depthOf( @item ) == 4
        imgpath=@item.parent.path
    else
        imgpath=@item.path
    end
    imgpath=imgpath.sub(%r{#{@config[:webprefix]}/../},@config[:webprefix]+'/img/')+val
    if not divclass.nil?
        cls=%{ class="#{divclass}"}
    end
    return %{<img alt="#{title}" src="#{imgpath}"#{cls}/>}
end

# Return a blog image with class left added
def leftblogimage(val,title="no name")
    return blogimage(val, title, "left")
end
