class LocalConf
    attr_accessor :blog, :article, :languages, :language, :indent
    def to_s
        instance_variables.map{ |x| 
            if instance_variable_get(x).class == Array
                %{#{x.intern}=  [#{instance_variable_get(x).join(', ')}]} 
            else
                %{#{x.intern}=  #{instance_variable_get(x)}} 
            end
        }
    end
end
    
def setItemConf
    # -- init variables --
    conf=LocalConf.new
    language=@item_rep.path.sub(%r{#{@config[:webprefix]}/},'').sub(/\/.*$/,'')
    if language != ''
        conf.language=language
    else
        conf.language='en'
        language=conf.language
    end
    
    # the current item is an article
    article=( ( not @item[:kind].nil? ) && @item[:kind] == 'article' )
    conf.article=article
    
    # the current item is a blog entry page
    blog=( ( not @item[:kind].nil? ) && @item[:kind] == 'blog' )
    conf.blog=blog
    
    # all supported languages
    languages=@config[:languages]
    conf.languages=languages
    
    self.instance_variable_set(:@conf, conf)

    return language, languages, blog, article
end 
