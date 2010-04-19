#!/usr/bin/env ruby

class Frequencies

    def initialize
        @nbwords=0
        @tag=Hash.new
    end

    def nbwords
        @nbwords
    end

    def is_bad_word(w)
        if w.length < 3
            return true
        end
        if  w !~ /\A(\w|\d)*\Z/
            return true
        end
        return false
    end

    def update_density(content)
        content.split(/\b/).each do |m|
            if is_bad_word(m)
                next
            end
            @nbwords += 1
            if @tag.has_key?(m)
                @tag[m]+=1
            else
                @tag[m]=1
            end
        end
    end

    def show_tags
        @tag.keys.sort_by do |k| 
            @tag[k]
        end.each do |k| 
            puts %{#{@tag[k]} #{k}}
        end
    end
end

f=Frequencies.new

ARGV.each do |file|
    puts '['+file+']'
    fic=File.open(file)
    fic.each_line do |l|
        f.update_density(l)
    end
    fic.close
end
f.show_tags
