
def gitmtime
    filepath=@item.path.sub('/Scratch/','content/html/').sub(/\/$/,'')
    ext=%{.#{@item[:extension]}}
    filepath<<=ext
    if not FileTest.exists?(filepath)
        filepath.sub!(ext,%{/index#{ext}})
    end
    str=`git log -1 --format='%ci' -- #{filepath}`
    if str == ""
        return @item.mtime
    else
        return DateTime.parse( str )
    end
end
