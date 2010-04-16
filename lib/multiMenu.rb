def homepage
    @items.find do |i| 
        i.reps[0].path == %{/Scratch/#{@conf.language}/}
    end
end

def sortedChildrenByMenuPriority(item)
    item.children.reject{|p| p[:isHidden]}.
        sort!{|x,y| x[:menupriority] <=> y[:menupriority]}
end

def generateMenu
    home=homepage
    liste=[]
    liste<<=link_to_unless_current(home[:title],home.reps[0])
    sortedChildrenByMenuPriority(home).each do |page|
        liste <<= link_to_unless_current(page[:title],page.reps[0]) 
    end   
    "<ul><li>"+liste.join("</li><li>")+"</li></ul>"
end

def depthOf(item)
    res=0
    while item.parent != nil
        res+=1
        item=item.parent
    end
    return res
end

def getSortedChildren(parent)
    if parent[:kind] == "blog"
        return parent.children.reject{|p| p[:isHidden]}.sort!{|x,y| x[:created_at] <=> y[:created_at] }
    else
        return parent.children.reject{|p| p[:isHidden]}.sort!{|x,y| x[:menupriority] <=> y[:menupriority] }
    end
end

def generateBlogSubMenu
    liste=getSortedChildren(@item).reverse!.collect! do |p|
        link_to_unless_current(p[:title],p)
    end
    if ! liste.empty?
        '<div id="sousliens"><ul><li>'+liste.join('</li><li>')+'</li></ul></div>'
    else
        return
    end
end

def generateSubMenu()
    if @item[:noSubMenu]
        return 
    end

    depth=depthOf(@item)

    if depth == 0
        return
    end

    if @item[:kind].to_s == "blog"
        return generateBlogSubMenu
    end

    if @item.children.length == 0 and not @item.parent[:kind].to_s == "blog"
        page=@item.parent
    else
        page=@item
    end
    link_to_unless_current(page[:title],page)
    liste=getSortedChildren(page).collect do |p|
        link_to_unless_current(p[:title],p)
    end
    if ! liste.empty?  then
        '<div id="sousliens"><ul><li>'+liste.join('</li><li>')+'</li></ul></div>'
    else
        return
    end
end
# =======================

def blogimage(val,title="no name")
    if depthOf( @item ) == 3
        imgpath=@item.parent.path
    else
        imgpath=@item.path
    end
    imgpath=imgpath.sub(%r{/Scratch/../},'/Scratch/img/')+val
    return %{<img alt="#{title}" src="#{imgpath}"></img>}
end

def leftblogimage(val,title="no name")
    if depthOf( @item ) == 3
        imgpath=@item.parent.path
    else
        imgpath=@item.path
    end
    imgpath=imgpath.sub(%r{/Scratch/../},'/Scratch/img/')+val
    return %{<img class="left" alt="#{title}" src="#{imgpath}"></img>}
end

def lnkto(title,item)
    language=@item_rep.path.sub(/\/Scratch\//,'').sub(/\/.*$/,'')
    link_to(title, "/Scratch/#{language}"+item)
end

def nextFor(page)
    depth=depthOf(page)

    case depth
    when 0..1 then return nil
    when 2 then target=getSortedChildren(page)[0]
    else
        sorted_children=getSortedChildren(page.parent)
        index=sorted_children.index(page)
        target=sorted_children[ index + 1]
        if target.nil?
            return nil
        end
    end
    link_to("&rarr;&nbsp;"+tradOf(:next), target)
end

# return the previous page of a post containing many
def previousFor(page)
    if depthOf(page) < 3
        return nil
    end

    sorted_children=getSortedChildren(page.parent)
    index=sorted_children.index(page)
    if index==0
        target=page.parent
    else
        target=sorted_children[ index - 1 ]
    end
    link_to(tradOf(:previous)+"&nbsp;&larr;", target)
end
