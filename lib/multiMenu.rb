def homepage
    @items.find do |i| 
        i.reps[0].path == %{/Scratch/#{@conf.language}/}
    end
end

def sortedChildrenByMenuPriority(item)
    item.children.reject{|p| p.isHidden}.
        sort!{|x,y| x.menupriority <=> y.menupriority}
end

def generateMenu
    home=homepage
    buffer=link_to_unless_current(home[:title],home.reps[0])
        sortedChildrenByMenuPriority(home).each do |page|
        buffer <<= '<li>' + 
            link_to_unless_current(page[:title],page.reps[0]) + '</li>'
    end   
    '<ul>'+buffer+'</ul>'
end
