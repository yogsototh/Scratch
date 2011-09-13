" Add this to your vimrc file to use my two split view with multiple language

autocmd BufRead *latest.md set foldenable
autocmd BufRead *latest.md set foldlevel=0
autocmd BufRead *latest.md set foldminlines=0
autocmd BufRead *latest.md set foldmethod=expr
autocmd BufRead *latest.md set foldtext=''
autocmd BufRead *latest.md set scrollbind
autocmd BufRead *latest.md set foldexpr=getline(v:lnum)=~'^en:\ .*$'
autocmd BufRead *latest.md vsplit  
autocmd BufRead *latest.md set foldexpr=getline(v:lnum)=~'^fr:\ .*$'
autocmd BufRead *latest.md set spell
