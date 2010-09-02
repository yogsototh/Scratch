def gitmtime
    filepath=@item.path.sub('/Scratch/','content/html/').sub(/\/$/,'')
    filepath<<=%{.#{@item[:extension]}}
    str=`git log -1 --format='%ci' -- #{filepath}`
    if str == ""
        return @item.mtime
    else
        return DateTime.parse( str )
    end
end
