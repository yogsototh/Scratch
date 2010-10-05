#!/usr/bin/env ruby

class Density
    def density(content)
        tag=Hash.new
        nbwords=0
        content.split(/\b/).each do |m|
            if m.length < 3
                next
            end
            if  m !~ /\A(\w|\d)*\Z/
                next
            end
            nbwords += 1
            if tag.has_key?(m)
                tag[m]+=1
            else
                tag[m]=1
            end
        end
        nbwords=nbwords.to_f
        res=Hash.new
        tag.each do |w,v|
            if v == 1
                next
            end
            res[w]=v/nbwords
        end
        return res
    end


    def initialize
        fic=File.open('frequencies.val')
        @sum=0
        @all_freq=Hash.new
        fic.each_line do |l|
            l =~ /([^ ]*) (.*)/
                nb=$1.to_i
            @all_freq[$2]=nb
            @sum+=nb
        end
        fic.close
    end


    def show_tags(hash)
        hash.keys.sort_by do |k| 
            -hash[k]/( @all_freq[k] / @sum )
        end[0..10].each do |k| 
            puts %{#{hash[k]}: #{k}}
        end
    end

end

freq_for={}
d=Density.new
ARGV.each do |file|
    puts '['+file+']'
    fic=File.open(file)
    content=""
    fic.each_line do |l|
        content <<= l
    end
    fic.close
    freq_for[file]=d.density(content)
    d.show_tags(freq_for[file])
end
