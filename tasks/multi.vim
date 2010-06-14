" clear all preceeding definition
syntax clear
" case sensitive language
syntax case match

" Begining
syntax region multiInline start=/^..: / end=/$/ contains=ALL oneline

highlight link multiInline Type
