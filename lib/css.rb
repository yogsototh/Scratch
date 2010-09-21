class NoCustomCSS < Nanoc3::Filter
    identifier :no_custom_css
    def run(content, params={})
        res=""
        content.each do |line|
            res <<= line if not res=~/-(moz|webkit)/
        end
        return res
    end
end 

class MozillaCSS < Nanoc3::Filter
    identifier :mozilla
    def run(content, params={})
        res=""
        pref=[]
        depth=0
        content.each do |line|
            depth=line.sub(/^ */,'').size/2
            pref[depth]=line
            if res=~/-(moz)/
                [0..depth].each do |i|
                    res <<= pref[i]+'\n'
                end
            end
        end
        return res
    end
end 

class WebkitCSS < Nanoc3::Filter
    identifier :webkit
    def run(content, params={})
        res=""
        pref=[]
        depth=0
        content.each do |line|
            depth=line.sub(/[^ ]*$/).size/2
            pref[depth]=line
            if res=~/-(moz)/
                [0..depth].each do |i|
                    res <<= pref[i]+'\n'
                end
            end
        end
        return res
    end
end 
