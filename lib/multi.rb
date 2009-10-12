def multiPageTitle
    if @conf.multi
        @item.title
    else
        @item[:multiTitle][@conf.language]
    end
end

def multiTitle
    multiTitleFor(@item)
end

def multiTitleFor(item)
    begin
        if @conf.multi
            @conf.languages.map{ |l| %{<span class="#{l}">#{item[:multiTitle][l.intern]}</span>} }.join("\n")
        else
            item[:multiTitle][@conf.language]
        end
    rescue 
        puts "ERROR (lib/multi.rb) certainement pas d'attribut multiTitle"
        return item[:title]
    end
end

def tradOf(keyword)
    
end

def tradOfKeywordIn(keyword, language) 
    begin
        @config[:translations][keyword][language.intern]
    rescue
        if @config[:translations].nil?
            puts %{ERROR (lib/multi.rb) Please make a 'translations' hash table in config.yaml}
        elsif @config[:translations][keyword].nil?
            puts %{ERROR (lib/multi.rb) in config.yaml, 
                in the 'translations' hash, I can't find the keyword #{keyword}}
        elsif @config[:translations][keyword][language.intern].nil?
            puts %{ERROR (lib/multi.rb) in config.yaml, 
                in the 'translations' hash, I can't find the translation 
                in #{language} for the keyword #{keyword}}
        else
            puts %{ERROR (lib/multi.rb) erreur inconnue}
        end
        return '[Sorry Translation Error]'
    end
end
