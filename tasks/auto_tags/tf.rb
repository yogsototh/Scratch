#!/usr/bin/env ruby

def tf(content)
    tag=Hash.new
    nbwords=0
    content.split(/\b/).each do |m|
        if m.length<3
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

def show_tags(hash)
    hash.keys.sort_by do |k| 
        -hash[k]
    end[0..10].each do |k| 
        puts %{#{hash[k]}: #{k}}
    end
end

freq_for={}
allcontent=""
ARGV.each do |file|
    puts '['+file+']'
    fic=File.open(file)
    content=""
    fic.each_line do |l|
        content <<= l
    end
    fic.close
    freq_for[file]=tf(content)
    # show_tags(freq_for[file])
    # puts '==============='
    allcontent <<= content
end

# puts 'ALL FREQ'
all_freq=tf(allcontent)
# show_tags(all_freq)
# puts '==============='

res_for={}
freq_for.each do |file,hash|
    puts %{==== Frequencie for #{file} =====}
    res_for[file]=Hash.new
    hash.each do |k,v| 
        if all_freq[k] == 0
            next
        end
        res_for[file][k] = v/all_freq[k]
        # puts %{#{v} / #{all_freq[k]} : #{k}}
    end
    show_tags(res_for[file])
end
