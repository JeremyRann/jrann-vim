" To use:
"
" git clone https://github.com/JeremyRann/jrann-vim.git ~/.vim
" or 
" cd ~/
" mkdir -p .vim/{colors,vimfiles}
" Copy this script to .vim/vimfiles/jrann.vim
" Copy jrann-color.vim to .vim/colors
"
" git clone https://github.com/VundleVim/Vundle.vim.git .vim/bundle/Vundle.vim
" (TODO: create Vundle for the colors)
" Add one line to .vimrc:
" source ~/.vim/vimfiles/jrann.vim
" Reopen vim and run
" :PluginInstall
" You can also add something like this beforehand to change the base directory:
" let g:MYCONFHomeDir = globpath("~/", "newvimhome")
" Another option is to enable xclip integration:
" let g:MYCONFXClipIntegration=1
" Alternatively, you can specify a port for js-cliboard-share integration:
" let g:MYCONFJSClipShareIntegration=3242
" A great option for systems using Mintty or Putty or something is improved mouse support:
" if !has("gui_running")
"    set ttymouse=xterm2
" endif
" (TODO: figure out way to determine if that should be set dynamically)
set nocompatible              " be iMproved, required
set nomodeline
filetype off                  " required

if !exists("g:MYCONFHomeDir")
    let g:MYCONFHomeDir=globpath("~/", ".vim")
endif

if !exists("g:MYCONFXClipIntegration")
    let g:MYCONFXClipIntegration=0
endif

if !exists("g:MYCONFJSClipShareIntegration")
    let g:MYCONFJSClipShareIntegration=0
endif

" Create directories needed for vim to function as configured
let s:targetDirs = ['backup', 'swap', 'undo']

for targetDir in s:targetDirs
    " use globpath(something, '') to add / or \ to the end of the path as appropriate
    if (!isdirectory(globpath(g:MYCONFHomeDir, '') . targetDir))
        call mkdir(globpath(g:MYCONFHomeDir, '') . targetDir)
    endif
endfor

" set the runtime path to include Vundle and initialize
let vundleLocation=globpath(g:MYCONFHomeDir, "bundle/Vundle.vim")
execute "set rtp+=".vundleLocation
"set rtp+=expand()
call vundle#begin(globpath(g:MYCONFHomeDir, "vimfiles"))
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'bling/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'leafgarland/typescript-vim'
Plugin 'scrooloose/nerdtree'
Plugin 'moll/vim-bbye'
Plugin 'flazz/vim-colorschemes'
Plugin 'posva/vim-vue'
Plugin 'mustache/vim-mustache-handlebars'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
"Plugin 'tpope/vim-fugitive'
"" plugin from http://vim-scripts.org/vim/scripts.html
"Plugin 'L9'
"" Git plugin not hosted on GitHub
"Plugin 'git://git.wincent.com/command-t.git'
"" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'
"" The sparkup vim script is in a subdirectory of this repo called vim.
"" Pass the path to set the runtimepath properly.
"Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
"" Avoid a name conflict with L9
"Plugin 'user/L9', {'name': 'newL9'}

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

:syntax on
set number

if !has("gui_running")
    "Remove insert/escape mode timeout
    set timeoutlen=250 ttimeoutlen=0

    " Detect 256-color console (in other words not cmd)
    if &t_Co >= 256
        " Set up vertical vs block cursor for insert/normal mode
        if &term =~ "screen."
            let &t_ti.="\eP\e[1 q\e\\"
            let &t_SI.="\eP\e[5 q\e\\"
            let &t_EI.="\eP\e[1 q\e\\"
            let &t_te.="\eP\e[0 q\e\\"
        else
            let &t_ti.="\<Esc>[1 q"
            let &t_SI.="\<Esc>[5 q"
            let &t_EI.="\<Esc>[1 q"
            let &t_te.="\<Esc>[0 q"
        endif
    endif

    " Escape hack for posterity
    "let &t_ti.="\eP\e[1 q\e[?7727h\e\\"
    "let &t_SI.="\eP\e[5 q\e\\"
    "let &t_EI.="\eP\e[1 q\e\\"
    "let &t_te.="\eP\e[0 q\e[?7727l\e\\"
    "" Remove esc delay
    "noremap <Esc>O[ <Esc>
    "noremap! <Esc>O[ <Esc
else
    " NERDTree does annoying things with scrollbars; this
    " disables vertical scroll on NERDTree open
    set guioptions-=L
    " Disable right scrollbar
    set guioptions-=r
    " Disable tearable menues
    set guioptions-=t
    " Disable toolbar
    set guioptions-=T
    " Hack to detect Windows gvim
    if filereadable("C:/Program Files (x86)/Vim/_vimrc")
        source C:\Program Files (x86)\Vim\_vimrc
        set guifont=Consolas:h14:cANSI
    endif
    if filereadable("C:/Program Files/Vim/_vimrc")
        source C:\Program Files\Vim\_vimrc
        set guifont=Consolas:h14:cANSI
    endif
endif

" Note that colorscheme has to happen after reading _vimrc for windows, since that sets a few style options
if !has("gui_running") && &t_Co < 256
    " For cmd and PowerShell
    colorscheme desert
"elseif &diff
"    try | colorscheme hybrid_material | catch | colorscheme desert | endtry
else
    "source ~/.vim/jrann-color.vim
    colorscheme jrann-color
    "try | colorscheme wombat256mod | catch | colorscheme desert | endtry
    "" I'm not crazy about wombat's default background colors
    "hi Normal ctermbg=none guibg=#10252b
    "hi NonText ctermbg=none guibg=#00151b
    "" I'm also not crazy about wombat's default search colors (I'm picky)
    "hi Search guifg=wheat guibg=peru cterm=none ctermbg=red ctermfg=black
endif

" This is bold by default; squash that crap
hi ErrorMsg gui=none
" Also, italics? Really?
hi String gui=none
hi Comment gui=none
hi Todo gui=none
hi StatusLine gui=none

" Go ahead and wrap by default for diffs, and begin at the start of the buffer
" (note this causes problems on Cygwin; haven't taken time to debug yet)
"if &diff
    "autocmd FilterWritePre * execute 'windo set wrap'
    "autocmd FilterWritePre * execute 'call feedkeys("gg")'
"endif

" Set to highlight on insert mode and not otherwise
:autocmd InsertEnter * set cul
:autocmd InsertLeave * set nocul
" Set highlight colors/formatting
hi CursorLine term=bold cterm=none ctermbg=17 guibg=Grey20

" Always show status bar on bottom
set laststatus=2

" Disable automatic comments and word wrap
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o formatoptions-=t
" Read handlebars files (as if they're html)
autocmd BufRead,BufNewFile *.hbs setfiletype html
:set ic
:set is

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'

" Set NERDTree to open on the right by default
let g:NERDTreeWinPos = "right"

" Handle tabs more like Visual Studio
" size of a hard tabstop
set tabstop=4

" size of an "indent"
set shiftwidth=4

" always uses spaces instead of tab characters
set expandtab
" Don't ask to confirm when changing buffers
set hidden
" Highlight search results (:noh to unhighlight)
set hlsearch
" Automatically switch to case-sensitive search when caps are used
set smartcase
" Don't pollute the current working space, but keep those super-nifty features
" (see http://stackoverflow.com/questions/821902/disabling-swap-files-creation-in-vim)
execute "set backupdir=".globpath(g:MYCONFHomeDir, "backup").glob("/").glob("/")
execute "set directory=".globpath(g:MYCONFHomeDir, "swap").glob("/").glob("/")
execute "set undodir=".globpath(g:MYCONFHomeDir, "undo").glob("/").glob("/")
"set backupdir=$HOME/.vim/backup//
"set directory=$HOME/.vim/swap//
"set undodir=$HOME/.vim/undo//

" Since we've set up directories, go ahead and turn on backups
set backup
set writebackup

" Enable mouse support
set mouse=a

" Better command menu completion
set wildmenu
set wildmode=list:full

" Doesn't really disable clipboard support, just doesn't make + or * the default register
set clipboard=

" Set airline (tabbar) theme
let g:airline_theme='papercolor'

let g:JRANN_F5_command = ''

" TODO: Make this an external script
function SetF5() abort
    call inputsave()
    let g:JRANN_F5_command = input('Enter command: ')
    call inputrestore()
endfunction

function RunF5() abort
    let command = substitute(g:JRANN_F5_command, ' ', '', '')
    if command == ''
        call SetF5()
    endif
    let command = substitute(g:JRANN_F5_command, ' ', '', '')
    if command != ''
        execute 'silent !' . g:JRANN_F5_command
        execute 'redraw!'
    endif
endfunction

function s:DetermineGitRepo() abort
    let l:bufferPath = expand('%:p:h')
    " (https://stackoverflow.com/a/957978/2850538)
    let l:gitRepoPath = systemlist('git -C ' . l:bufferPath . ' rev-parse --show-toplevel')[0]
    if v:shell_error != 0
        echoerr v:shell_error
        return ''
    endif
    return l:gitRepoPath
endfunction

function s:DetectGitFiles(ArgLead, CmdLine, CursorPos) abort
    let l:gitRepoPath = s:DetermineGitRepo()
    let l:files = systemlist('git -C ' . l:gitRepoPath . ' ls-files')
    if (a:ArgLead !='')
        let l:fileIndex = len(l:files)
        while (l:fileIndex > 0)
            let l:fileIndex = l:fileIndex - 1
            if strridx(l:files[l:fileIndex], a:ArgLead) < 0
                call remove(l:files, l:fileIndex)
            endif
        endwhile
    endif
    return l:files
endfunction

function s:OpenGitFile(FileName) abort
    execute 'edit' globpath(s:DetermineGitRepo(), a:FileName)
endfunction

function s:GitGrep_Open(Line) abort
    if (strlen(a:Line) > 0)
        let l:fileName = split(a:Line, ":")[0]
        execute 'bd'
        call s:OpenGitFile(l:fileName)
    endif
endfunction

" Inspired by https://blog.semanticart.com/2017/01/05/lets-write-a-basic-vim-plugin/
function s:GitGrep(SearchString) abort
    let l:gitRepoPath = s:DetermineGitRepo()
    let l:results = systemlist('git -C ' . l:gitRepoPath . ' grep --untracked -F -i -n ' . a:SearchString)
    let l:splitName = '__git_grep_results__'

    if bufwinnr(l:splitName) > 0
        execute bufwinnr(l:splitName) . 'wincmd w'
    else
        execute 'split ' . l:splitName
    endif
    set modifiable
    " Clear out existing content
    normal! gg"_dG

    " Don't prompt to save the buffer
    set buftype=nofile
    set bufhidden=hide
    set noswapfile
    set nobuflisted
    set nowrap
    call append(0, l:results)
    set cul
    normal! gg
    :nnoremap <buffer> q :bd<cr>
    :nnoremap <buffer> <cr> :call <SID>GitGrep_Open(getline('.'))<cr>
    set nomodifiable
endfunction

" See :help cmdline-completion for tips on command auto-complete (like ctrl+D to see all)
command -nargs=1 -complete=customlist,s:DetectGitFiles GitOpen call s:OpenGitFile(<f-args>)
command -nargs=1 GitGrep call s:GitGrep(<f-args>)

" Custom mappings
" \c to copy to clipboard. Copy whole buffer if not in visual/selection mode, otherwise copy selection
if g:MYCONFJSClipShareIntegration != 0
    nmap <leader>c :%y "<cr>:call system("curl -X POST -H \"Content-Type: text/plain\" --data-binary @- http://localhost:" . g:MYCONFJSClipShareIntegration . "/setclipboard", @")<cr><cr>
    vmap <leader>c ""y:call system("curl -X POST -H \"Content-Type: text/plain\" --data-binary @- http://localhost:" . g:MYCONFJSClipShareIntegration . "/setclipboard", @")<cr><cr>
elseif g:MYCONFXClipIntegration
    nmap <leader>c :w !xclip<cr><cr>
    vmap <leader>c y:call system("xclip", @")<cr>
else
    nmap <leader>c :%y +<cr>
    vmap <leader>c "+y
endif
" New buffer
map <leader>n :enew<cr>
" Open NERDTree
map <leader>e :NERDTree<cr>
" Set directory to directory of current file THEN open NERDTree
map <leader>E :cd %:p:h<cr>:NERDTree<cr>
" Close buffer and keep split windows
map <leader>q :Bdelete<cr>
" Disregard changes, close buffer, and keep split windows (don't automatically send cr to allow confirmation)
map <leader>Q :Bdelete!
" Map \f n to "Fix .NERDTreeBookmarks (hideous hack for bug I don't feel like reporting or fixing myself)
map <leader>fn map <leader>f :%s/ \/c/ c:/g<CR>:%s/\//\\/g<CR>
" Disable auto-indent. There is no logical enable auto-indent since I don't know the original state.
" With some work, you could figure it out beforehand with something like :verbose set ai? cin? cink? cino? si? inde? indk?
" but I don't know the options very well (see http://vim.wikia.com/wiki/How_to_stop_auto_indenting)
" Note: I think I figured this out for most circumstances; use :setl cin? and you should see cindent enabled; use :setl nocin,
" then paste, then :setl cin.
map <leader>i :setl noai nocin nosi inde=<CR>
" F11, F12, F2, F3, F4 to prev buffer, next buffer, first buffer, last buffer, most recent buffer
map <F11> :bp<cr>
map <F12> :bn<cr>
map <F2> :bf<cr>
map <F3> :bl<cr>
map <F4> :b#<cr>
" F5 for my own F5 runner script
map <F5> :wall<cr>:call RunF5()<cr>
" Shift+Tab to unindent (curious that this isn't a default)
inoremap <S-Tab> <C-d>
" Changes how vim writes files; in my case, webpack's file watcher failed without this, but generally the behaviour is funky.
" By default, backupcopy=auto, which tells vim to do what it feels like. The other options are yes and no, where no renames the
" old file and writes a new one; yes makes a copy of the original and overwrites it.
set backupcopy=yes
" Unset ctrl+F as find in gvim
map <C-F> j
unmap <C-F>
" Fix highlighting getting out of sync
nmap <leader>z :syntax sync fromstart<CR>
nmap <leader>ff :GitOpen 
nmap <leader>fi :GitGrep 

