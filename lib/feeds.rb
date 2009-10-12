def feeds(conf)
    # need multi to be declared to true when in 
    # multi-language mode false otherwise
    # languages to the list of available languages
    # language to the current language
    if conf.multi
        conf.languages.map { |lang| %{<link rel="alternate" type="application/rss+xml" title="RSS in #{lang}" href="http://feeds.feedburner.com/yannespositocom#{lang}"/>\n} }.join(conf.indent)
    else
        %{<link rel="alternate" type="application/rss+xml" title="RSS" href="http://feeds.feedburner.com/yannespositocom#{conf.language}">}
    end
end
