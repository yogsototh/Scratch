-----
# Built-in

# Custom 
kind: article
title: An ultraviolet test
multiTitle: 
    en: Ultraviolet
    fr: Ultraviolet

multiSubTitle:
    fr: les test du plugin ruby
    en: ruby plugin tests

-----
<h1>
     
    Comment intégrer Ultraviolet avec nanoc
</h1>


fr:
J'ai cherché sur Internet et j'ai trouver plusieurs
indications, malheureusement, elles ne sont plus
d'actualité avec la dernière version de nanoc.
:



Dans un premier temps il faut installer Ultraviolet :


<div>
    <code class="zsh">
#!/usr/bin/zsh

wget http://www.geocities.jp/kosako3/oniguruma/archive/onig-5.9.1.tar.gz
tar zxvf onig-5.9.1.tar.gz
cd onig-5.9.1
./configure
make
sudo make install
sudo gem install ultraviolet
    </code>
</div>

newcorps

<en>A ruby code</en><fr>Du code Ruby</fr>
=========================================

<en>A first simple test.</en>
<fr>Voilà le premier exemple simple.</fr>

<div>
    <code class="ruby">['1','2','3'].each{ |x| puts 'chiffre '+x }</code>
</div>

<fr>Avec création et téléchargement de fichier.</fr>
<en>With file creation and download.</en>

<div>
<code class="ruby" file="ultraviolet.rb">
class UltraVioletFilter < Nanoc::Filter
    identifier :ultraviolet
    def run(content)
        require 'rio'
        require 'rubygems'
        require 'uv'
        code_rule = %r{(<code class="(.+?)"( file="(.+?)")?>(.+?)<}+%{/code>)}m
        content.gsub!(code_rule) do |full|
            # original, lang, filename, code = full[0], full[1], full[3], full[4]
            original, lang, filename, code = $1, $2, $4, $5
            if lang =~ /^(zsh|bash|sh|csh|shell)$/
                lang='shell-unix-generic'
            end
            # Create a plaintext file version for download.
            codeprefix=''
            codesuffix=''
            if filename
                webpath = '/Scratch/multi'+@page.path
                code_path = [@site.config[:output_dir], webpath, 'code']
                url = webpath + 'code/' + filename
                if (url == @url)
                    puts %{erreur de redo : #{url}}
                    break
                end
                @url=url
                copy_text_to_file(code, filename, code_path)
                codeprefix=%{<div class="file"><a href="#{url}"> &#x27A5; #{filename} </a></div><div class="withfile">\n}
                codesuffix=%{\n</div>}
            end
            # Substitute the un-highlighted code with the highlighted code.
            codeprefix+Uv.parse(code, "xhtml", lang, false, @site.config[:ultraviolet_theme])+codesuffix
        end
        content
    end

    private
    def copy_text_to_file(str, fname, dir)
        if @page_rep.name == :default then
            dest_rio = rio(dir).mkpath
            frio = rio(dir, fname).delete
            frio << str
            puts "\t\twrote file #{dir}/#{fname}"
        end
    end
end 
</code>
</div>

newcorps

<en>A zsh code</en> <fr>Du code zsh</fr>
========================================

<fr>Un exemple en zsh.
J'ai fait en sorte de pouvoir utiliser le tag
<tt>zsh</tt> au lieu du compliqué <tt>shell-unix-generic</tt>
</fr>

<en>A simple zsh example. I made some modification in order to
use the <tt>zsh</tt> tag instead of the too much
complicated <tt>shell-unix-generic</tt></en>

<div>
<code class="zsh">
for fic in **/*(.); do
    if [[ ! -x $fic ]]; then
        chmod u+x $fic
    fi
    exec $fic
done
</code>
</div>
