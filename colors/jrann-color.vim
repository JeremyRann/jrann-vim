" Based on template: https://github.com/ggalindezb/Vim-Colorscheme-Template
" (https://raw.githubusercontent.com/ggalindezb/Vim-Colorscheme-Template/master/template.vim)
" (commit 2b24bc30ef8727cc89ff46c23b354a392380156e)
" Also based on wombat256mod.vim, available at http://www.vim.org/scripts/script.php?script_id=2465
" Author: Jeremy Rann (xerog1@gmail.com)
" Notes: Color scheme very loosely based on Visual Studio's dark theme
" for 256-color console and gui with nice diff colors

" cool help screens
" :he group-name
" :he highlight-groups
" :he cterm-colors
" :he highlight
" A good way to see what your colorscheme does is to follow this procedure:
" :w
" :so %
"
" Then to see what the current setting is use the highlight command.
" For example,
"   :hi Cursor
" gives
"   Cursor         xxx guifg=bg guibg=fg


" --------------------------------
set background=dark
" - or ---------------------------
"set background=light
" --------------------------------

highlight clear
if exists("syntax_on")
    syntax reset
endif
let colors_name = "jrann-color"

"----------------------------------------------------------------
" General settings                                              |
"----------------------------------------------------------------
"----------------------------------------------------------------
" Syntax group   | Foreground    | Background    | Style        |
"----------------------------------------------------------------

" --------------------------------
" Editor settings
" --------------------------------
hi Normal          ctermfg=252     ctermbg=none    cterm=none      guifg=#e3e0d7   guibg=#10252b   gui=none
hi Cursor          ctermfg=234     ctermbg=228     cterm=none      guifg=#242424   guibg=#eae788   gui=none
hi CursorLine      ctermfg=none    ctermbg=236     cterm=none                      guibg=#32322f
hi LineNr          ctermfg=241     ctermbg=232     cterm=none      guifg=#857b6f   guibg=#080808   gui=none
hi CursorLineNR    ctermfg=white   ctermbg=17      cterm=none      guifg=white     guibg=#00005f   gui=none

" -----------------
" - Number column -
" -----------------
"hi CursorColumn    ctermfg=none    ctermbg=none    cterm=none
"hi FoldColumn      ctermfg=none    ctermbg=none    cterm=none
"hi SignColumn      ctermfg=none    ctermbg=none    cterm=none
"hi Folded          ctermfg=none    ctermbg=none    cterm=none

" -------------------------
" - Window/Tab delimiters -
" -------------------------
hi VertSplit       ctermfg=238     ctermbg=238     cterm=none      guifg=#444444   guibg=#444444   gui=none
"hi ColorColumn     ctermfg=none    ctermbg=none    cterm=none
"hi TabLine         ctermfg=none    ctermbg=none    cterm=none
"hi TabLineFill     ctermfg=none    ctermbg=none    cterm=none
"hi TabLineSel      ctermfg=none    ctermbg=none    cterm=none

" -------------------------------
" - File Navigation / Searching -
" -------------------------------
"hi Directory       ctermfg=none    ctermbg=none    cterm=none
hi Search          ctermfg=black   ctermbg=red     cterm=none      guifg=wheat     guibg=peru 
"hi IncSearch       ctermfg=none    ctermbg=none    cterm=none

" -----------------
" - Prompt/Status -
" -----------------
hi StatusLine      ctermfg=230     ctermbg=238     cterm=none      guifg=#ffffd7   guibg=#444444   gui=italic
hi StatusLineNC    ctermfg=241     ctermbg=238     cterm=none      guifg=#857b6f   guibg=#444444   gui=none
"hi WildMenu        ctermfg=none    ctermbg=none    cterm=none
"hi Question        ctermfg=none    ctermbg=none    cterm=none
hi Title           ctermfg=230                     cterm=bold      guifg=#ffffd7                   gui=bold
"hi ModeMsg         ctermfg=none    ctermbg=none    cterm=none
"hi MoreMsg         ctermfg=none    ctermbg=none    cterm=none

" --------------
" - Visual aid -
" --------------
hi MatchParen      ctermfg=228     ctermbg=101     cterm=bold      guifg=#eae788   guibg=#857b6f   gui=bold
hi Visual          ctermfg=251     ctermbg=239     cterm=none      guifg=#c3c6ca   guibg=#554d4b   gui=none
hi VisualNOS       ctermfg=251     ctermbg=236     cterm=none      guifg=#c3c6ca   guibg=#303030   gui=none
hi NonText         ctermfg=none    ctermbg=none    cterm=none                      guibg=#00151b   gui=none

hi Todo            ctermfg=228     ctermbg=17      cterm=none      guifg=#ffff87   guibg=#00005f   gui=none
hi Underlined      ctermfg=none    ctermbg=none    cterm=underline                                 gui=underline
hi Error           ctermfg=white   ctermbg=196     cterm=none      guifg=#ffffff   guibg=#ff0000   gui=none
"hi ErrorMsg        ctermfg=none    ctermbg=none    cterm=none
"hi WarningMsg      ctermfg=none    ctermbg=none    cterm=none
"hi Ignore          ctermfg=none    ctermbg=none    cterm=none
"hi SpecialKey      ctermfg=none    ctermbg=none    cterm=none

" --------------------------------
" Variable types
" --------------------------------
hi Constant        ctermfg=173                     cterm=none      guifg=#e5786d                   gui=none
hi String          ctermfg=113                     cterm=none      guifg=#95e454                   gui=italic
"hi StringDelimiter ctermfg=none    ctermbg=none    cterm=none
"hi Character       ctermfg=none    ctermbg=none    cterm=none
hi Number          ctermfg=173                     cterm=none      guifg=#e5786d                   gui=none
"hi Boolean         ctermfg=none    ctermbg=none    cterm=none
"hi Float           ctermfg=none    ctermbg=none    cterm=none

hi Identifier      ctermfg=192                     cterm=none      guifg=#cae982                   gui=none
hi Function        ctermfg=192                     cterm=none      guifg=#cae982                   gui=none

" --------------------------------
" Language constructs
" --------------------------------
hi Statement       ctermfg=111                     cterm=none      guifg=#88b8f6                   gui=none
"hi Conditional     ctermfg=none    ctermbg=none    cterm=none
"hi Repeat          ctermfg=none    ctermbg=none    cterm=none
"hi Label           ctermfg=none    ctermbg=none    cterm=none
"hi Operator        ctermfg=none    ctermbg=none    cterm=none
hi Keyword         ctermfg=111                     cterm=none      guifg=#88b8f6                   gui=none
"hi Exception       ctermfg=none    ctermbg=none    cterm=none
hi Comment         ctermfg=246                     cterm=none      guifg=#9c998e                   gui=italic

hi Special         ctermfg=229                     cterm=none      guifg=#eadead                   gui=none
"hi SpecialChar     ctermfg=none    ctermbg=none    cterm=none
"hi Tag             ctermfg=none    ctermbg=none    cterm=none
"hi Delimiter       ctermfg=none    ctermbg=none    cterm=none
"hi SpecialComment  ctermfg=none    ctermbg=none    cterm=none
"hi Debug           ctermfg=none    ctermbg=none    cterm=none

" ----------
" - C like -
" ----------
hi PreProc         ctermfg=173                     cterm=none      guifg=#e5786d                   gui=none
"hi Include         ctermfg=none    ctermbg=none    cterm=none
"hi Define          ctermfg=none    ctermbg=none    cterm=none
"hi Macro           ctermfg=none    ctermbg=none    cterm=none
"hi PreCondit       ctermfg=none    ctermbg=none    cterm=none

hi Type            ctermfg=186                     cterm=none      guifg=#d4d987                   gui=none
"hi StorageClass    ctermfg=none    ctermbg=none    cterm=none
"hi Structure       ctermfg=none    ctermbg=none    cterm=none
"hi Typedef         ctermfg=none    ctermbg=none    cterm=none

" --------------------------------
" Diff
" --------------------------------
hi DiffAdd         ctermfg=193     ctermbg=65      cterm=none                      guibg=DarkBlue  gui=none
hi DiffChange      ctermfg=189     ctermbg=60      cterm=none                      guibg=DarkMagenta gui=none
hi DiffDelete      ctermfg=234     ctermbg=167     cterm=none      guifg=Blue      guibg=DarkCyan  gui=none
hi DiffText        ctermfg=234     ctermbg=110     cterm=none                      guibg=Red       gui=none

" --------------------------------
" Completion menu
" --------------------------------
"hi Pmenu           ctermfg=none    ctermbg=none    cterm=none
"hi PmenuSel        ctermfg=none    ctermbg=none    cterm=none
"hi PmenuSbar       ctermfg=none    ctermbg=none    cterm=none
"hi PmenuThumb      ctermfg=none    ctermbg=none    cterm=none

" --------------------------------
" Spelling
" --------------------------------
"hi SpellBad        ctermfg=none    ctermbg=none    cterm=none
"hi SpellCap        ctermfg=none    ctermbg=none    cterm=none
"hi SpellLocal      ctermfg=none    ctermbg=none    cterm=none
"hi SpellRare       ctermfg=none    ctermbg=none    cterm=none

"--------------------------------------------------------------------
" Specific settings                                                 |
"--------------------------------------------------------------------

