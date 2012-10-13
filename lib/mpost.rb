class MPost < Nanoc3::Filter
    identifier :mpost
    @@tmpfic="/tmp/graphtemp.mp"
    @@name=["Zero","One","Two","Three"]
    def solarized(str)
        str.gsub(
            %r{base([0123])},'base'+@@name[0]+@@name[$2]
        ).gsub(
            %r{base([0123])},'base'+@@name[$2]
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
            # FileUtils.rm(@@tmpfic)
            title=$2
            str=$3
            filename=title.gsub(/[^a-zA-Z0-9_]/,"_")
            File.open(@@tmpfic,'w') do |f|
             f.write %{
             color   baseZeroThree, baseZeroTwo, baseZeroOne, baseZeroZero
                   , baseZero, baseOne, baseTwo, baseThree, yellow, orange
                   , s_red, magenta, violet, s_blue, cyan, s_green;

             baseZeroThree  :=(0.0               ,0.168627450980392,0.211764705882353);
             baseZeroTwo    :=(0.0274509803921569,0.211764705882353,0.258823529411765);
             baseZeroOne    :=(0.345098039215686 ,0.431372549019608,0.458823529411765);
             baseZeroZero   :=(0.396078431372549 ,0.482352941176471,0.513725490196078);
             baseZero       :=(0.513725490196078 ,0.580392156862745,0.588235294117647);
             baseOne        :=(0.576470588235294 ,0.631372549019608,0.631372549019608);
             baseTwo        :=(0.933333333333333 ,0.909803921568627,0.835294117647059);
             baseThree      :=(0.992156862745098 ,0.964705882352941,0.890196078431372);
             yellow         :=(0.709803921568627 ,0.537254901960784,0.0);
             orange         :=(0.796078431372549 ,0.294117647058824,0.0862745098039216);
             s_red          :=(0.862745098039216 ,0.196078431372549,0.184313725490196);
             magenta        :=(0.827450980392157 ,0.211764705882353,0.509803921568627);
             violet         :=(0.423529411764706 ,0.443137254901961,0.768627450980392);
             s_blue         :=(0.149019607843137 ,0.545098039215686,0.823529411764706);
             cyan           :=(0.164705882352941 ,0.631372549019608,0.596078431372549);
             s_green        :=(0.52156862745098  ,0.6              ,0.0);

             beginfig(1)
             }
             f.write str
             f.write %{\nendfig;\nend\n}
            end
            FileUtils.mkdir_p('output'+@item.path+'mpost')
            webpath=@item.path + 'mpost/' + filename + '.png'
            path='output'+webpath
            cmd="cd /tmp && mpost graphtemp.mp >/dev/null 2>&1 && convert -density 300 graphtemp.1 $OLDPWD/#{path} >/dev/null 2>&1"
            system(cmd)
            %{<figure><img alt="#{title}" src="#{webpath}"/><figcaption>#{title}</figcaption></figure>}
        end
    end
end
