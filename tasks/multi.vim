" clear all preceeding definition
syntax clear
" case sensitive language
syntax case match

" Begining
syntax region multiInline start=/^..: / end=/$/ contains=ALL oneline

highlight link multiInline Type

" To add in your Vimrc
" 
" multilanguage folders
autocmd BufEnter *.md setlocal foldmethod=expr
" se lance avec execute FrenchView()
fun! FrenchView()
    %g/^en: .*$\n^en: /foldclose
    %g/^fr: .*$\n^fr: /foldopen
    " setlocal foldexpr=getline(v:lnum)=~'^en:\ '?1:0
endfun
" se lance avec execute EnglishView()
fun! EnglishView()
    %g/^fr: .*$\n^fr: /foldclose
    %g/^en: .*$\n^en: /foldopen
    " setlocal foldexpr=getline(v:lnum)=~'^fr:\ '?1:0
endfun

fun! MyFoldLevel(lnum)
    if getline(a:lnum)=~'^fr:\ '
        if getline(a:lnum+1)=~'^fr:\ '
            return '1'
        else
            return '<1'
        endif
    else
        if getline(a:lnum)=~'^en:\ '
            if getline(a:lnum+1)=~'^en:\ '
                return '1'
            else
                return '<1'
            endif
        else
            return 0
        endif
    endif 
endfun

" se lance avec execute MultiView()
fun! MultiView()
    setlocal foldexpr=MyFoldLevel(v:lnum)
endfun
:command FR execute FrenchView()
:command EN execute EnglishView()
:command MM execute MultiView()
autocmd BufEnter *.md execute MultiView()

autocmd BufEnter latest.md set scrollbind
autocmd BufEnter latest.md execute FrenchView()
autocmd BufEnter latest.md vsplit
autocmd BufEnter latest.md execute EnglishView()
