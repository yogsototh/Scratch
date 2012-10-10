class Graph < Nanoc3::Filter
    identifier :graph
    @@tmpfic="/tmp/graphtemp.dot"
    def run(content, params={}) 
        content.gsub(%r{<graph( title="([^"]*)")?>(.+?)</graph>}m) do |full|
            # FileUtils.rm(@@tmpfic)
            title=$2
            str=$3
            filename=title.gsub(/[^a-zA-Z0-9_]/,"_")
            File.open(@@tmpfic,'w') do |f|
            f.write %[ digraph Source {
                        fontsize=10;
                        rankdir="LR";
                        graph [truecolor bgcolor="#FAFAFA00"];
                        node [width=0, height=0, fontname="CMU Serif Italic", shape="box", color="#333333", style="filled" fillcolor="#FAFAFA", fontcolor="#333333"] ;
                        edge [fontname="CMU Serif Italic", arrowsize=.5, color="#333333"] ; ]
            f.write str
            f.write %[}]
            end
            FileUtils.mkdir_p('output'+@item.path+'graph')
            webpath=@item.path + 'graph/' + filename + '.png'
            path='output'+webpath
            # puts  "dot -Tpng -o #{path} /tmp/graphtemp.dot"
            system("dot -Tpng -o #{path} /tmp/graphtemp.dot")
            # puts %{<img alt="#{title}" src="#{webpath}"/>}
            %{<img alt="#{title}" src="#{webpath}"/>}
        end
    end
end
