class NoCustomCSS < Nanoc3::Filter
    identifier :no_custom_css
    def run(content, params={})
        res=""
        content.each do |line|
            res <<= line if not res=~/^\s*-(moz|webkit)/
        end
        return res
    end
end 

class MozillaCSS < Nanoc3::Filter
    identifier :mozilla
    def run(content, params={})
        res=""
        content.each do |line|
            res <<= line if not res=~/-webkit/
        end
        return res
    end
end 

class WebkitCSS < Nanoc3::Filter
    identifier :webkit
    def run(content, params={})
        res=""
        content.each do |line|
            res <<= line if not res=~/-moz/
        end
        return res
    end
end 
