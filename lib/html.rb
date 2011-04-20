def meta_tags
    t=tags
    if t.length>0
        return %{<meta name="keywords" content="#{t}">}
    end
end

def meta_alternate
    res=[]
    @conf.languages.each do |lang|
        item_for_lang=item_of_language(lang)
        if not item_for_lang.nil?
            res <<= %{<link rel="alternate" lang="#{ lang }" xml:lang="#{ lang }" title="#{ item_for_lang[:title] }" type="text/html" hreflang="#{ lang }" href="#{ item_for_lang.reps[0].path }" />}
        end
    end
    return res.join("\n")
end

def choixrss
    return %{<a id="rss" href="#{@config[:rss_uri][@conf.language.intern]}">#{ tradOf(:subscribe) }</a>}
end

def choixlang
    @conf.languages.map do |l|
        dest=@item_rep.path.sub(%r{#{@config[:webprefix]}/../}, %{#{@config[:webprefix]}/#{l}/}) 
        if @item_rep.path != dest
            %{<a href="#{dest}" onclick="setLanguage('#{l}')">#{ tradOfKeywordIn(:switchTo,l)}</a>}
        else
            nil
        end
    end.join()
end
