class Graph < Nanoc3::Filter
    identifier :graph
    require 'rio'
    def run(content, params={}) 
        content.gsub!(%r{<graph title="([^"]*)">(.+?)</graph>}m) do |full|
            frio = rio("/tmp", "graphtemp.dot").delete
            title=$1
            str=$2
            filename=title.gsub(/[^a-zA-Z0-9_]/,"_")
            frio << %[ digraph Source {
                        fontsize=10;
                        rankdir="LR";
                        graph [truecolor bgcolor="#ffffff00"];
                        node [width=0, height=0, fontname="Optima Bold", shape="Mrecord", color="#000000", style="filled" fillcolor="#eeeeee", fontcolor="#333333"] ;
                        edge [arrowsize=.5, color="#333333"] ; ]
            frio << str
            frio << %[}]
            rio('output'+@item.path+'graph').mkpath
            webpath=@item.path + 'graph/' + filename + '.png'
            path='output'+webpath
            puts  "dot -Tpng -o #{path} /tmp/graphtemp.dot"
            system("dot -Tpng -o #{path} /tmp/graphtemp.dot")
            puts %{<img alt="#{title}" src="#{webpath}"/>}
            %{<img alt="#{title}" src="#{webpath}"/>}
        end
        content
    end
end
