def tradOf(keyword)
    language=@conf.language
    tradOfKeywordIn(keyword, language )    
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
    searched_path=@item_rep.path.sub(@conf.language,language) 
    # puts %{source path = #{@item_rep.path}, searched_path = #{searched_path}}
    @items.find { |i| i.reps[0].path == searched_path }
end
