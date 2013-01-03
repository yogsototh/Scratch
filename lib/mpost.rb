class MPost < Nanoc3::Filter
    identifier :mpost
    @@tmp="/tmp/mp/"
    @@name=["Zero","One","Two","Three"]
    def solarized(str)
        str.gsub(
            %r{base0([0123])},'base'+@@name[0]+@@name[$1.to_i]
        ).gsub(
            %r{base([0123])},'base'+@@name[$1.to_i]
        ).gsub(
            %{red},'s_red'
        ).gsub(
            %{blue},'s_blue'
        ).gsub(
            %{green},'s_green'
        )
    end
    def run(content, params={})
        content.gsub(%r{<mpost( title="([^"]*)")?>(.+?)</mpost>}m) do |full|
            title=$2
            str=$3
            filename=title.gsub(/[^a-zA-Z0-9_]/,"_")
            # write the mp file using the code
            code=File.read('lib/graph.mp')
            code<<=%{beginfig(1)
                       drawoptions (withcolor base01);}
            code <<= str
            code <<= %{\nendfig;\nbye;\n}

            # create the directory to compile metapost files
            FileUtils.mkdir_p(@@tmp)

            # write the code into a temporary file
            File.open(@@tmp+filename+'.mp','w') do |f|
             f.write solarized(code)
            end

            # write the URL of the image
            imgurl=@item.path + 'mpost/' + filename + '.png'
            # We compile only if the source changed
            if not (File.exists?(@@tmp+filename+'.old') and
                    FileUtils.cmp(@@tmp+filename+'.mp', @@tmp+filename+'.old'))
            then
                print %{\t[mpost] updating: #{filename}}
                fspath=FileUtils.pwd+'/output'+imgurl
                # create the directory for the output file
                FileUtils.mkdir_p(File.dirname(fspath))

                # Launch the metapost compilation and update
                # the cache in case of success
                cmd="cd #{@@tmp} && mpost #{filename}.mp >/dev/null 2>&1 && convert -density 180 #{filename}.1 #{fspath} >/dev/null"
                if system(cmd)
                    if FileUtils.copy(@@tmp+filename+'.mp',@@tmp+filename+'.old')
                        puts " [SUCCESS]"
                    else
                        puts " [ERROR: couldn't copy]"
                    end
                else
                    puts " [ERROR: compilation error; check  #{@@tmp}#{filename}.log ]"
                end
            end
            # replace the code by the image
            %{<figure><img alt="#{title}" src="#{imgurl}"/><figcaption>#{title}</figcaption></figure>}
        end
    end
end
