" Very specific for my blog posts
" Most people should delete this part
" If you want to see what it does, simply
" edit a file named latest.ymd and start some lines with 'fr: '
" and 'en: '.
" I use this to maintain a two langage parallel markdown files.
function! YMarkDown()
    set foldenable
    set foldlevel=0
    set foldminlines=0
    set foldmethod=expr
    set foldtext=''
    set scrollbind
    set foldexpr=getline(v:lnum)=~'^en:\ .*$'
    vsplit  
    set foldexpr=getline(v:lnum)=~'^fr:\ .*$'
    set spell
endfunction
autocmd BufRead *.ymd  call YMarkDown()
