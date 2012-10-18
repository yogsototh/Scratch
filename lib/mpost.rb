class MPost < Nanoc3::Filter
    identifier :mpost
    @@tmpfic="/tmp/graphtemp.mp"
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
            # FileUtils.rm(@@tmpfic)
            title=$2
            str=$3
            filename=title.gsub(/[^a-zA-Z0-9_]/,"_")
            code=%{
             color   baseZeroThree, baseZeroTwo, baseZeroOne, baseZeroZero
                   , baseZero, baseOne, baseTwo, baseThree, yellow, orange
                   , red, magenta, violet, blue, cyan, green;

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
             red          :=(0.862745098039216 ,0.196078431372549,0.184313725490196);
             magenta        :=(0.827450980392157 ,0.211764705882353,0.509803921568627);
             violet         :=(0.423529411764706 ,0.443137254901961,0.768627450980392);
             blue         :=(0.149019607843137 ,0.545098039215686,0.823529411764706);
             cyan           :=(0.164705882352941 ,0.631372549019608,0.596078431372549);
             green        :=(0.52156862745098  ,0.6              ,0.0);


                u:=.5cm;
                gu:=5u;

                def drawloop(expr a,b,l) =
                    pair ba,ea;
                    path circ,p,s;
                    p:=a{1,1}..b..{1,-1}cycle;
                    circ:= fullcircle scaled 6 shifted a;
                    ba = circ intersectionpoint (subpath (0,1) of p);
                    ea = circ intersectionpoint (subpath (1,2) of p);
                    s:= ba{1,1}..b..{1,-1}ea;
                    drawarrow s;
                    label.top(l,b);
                enddef;

                def drawLoop(expr a,l) =
                    pair b; b:=a shifted (0,u);
                    pair ba,ea;
                    path circ,p,s;
                    p:=a{1,1}..b..{1,-1}cycle;
                    circ:= fullcircle scaled 1.2u shifted a;
                    ba = circ intersectionpoint (subpath (0,1) of p);
                    ea = circ intersectionpoint (subpath (1,2) of p);
                    s:= ba{1,1}..b..{1,-1}ea;
                    drawarrow s;
                    label.top(l,b);
                enddef;
                def drawState(expr pos,l) =
                    label(l,pos);
                    draw fullcircle scaled u shifted pos;
                enddef;

                def drawEdgeWithAngle(expr posA,posB,l,an) =
                    path s; s := posA {dir an} .. posB {dir -an};
                    pair bA;
                    pair bA; bA = (fullcircle scaled 1.2u shifted posA) intersectionpoint s;
                    pair eB; eB = (fullcircle scaled 1.2u shifted posB) intersectionpoint s;
                    path sub; sub := bA {dir an} .. eB {dir -an};
                    drawarrow sub;
                    pair mid; mid = point 1/2length(sub) of sub;
                    label.top(l,mid);
                enddef;
                def drawEdge(expr posA,posB,l) =
                    drawEdgeWithAngle(posA,posB,l,0);
                enddef;

             prologues:=3;
             beginfig(1)
                drawoptions (withcolor base01);
             }.sub(%r{^\s*},"")
             code <<= str
             code <<= %{\nendfig;\nbye;\n}
            File.open(@@tmpfic,'w') do |f|
             f.write solarized(code)
            end
            FileUtils.mkdir_p('output'+@item.path+'mpost')
            webpath=@item.path + 'mpost/' + filename + '.png'
            path='output'+webpath
            cmd="cd /tmp && mpost graphtemp.mp >/dev/null 2>&1 && convert -density 180 graphtemp.1 $OLDPWD/#{path} >/dev/null 2>&1"
            system(cmd)
            %{<figure><img alt="#{title}" src="#{webpath}"/><figcaption>#{title}</figcaption></figure>}
        end
    end
end
