def tradOf(keyword)
    tradOfKeywordIn(keyword, @conf.language )    
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

def item_of_language(language)
    puts %{lib/multi::item_of_language not implemented yet}
    return @item
end
