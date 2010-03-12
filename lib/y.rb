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
    class Description < Nanoc3::Filter
        identifiers :description

        def description(content)
            content.gsub(/<desc( [^>]*)?>(.+?)<\/desc>/m) do
                n=0
                if $1 then
                    summary=$1
                    summary.slice!(0)
                else
                    summary="no description"
                end
                '<table class="description" summary="'+summary+'">'+$2.gsub(/([^:]+):(.+?)::/m) do
                    n+=1
                    if n % 2 == 0
                        sombre=' class="assombris10"'
                    else
                        sombre=' class="assombris20"'
                    end
                    '<tr'+sombre+'><td class="definitionCell">'+$1+'</td><td class="valueCell">'+$2+'</td></tr>'
                end+'</table>'
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


    class FirstHierarchy < Nanoc3::Filter
        identifiers :firsthi
        def run(content, params={})
            content.gsub(/<div[^>]*class="corps"[^>]*>(\s|\n)*?<h[1-4]?/m) do
               $& + ' class="first"'
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

