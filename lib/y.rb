# All files in the 'lib' directory will be loaded
# before nanoc starts compiling.

def allExceptCode( f, content )
    regexp=/<code[^>]*>.*?<\/code>/m
    tmp=""
    mem=[]
    content.scan(regexp).each do |c|
        mem <<= c
    end
    i=0
    content.split(regexp).each do |x|
        tmp <<= send(f,x) 
        if not mem[i].nil?
            tmp <<= mem[i]
            i+=1
        end
    end
    tmp
end

module Nanoc3::Filters
    class MathJaxKramdownRepair < Nanoc3::Filter
        identifiers :math_repair

        def description(content)
            content.gsub(/<div class="math">(.+?)<\/div>/m) do
                return %{$$ #{$1} $$}
            end
        end

        def run(content, params={})
            allExceptCode( :description , content )
        end
    end

    class Description < Nanoc3::Filter
        identifiers :description

        def description(content)
            content.gsub(/^\s*<desc( [^>]*)?>(.+?)<\/desc>/m) do
                n=0
                if $1 then
                    summary=$1
                    summary.slice!(0)
                else
                    summary="no description"
                end
                '<div><table class="description" summary="'+summary+'">'+$2.gsub(/([^:]+):(.+?)::/m) do
                    n+=1
                    if n % 2 == 0
                        sombre=' class="assombris10"'
                    else
                        sombre=' class="assombris20"'
                    end
                    '<tr'+sombre+'><td class="definitionCell">'+$1+'</td><td class="valueCell">'+$2+'</td></tr>'
                end+'</table></div>'
            end
        end

        def run(content, params={})
            allExceptCode( :description , content )
        end
    end

    class FrenchSpace < Nanoc3::Filter
        identifiers :frenchspace
        def ameliorate(content)
            content.gsub(/ ([:;!?]|&eq;|&ne;)/) { "&nbsp;"+$1 }
        end
        def run(content, params={})
            allExceptCode( :ameliorate, content )
        end
    end

    class Footnotes < Nanoc3::Filter
        identifiers :footnotes
        def hr_before_footnote(content)
            content.gsub(/<div class="footnotes">/) { %{<hr/>#{$&}} }
        end
        def run(content, params={})
            allExceptCode( :hr_before_footnote, content )
        end
    end

    class FirstHierarchy < Nanoc3::Filter
        identifiers :firsthi
        def run(content, params={})
            content.gsub(/\A(\s|\n)*<h[1-4]/m)do
                $& + ' class="first"'
            end.gsub(/<div[^>]*class="corps"[^>]*>(\s)*<h[1-4]/m) do
                $& + ' class="first"'
            end.gsub(/class="first" class="first"/) do
                'class="first"'
            end
        end
    end

    class YTypography < Nanoc3::Filter
        identifiers :ytypo
        def ytypofunc(content)
            content.gsub(/<sc>(.*?)<\/sc>/m) do
               %{<span class="sc">}+$1+%{</span>}
            end.gsub(/''(.*?)''/m)do
               %{<code>}+$1+%{</code>}
            end.gsub(/\(c\)/) do
                %{<small>&copy;</small>}
            end.gsub(/\(r\)/) do
                %{<small>&reg;</small>}
            end.gsub(/-(&gt;|>)/) do
                %{&rarr;}
            end.gsub(/(&lt;|<)-/) do
                %{&larr;}
            end
        end
        def run(content, params={})
            allExceptCode( :ytypofunc, content )
        end
    end

    class YAbbreviations < Nanoc3::Filter
        identifiers :yabbreviations
        def makeabbreviations(text)
            { 
                    'WebDav' => 'Web-based Distributed Authoring and Versionning',
                    'cms' => 'Content Management System',
                    'xml' => 'eXtended Markup Language',
            }.each do |keyword,abbreviation|
                text=text.gsub(/\b#{keyword}\b/i) do
                   %{<abbr title="#{abbreviation}"><span class="sc">#{keyword}</span></abbr>}
                end
            end
            return text
        end

        def run(content, params={})
            allExceptCode(:makeabbreviations, content )
        end
    end

    class MultiCorps < Nanoc3::Filter
        identifiers :multicorps
        def run(content, params={})
            content.gsub(/^.*newcorps.*$/) do
                %{\n</div>\n\n<div class="corps">\n}
            end.gsub(/^.*begindiv\((.*)\).*$/) do
                %{\n<div class="#{$1}">\n}
            end.gsub(/^.*enddiv.*$/) do
                %{\n</div>\n}
            end
        end
    end
end

def block(title, url, text, position="left")
    return %{<div class="block #{position}">
        <h3>
            <a href="#{url}"> #{title} 
                <span class="nicer">»</span> 
            </a>
        </h3>
        <p>
        #{text}
        </p>
    </div>}
end
