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

    if @item[:kind] == "blog"
        generateBlogSubMenu
    else
        if @item[:kind] == "article" and depth > 3
            page=@item.parent
        elsif depth > 2
            page=@item.parent
        end
        link_to_unless_current(@item[:title],@item)
        liste=getSortedChildren(@item).collect do |p|
            link_to_unless_current(p[:title],p)
        end
        if ! liste.empty?  then
            '<div id="sousliens"><ul><li>'+liste.join('</li><li>')+'</li></ul></div>'
        else
            return
        end
    end
end
# =======================

def blogimage(val,title)
    puts 'blogimage'
    return '<img alt="pas encore fait" src="/404"></img>'
end
def leftblogimage(val,title)
    puts 'blogimage'
    return '<img class="left" alt="pas encore fait" src="/404"></img>'
end
def tagCloud
    puts 'tagCloud'
    return '<div>This should be a TagCloud</div>'
end
def lnkto(title,item)
    language=@item_rep.path.sub(/\/Scratch\//,'').sub(/\/.*$/,'')
    link_to(title, "/Scratch/#{language}"+item)
end

