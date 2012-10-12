class Graph < Nanoc3::Filter
    identifier :graph
    @@tmpfic="/tmp/graphtemp.mp"
    def run(content, params={}) 
        content.gsub(%r{<mpost( title="([^"]*)")?>(.+?)</mpost>}m) do |full|
            # FileUtils.rm(@@tmpfic)
            title=$2
            str=$3
            filename=title.gsub(/[^a-zA-Z0-9_]/,"_")
            File.open(@@tmpfic,'w') do |f|
             f.write %{
             color base03 :=(0.0               ,0.168627450980392,0.211764705882353);
             color base02 :=(0.0274509803921569,0.211764705882353,0.258823529411765);
             color base01 :=(0.345098039215686 ,0.431372549019608,0.458823529411765);
             color base00 :=(0.396078431372549 ,0.482352941176471,0.513725490196078);
             color base0  :=(0.513725490196078 ,0.580392156862745,0.588235294117647);
             color base1  :=(0.576470588235294 ,0.631372549019608,0.631372549019608);
             color base2  :=(0.933333333333333 ,0.909803921568627,0.835294117647059);
             color base3  :=(0.992156862745098 ,0.964705882352941,0.890196078431372);
             color yellow :=(0.709803921568627 ,0.537254901960784,0.0);
             color orange :=(0.796078431372549 ,0.294117647058824,0.0862745098039216);
             color red    :=(0.862745098039216 ,0.196078431372549,0.184313725490196);
             color magenta:=(0.827450980392157 ,0.211764705882353,0.509803921568627);
             color violet :=(0.423529411764706 ,0.443137254901961,0.768627450980392);
             color blue   :=(0.149019607843137 ,0.545098039215686,0.823529411764706);
             color cyan   :=(0.164705882352941 ,0.631372549019608,0.596078431372549);
             color green  :=(0.52156862745098  ,0.6              ,0.0);

             beginfig(1)
             }
             f.write str
             f.write %{\nendfig;\nend\n}
            end
            FileUtils.mkdir_p('output'+@item.path+'graph')
            webpath=@item.path + 'graph/' + filename + '.png'
            path='output'+webpath
            if str.match(/pos=/)
                prog="neato"
            else
                prog="dot"
            end
            system("cd /tmp && mpost graphtemp.mp && convert -density 150 graphtemp.1 #{path}")
            %{<figure><img alt="#{title}" src="#{webpath}"/><figcaption>#{title}</figcaption></figure>}
        end
    end
end
