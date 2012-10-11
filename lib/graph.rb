class Graph < Nanoc3::Filter
    identifier :graph
    @@tmpfic="/tmp/graphtemp.dot"
    def solarized(str)
        str.gsub(
            %r{color="base03"},'color="#002b36"'
        ).gsub(
            %r{color="base02"},'color="#073642"'
        ).gsub(
            %r{color="base01"},'color="#586e75"'
        ).gsub(
            %r{color="base00"},'color="#657b83"'
        ).gsub(
            %r{color="base0"},'color="#839496"'
        ).gsub(
            %r{color="base1"},'color="#93a1a1"'
        ).gsub(
            %r{color="base2"},'color="#eee8d5"'
        ).gsub(
            %r{color="base3"},'color="#fdf6e3"'
        ).gsub(
            %r{color="yellow"},'color="#b58900"'
        ).gsub(
            %r{color="orange"},'color="#cb4b16"'
        ).gsub(
            %r{color="red"},'color="#dc322f"'
        ).gsub(
            %r{color="magenta"},'color="#d33682"'
        ).gsub(
            %r{color="violet"},'color="#6c71c4"'
        ).gsub(
            %r{color="blue"},'color="#268bd2"'
        ).gsub(
            %r{color="cyan"},'color="#2aa198"'
        ).gsub(
            %r{color="green"},'color="#859900"'
        )
    end
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
                        graph [truecolor bgcolor="#fafafc"];
                        node [width=0, height=0, fontname="CMU Serif Italic", shape="box", color="#657b83", style="filled" fillcolor="#fafafc", fontcolor="#657b83"] ;
                        edge [fontname="CMU Serif Italic", arrowsize=.5, color="#657b83",fontcolor="#657b83"] ; ]
            f.write solarized(str)
            f.write %[}]
            end
            FileUtils.mkdir_p('output'+@item.path+'graph')
            webpath=@item.path + 'graph/' + filename + '.png'
            path='output'+webpath
            # puts  "dot -Tpng -o #{path} /tmp/graphtemp.dot"
            system("dot -Tpng -o #{path} /tmp/graphtemp.dot")
            # puts %{<img alt="#{title}" src="#{webpath}"/>}
            %{<figure><img alt="#{title}" src="#{webpath}"/><figcaption>#{title}</figcaption></figure>}
        end
    end
end
