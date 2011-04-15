def homepage
    @items.find do |i| 
        i.reps[0].path == %{#{@config[:webprefix]}/#{@conf.language}/}
    end
end

def sortedChildrenByMenuPriority(item)
    item.children.reject{|p| p[:isHidden]}.
        sort!{|x,y| x[:menupriority] <=> y[:menupriority]}
end

def generateMenu
    home=homepage
    if home.nil?
        return ''
    end
    liste=[]
    liste<<=link_to_unless_current(home[:title],home.reps[0])
    sortedChildrenByMenuPriority(home).each do |page|
        liste <<= link_to_unless_current(page[:title],page.reps[0]) 
    end   
    "<ul><li>"+liste.join("</li>\n<li>")+"</li></ul>"
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

def generateBlogSubMenu(language)
    year=0
    res=""
    liste=getSortedChildren(@item).reverse!.collect! do |p|
        if p[:created_at].strftime("%Y") != year
            if year != 0
                res<<=%{</ul><script type="text/javascript">$('#archives_#{year}').hide()</script>}
            end
            year=p[:created_at].strftime("%Y") 
            res<<=%{<h4 class="button" onclick="$('#archives_#{year}').slideToggle()">[#{year}]</h4><ul id="archives_#{year}">}
        end
        res<<='<li>'
        res<<=calendar_for(p[:created_at],language)+
                link_to_unless_current(p[:title]+ %{<span class="nicer">»</span>},p)
        res<<='</li>'
    end
    res<<=%{</ul><script type="text/javascript">$('#archives_#{year}').hide()</script>}
    if ! liste.empty?
        '<div id="sousliens" class="archive">'+res+'</div>'
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

    if @item.children.length == 0 and not @item.parent[:kind].to_s == "blog"
        page=@item.parent
    else
        page=@item
    end

    if @item[:kind].to_s == "article"
        key=:subtitle
    else
        key=:title
    end

    liste=getSortedChildren(page).collect do |p|
        if not p[key].nil?
            link_to_unless_current(p[key]+' <span class="nicer">&raquo;</span>',p)
        else
            puts 'ERROR: key='+key
        end
    end
    if ! liste.empty?  then
        liste = [ link_to_unless_current(page[key]+' <span class="nicer">&raquo;</span>',page) ].concat( liste )
        '<div id="sousliens"><ul><li>'+liste.join('</li><li>')+'</li></ul></div>'
    else
        return
    end
end
# =======================

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

def leftblogimage(val,title="no name")
    return blogimage(val, title, "left")
end

def lnkto(title,item)
    language=@item_rep.path.sub(/#{@config[:webprefix]}\//,'').sub(/\/.*$/,'')
    link_to(title, "#{@config[:webprefix]}/#{language}"+item)
end

def nextFor(page)
    depth=depthOf(page)

    case depth
    when 0..2 then return nil
    when 3 then target=getSortedChildren(page)[0]
    else
        sorted_children=getSortedChildren(page.parent)
        index=sorted_children.index(page)
        target=sorted_children[ index + 1]
    end
    return nil if target.nil?
    link_to(tradOf(:next)+%{&nbsp;<span class="nicer">»</span>}, target)
end

# return the previous page of a post containing many
def previousFor(page)
    case depthOf(page)
    when 0..3 then return nil
    when 4 then 
        sorted_children=getSortedChildren(page.parent)
        index=sorted_children.index(page)
        if index==0
            target=page.parent
        else
            target=sorted_children[ index - 1 ]
        end
    end
    return nil if target.nil?
    link_to(%{<span class="nicer">«</span>&nbsp;}+tradOf(:previous), target)
end

def brother_for_at(page,n)
    brothers=getSortedChildren(page.parent)
    i=brothers.index(page)
    if i.nil?
        return nil
    end

    if i + n < 0
        return nil
    end
    brothers[ i + n ]
end

def article_brother(n)
    if depthOf(@item) > 3
        page=@item.parent
    else
        page=@item
    end
    brother_for_at(page,n)
end
