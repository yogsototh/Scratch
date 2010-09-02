def gitmtime
    # find file extension
    filepath=@item.path.sub('/Scratch/','content/html/').sub(/\/$/,'')
    ['md','erb','haml'].each do |ext|
        tmppath=%{#{filepath}.#{ext}}
        if FileTest.exists?(tmppath)
            filepath=tmppath
            break
        end
    end
    str=`git log --format='%ci' -- #{filepath} | head -n 1`
    # puts '#############'
    # puts "item #{filepath}"
    # puts "str #{str}"
    # puts '#############'
    DateTime.parse( str )
end
