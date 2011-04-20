# All files in the 'lib' directory will be loaded
# before nanoc starts compiling.

# module Tags
    def tags
        if @item[:tags].nil?
            return ''
        end
        @item[:tags].join(', ')
    end
   
    def alltags
        language=@item.path
        language =~ %r{#{@config[:webprefix]}/([^/]*)/}
        language = $1
        @items.select {|p| p.path =~ %r{#{@config[:webprefix]}/#{language}/} and p[:kind].to_s == "article" and p.parent[:kind].to_s == 'blog'}
    end

    def tagNumber
        tags={}
        alltags.each do |p|
            if p[:tags].nil?
                next
            end
            p[:tags].each do |t|
                if tags[t]
                    tags[t]+=1
                else
                    tags[t]=1
                end
            end
        end
        return tags
    end
    
    def tagRefs
        tagLinks={}
        alltags.each do |p|
            if p[:tags].nil?
                next
            end
            p[:tags].each do |t|
                if tagLinks[t].nil?
                    tagLinks[t]=[ p ]
                else
                    tagLinks[t] <<= p
                end
            end
        end
        return tagLinks
    end
    
    def tagCloud(maxwords=nil)
        tags=tagNumber
        if not maxwords.nil?
            i=1
            while tags.count > maxwords
                tags=tags.reject{ |k,v| v<i }
                i+=1
            end
        end
        tagLinks=tagRefs.reject { |k,v| tags[k].nil? }

        max=tags.values.max
        min=tags.values.min
        minSize=1.0
        maxSize=2.5
        tagSize={}
        tags.each do |t,n|
            # valeur normalisée entre 0 et 1
            if ( max == min )
                tagSize[t]=minSize
            else
                tagSize[t]=[ ( n - min + 0.0 ) / ( max - min ) , (n - min) / 10.0 ].min
                # valeur adaptée entre minSize et maxSize
                tagSize[t]=( tagSize[t] ) * (maxSize - minSize) + minSize
            end
        end
        tagCloud=%{<script type="text/javascript">
            $(document).ready( function(){$('.list').hide();$('#tagcloud a').removeAttr("href")} );
            function tagSelected(id) {
                $('.list').hide();
                $('#'+id).fadeIn();
                $('.tag.selected').removeClass('selected');
                $('#tag_'+id).addClass('selected');
            }
        </script><div id="tagcloud">}
        tagSize.sort{|a,b| a[0].downcase <=> b[0].downcase}.each do |t,s|
            protected=t.gsub(/\W/,'_')
            grouped=t.gsub(/&/,'&amp;').gsub(/ /,'&nbsp;').gsub(/</,'&lt;').gsub(/>/,'&gt;')
            tagCloud <<= %{<a href="##{protected}" style="font-size: #{s}em;" class="tag" onclick="tagSelected('#{protected}')" id="tag_#{protected}">#{grouped}</a> }
        end
        tagCloud <<= %{</div><div id="hiddenDivs" >}
        language=@item.path
        language =~ %r{#{@config[:webprefix]}/([^/]*)/}
        language = $1
        tagLinks.sort{|a,b| a[0].downcase <=> b[0].downcase}.each do |t,l|
            protected=t.gsub(/\W/,'_')
            tagCloud <<= %{<div id="#{protected}" class="list"><h4>#{t}</h4><ul style="list-style-type: none; margin: 0;">}
            l.sort{|x,y| y[:created_at] <=> x[:created_at]}.each do |p|
                tagCloud <<= %{
                    <li style="line-height: 3em; margin: 0;">
                        #{calendar_for(p[:created_at], language)}
                        <a href="#{p.path}">#{p[:title]} <span class="nicer">»</span></a>
                    </li>\n}
            end
            tagCloud <<= %{</ul><a class="return" href="#tagcloud">&uarr;</a></div>}
        end
        tagCloud <<= %{</div>}
        return tagCloud
    end
# end
