def alternate(conf)
    # need multi to be declared to true when in 
    # multi-language mode false otherwise
    # languages to the list of available languages
    # language to the current language
    if conf.multi
        conf.languages.collect { |lang| %{<link rel="alternate" lang="#{lang}" xml:lang="#{lang}" title="#{@item[:multiTitle][lang]}" type="text/html" hreflang="#{lang}" href="#{@item_rep.path.sub(/multi/,lang)}" />\n}}.join(conf.indent)
    else
        %{}
    end
end
