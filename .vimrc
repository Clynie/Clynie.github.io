set nocompatible
filetype off                  " required

"set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
" Plugin 'tpope/vim-fugitive'
" Plugin 'godlygeek/tabular'
" Plugin 'isnowfy/python-vim-instant-markdown'
" " Plugin 'plasitcboy/vim-markdown'
" Plugin 'SirVer/ultisnips'
" Plugin 'groenewege/vim-less'
" " Plugin 'andviro/flake8-vim'
" Plugin 'MarcWeber/vim-addon-mw-utils'
" Plugin 'tomtom/tlib_vim' 
" Plugin 'garbas/vim-snipmate'
Plugin 'Valloric/YouCompleteMe'


set cursorline		"highlight current line
highlight CursorLine guibg=lightgrey
autocmd InsertEnter * highlight CursorLine guibg=#000050 guifg=fg
autocmd InsertLeave * highlight CursorLine guibg=#004000 guifg=fg
set cursorcolumn	"highlight current column
highlight ColorColumn guibg=lightgrey
autocmd InsertEnter * highlight CursorColumn ctermfg=White ctermbg=Yellow cterm=NONE guifg=White guibg=#D0104C   gui=bold
autocmd InsertLeave * highlight CursorColumn ctermfg=Black ctermbg=Yellow cterm=NONE guifg=Black guibg=#2EA9DF   gui=bold
" autocmd InsertEnter * highlight CursorColumn ctermfg=White ctermbg=#D0104C cterm=NONE guifg=White guibg=lightgrey gui=bold
" autocmd InsertLeave * highlight CursorColumn ctermfg=Black ctermbg=#2EA9DF cterm=NONE guifg=Black guibg=#000000   gui=bold




" 
syntax on
syntax enable
set backspace=2
" 
" " Fisa-vim-config
" " http://fisadev.github.io/fisa-vim-config/
" " version: 8.3.1
" 
" " ============================================================================
" " Vim-plug initialization
" " Avoid modify this section, unless you are very sure of what you are doing
" 
" let vim_plug_just_installed = 0
" let vim_plug_path = expand('~/.vim/autoload/plug.vim')
" if !filereadable(vim_plug_path)
"     echo "Installing Vim-plug..."
"     echo ""
"     silent !mkdir -p ~/.vim/autoload
"     silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
"     let vim_plug_just_installed = 1
" endif
" 
" " manually load vim-plug the first time
" if vim_plug_just_installed
"     :execute 'source '.fnameescape(vim_plug_path)
" endif
" 
" " Obscure hacks done, you can now modify the rest of the .vimrc as you wish :)
" 
" " ============================================================================
" " Active plugins
" " You can disable or add new ones here:
" 
" " this needs to be here, so vim-plug knows we are declaring the plugins we
" " want to use
" call plug#begin('~/.vim/plugged')
" 
" " Plugins from github repos:
" 
" " Override configs by directory 
" Plug 'arielrossanigo/dir-configs-override.vim'
" " Better file browser
" Plug 'scrooloose/nerdtree'
" " Code commenter
" Plug 'scrooloose/nerdcommenter'
" " Class/module browser
" Plug 'majutsushi/tagbar'
" " Code and files fuzzy finder
" Plug 'ctrlpvim/ctrlp.vim'
" " Extension to ctrlp, for fuzzy command finder
" " Plug 'fisadev/vim-ctrlp-cmdpalette'
" " Zen coding
" Plug 'mattn/emmet-vim'
" " Git integration
" Plug 'motemen/git-vim'
" " Tab list panel
" Plug 'kien/tabman.vim'
" " Airline
" Plug 'vim-airline/vim-airline'
" Plug 'vim-airline/vim-airline-themes'
" " Terminal Vim with 256 colors colorscheme
" " Plug 'fisadev/fisa-vim-colorscheme'
" " Consoles as buffers
" Plug 'rosenfeld/conque-term'
" " Pending tasks list
" " Plug 'fisadev/FixedTaskList.vim'
" " Surround
" Plug 'tpope/vim-surround'
" " Autoclose
" Plug 'Townk/vim-autoclose'
" " Indent text object
" Plug 'michaeljsmith/vim-indent-object'
" " Indentation based movements
" Plug 'jeetsukumaran/vim-indentwise'
" " Python autocompletion, go to definition.
" " Plug 'davidhalter/jedi-vim'
" " Better autocompletion
" Plug 'Shougo/neocomplcache.vim'
" " Snippets manager (SnipMate), dependencies, and snippets repo
" Plug 'MarcWeber/vim-addon-mw-utils'
" Plug 'tomtom/tlib_vim'
" Plug 'honza/vim-snippets'
" Plug 'garbas/vim-snipmate'
" " Git/mercurial/others diff icons on the side of the file lines
" Plug 'mhinz/vim-signify'
" " Automatically sort python imports
" "
" " Plug 'fisadev/vim-isort'
" "
" " Drag visual blocks arround
" " Plug 'fisadev/dragvisuals.vim'
" " Window chooser
" Plug 't9md/vim-choosewin'
" " Python and other languages code checker
" Plug 'scrooloose/syntastic'
" " Paint css colors with the real color
" Plug 'lilydjwg/colorizer'
" " Ack code search (requires ack installed in the system)
" Plug 'mileszs/ack.vim'
" if has('python')
"     " YAPF formatter for Python
"     Plug 'pignacio/vim-yapf-format'
" endif
" " Relative numbering of lines (0 is the current line)
" " (disabled by default because is very intrusive and can't be easily toggled
" " on/off. When the plugin is present, will always activate the relative 
" " numbering every time you go to normal mode. Author refuses to add a setting 
" " to avoid that)
" " Plug 'myusuf3/numbers.vim'
" 
" " Plugins from vim-scripts repos:
" 
" " Search results counter
" Plug 'vim-scripts/IndexedSearch'
" " XML/HTML tags navigation
" Plug 'vim-scripts/matchit.zip'
" " Gvim colorscheme
" Plug 'vim-scripts/Wombat'
" " Yank history navigation
" Plug 'vim-scripts/YankRing.vim'
" 
" Plug 'altercation/vim-colors-solarized'
" " Tell vim-plug we finished declaring plugins, so it can load them
" call plug#end()
" 
" " ============================================================================
" " Install plugins the first time vim runs
" 
" if vim_plug_just_installed
"     echo "Installing Bundles, please ignore key map error messages"
"     :PlugInstall
" endif
" 
" " ============================================================================
" " Vim settings and mappings
" " You can edit them as you wish
" 
" " no vi-compatible
" set nocompatible
" 
" " allow plugins by file type (required for plugins!)
" filetype plugin on
" filetype indent on
" 
" " " tabs and spaces handling
" " set expandtab
" " set tabstop=4
" " set softtabstop=4
" " set shiftwidth=4
" 
" "  " tab length exceptions on some file types
" " autocmd FileType html setlocal shiftwidth=4 tabstop=4 softtabstop=4
" " autocmd FileType htmldjango setlocal shiftwidth=4 tabstop=4 softtabstop=4
" " autocmd FileType javascript setlocal shiftwidth=4 tabstop=4 softtabstop=4
" 
" always show status bar
set ls=2

" incremental search
set incsearch
" highlighted search results
set hlsearch
" 
" " syntax highlight on
syntax on

" show line numbers
" set nu
" 
" " tab navigation mappings
" map tn :tabn<CR>
" map tp :tabp<CR>
" map tm :tabm 
" map tt :tabnew 
" map ts :tab split<CR>
" map <C-S-Right> :tabn<CR>
" imap <C-S-Right> <ESC>:tabn<CR>
" map <C-S-Left> :tabp<CR>
" imap <C-S-Left> <ESC>:tabp<CR>
" 
" " navigate windows with meta+arrows
" map <M-Right> <c-w>l
" map <M-Left> <c-w>h
" map <M-Up> <c-w>k
" map <M-Down> <c-w>j
" imap <M-Right> <ESC><c-w>l
" imap <M-Left> <ESC><c-w>h
" imap <M-Up> <ESC><c-w>k
" imap <M-Down> <ESC><c-w>j
" 
" " old autocomplete keyboard shortcut
" imap <C-J> <C-X><C-O>
" 
" " Comment this line to enable autocompletion preview window
" " (displays documentation related to the selected completion option)
" " Disabled by default because preview makes the window flicker
" set completeopt-=preview
" 
" " save as sudo
" ca w!! w !sudo tee "%"
" 
" " simple recursive grep
" nmap ,r :Ack 
" nmap ,wr :Ack <cword><CR>
" 
" use 256 colors when possible
if (&term =~? 'mlterm\|xterm\|xterm-256\|screen-256') || has('nvim')
    set background=dark
    " let &t_Co = 256
    " colorscheme fisa
    syntax enable
    " let g:solarized_termcolors=256
    colorscheme solarized
    " colorscheme delek
else
    colorscheme delek
endif
" 
" " colors for gvim
" if has('gui_running')
"     colorscheme wombat
" endif
" syntax enable
" 
" " when scrolling, keep cursor 3 lines away from screen border
" set scrolloff=3
" 
" " autocompletion of files and commands behaves like shell
" " (complete only the common part, list the options that match)
" set wildmode=list:longest
" 
" " better backup, swap and undos storage
" set directory=~/.vim/dirs/tmp     " directory to place swap files in
" set backup                        " make backup files
" set backupdir=~/.vim/dirs/backups " where to put backup files
" set undofile                      " persistent undos - undo after you re-open the file
" set undodir=~/.vim/dirs/undos
" set viminfo+=n~/.vim/dirs/viminfo
" " store yankring history file there too
" let g:yankring_history_dir = '~/.vim/dirs/'
" 
" " create needed directories if they don't exist
" if !isdirectory(&backupdir)
"     call mkdir(&backupdir, "p")
" endif
" if !isdirectory(&directory)
"     call mkdir(&directory, "p")
" endif
" if !isdirectory(&undodir)
"     call mkdir(&undodir, "p")
" endif
" 
" " ============================================================================
" " Plugins settings and mappings
" " Edit them as you wish.
" 
" " Tagbar ----------------------------- 
" 
" " toggle tagbar display
" map <F4> :TagbarToggle<CR>
" " autofocus on tagbar open
" let g:tagbar_autofocus = 1
" 
" " NERDTree ----------------------------- 
" 
" " toggle nerdtree display
" map <F3> :NERDTreeToggle<CR>
" " open nerdtree with the current file selected
" nmap ,t :NERDTreeFind<CR>
" " don;t show these file types
" let NERDTreeIgnore = ['\.pyc$', '\.pyo$']
" 
" 
" " Tasklist ------------------------------
" 
" " show pending tasks list
" map <F2> :TaskList<CR>
" 
" " CtrlP ------------------------------
" 
" " file finder mapping
" let g:ctrlp_map = ',e'
" " tags (symbols) in current file finder mapping
" nmap ,g :CtrlPBufTag<CR>
" " tags (symbols) in all files finder mapping
" nmap ,G :CtrlPBufTagAll<CR>
" " general code finder in all files mapping
" nmap ,f :CtrlPLine<CR>
" " recent files finder mapping
" nmap ,m :CtrlPMRUFiles<CR>
" " commands finder mapping
" nmap ,c :CtrlPCmdPalette<CR>
" " to be able to call CtrlP with default search text
" function! CtrlPWithSearchText(search_text, ctrlp_command_end)
"     execute ':CtrlP' . a:ctrlp_command_end
"     call feedkeys(a:search_text)
" endfunction
" " same as previous mappings, but calling with current word as default text
" nmap ,wg :call CtrlPWithSearchText(expand('<cword>'), 'BufTag')<CR>
" nmap ,wG :call CtrlPWithSearchText(expand('<cword>'), 'BufTagAll')<CR>
" nmap ,wf :call CtrlPWithSearchText(expand('<cword>'), 'Line')<CR>
" nmap ,we :call CtrlPWithSearchText(expand('<cword>'), '')<CR>
" nmap ,pe :call CtrlPWithSearchText(expand('<cfile>'), '')<CR>
" nmap ,wm :call CtrlPWithSearchText(expand('<cword>'), 'MRUFiles')<CR>
" nmap ,wc :call CtrlPWithSearchText(expand('<cword>'), 'CmdPalette')<CR>
" " don't change working directory
" let g:ctrlp_working_path_mode = 0
" " ignore these files and folders on file finder
" let g:ctrlp_custom_ignore = {
"   \ 'dir':  '\v[\/](\.git|\.hg|\.svn|node_modules)$',
"   \ 'file': '\.pyc$\|\.pyo$',
"   \ }
" 
" " Syntastic ------------------------------
" 
" " show list of errors and warnings on the current file
" nmap <leader>e :Errors<CR>
" " check also when just opened the file
" let g:syntastic_check_on_open = 1
" " don't put icons on the sign column (it hides the vcs status icons of signify)
" let g:syntastic_enable_signs = 0
" " custom icons (enable them if you use a patched font, and enable the previous 
" " setting)
" "let g:syntastic_error_symbol = '✗'
" "let g:syntastic_warning_symbol = '⚠'
" "let g:syntastic_style_error_symbol = '✗'
" "let g:syntastic_style_warning_symbol = '⚠'
" 
" " Jedi-vim ------------------------------
" 
" " All these mappings work only for python code:
" " Go to definition
" " let g:jedi#goto_command = ',d'
" " " Find ocurrences
" " let g:jedi#usages_command = ',o'
" " " Find assignments
" " let g:jedi#goto_assignments_command = ',a'
" " " Go to definition in new tab
" " nmap ,D :tab split<CR>:call jedi#goto()<CR>
" 
" " NeoComplCache ------------------------------
" 
" " most of them not documented because I'm not sure how they work
" " (docs aren't good, had to do a lot of trial and error to make 
" " it play nice)
" let g:neocomplcache_enable_at_startup = 1
" let g:neocomplcache_enable_ignore_case = 1
" let g:neocomplcache_enable_smart_case = 1
" let g:neocomplcache_enable_auto_select = 1
" let g:neocomplcache_enable_fuzzy_completion = 1
" let g:neocomplcache_enable_camel_case_completion = 1
" let g:neocomplcache_enable_underbar_completion = 1
" let g:neocomplcache_fuzzy_completion_start_length = 1
" let g:neocomplcache_auto_completion_start_length = 1
" let g:neocomplcache_manual_completion_start_length = 1
" let g:neocomplcache_min_keyword_length = 1
" let g:neocomplcache_min_syntax_length = 1
" " complete with workds from any opened file
" let g:neocomplcache_same_filetype_lists = {}
" let g:neocomplcache_same_filetype_lists._ = '_'
" 
" " TabMan ------------------------------
" 
" " mappings to toggle display, and to focus on it
" let g:tabman_toggle = 'tl'
" let g:tabman_focus  = 'tf'
" 
" " Autoclose ------------------------------
" 
" " Fix to let ESC work as espected with Autoclose plugin
" let g:AutoClosePumvisible = {"ENTER": "\<C-Y>", "ESC": "\<ESC>"}
" 
" " DragVisuals ------------------------------
" 
" " mappings to move blocks in 4 directions
" vmap <expr> <S-M-LEFT> DVB_Drag('left')
" vmap <expr> <S-M-RIGHT> DVB_Drag('right')
" vmap <expr> <S-M-DOWN> DVB_Drag('down')
" vmap <expr> <S-M-UP> DVB_Drag('up')
" " mapping to duplicate block
" vmap <expr> D DVB_Duplicate()
" 
" " Signify ------------------------------
" 
" " this first setting decides in which order try to guess your current vcs
" " UPDATE it to reflect your preferences, it will speed up opening files
" let g:signify_vcs_list = [ 'git', 'hg' ]
" " mappings to jump to changed blocks
" nmap <leader>sn <plug>(signify-next-hunk)
" nmap <leader>sp <plug>(signify-prev-hunk)
" " nicer colors

highlight DiffDelete        cterm=bold ctermbg=none ctermfg=167
highlight DiffChange        cterm=bold ctermbg=none ctermfg=227
highlight SignifySignAdd    cterm=bold ctermbg=237  ctermfg=119
highlight SignifySignDelete cterm=bold ctermbg=237  ctermfg=167
highlight SignifySignChange cterm=bold ctermbg=237  ctermfg=227
" 
" " Window Chooser ------------------------------
" 
" " mapping
" nmap  -  <Plug>(choosewin)
" " show big letters
" let g:choosewin_overlay_enable = 1
" 
" " Airline ------------------------------
" 
" let g:airline_powerline_fonts = 0
" let g:airline_theme = 'bubblegum'
" let g:airline#extensions#whitespace#enabled = 0
" 
" 
" " to use fancy symbols for airline, uncomment the following lines and use a
" " patched font (more info on the README.rst)
" "if !exists('g:airline_symbols')
" "   let g:airline_symbols = {}
" "endif
" "let g:airline_left_sep = '⮀'
" "let g:airline_left_alt_sep = '⮁'
" "let g:airline_right_sep = '⮂'
" "let g:airline_right_alt_sep = '⮃'
" "let g:airline_symbols.branch = '⭠'
" "let g:airline_symbols.readonly = '⭤'
" "let g:airline_symbols.linenr = '⭡'
" "
" 
" 
" 
" 
" let g:vim_isort_map='<C-i>'
" let g:vim_isort_python_version='python2'
au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif


auto BufNewFile *.ncl,*.bsh,*.py exec ":call SetTitle()" | normal G 
func SetTitle()  
    if expand("%:e") == 'bsh' 
        call setline(1,          "\#!/bin/bash") 
        call append(line("."),   "\#========================================================================") 
        call append(1, "\#|---------------------File Name: ".expand("%")."------------------------|")
        call append(2, "\#========================================================================") 
        call append(3, "\#      Script Usage: ") 
        call append(4, "\#        Created by: ---------- Xianglin DAI ----------- ") 
        call append(5, "\#                             Ph.D. Candidate ") 
        call append(6, "\#                    School of Atmospheric Sciences ") 
        call append(7, "\#                    Email: lyniedairce@smail.nju.edu.cn ") 
        call append(8, "\#                    ----- Nanjing University ----- ") 
        call append(9, "\#                                                   ") 
        call append(10,"\# Records of Revisions:                             ") 
        call append(11,"\#    Date      Programmer    Description of change    ") 
        call append(12,"\# ==========   ==========    =====================    ") 
        call append(13,"\# ".strftime("%d/%m/%Y")."   Xianglin DAI        V.1.0                    ") 
        call append(14,"\#========================================================================") 
        call append(15,"")
    endif
 
    if expand("%:e") == 'py' 
        call setline(1,          "\# ========================================================================") 
        call append(line("."),   "\# |---------------------File Name: ".expand("%")."------------------------| ")
        call append(1, "\# ========================================================================") 
        call append(2, "\#       Script Usage: ") 
        call append(3, "\#         Created by: ---------- Xianglin DAI ----------- ") 
        call append(4, "\#                              Ph.D. Candidate ") 
        call append(5, "\#                     School of Atmospheric Sciences ") 
        call append(6, "\#                     Email: lyniedairce@smail.nju.edu.cn ") 
        call append(7, "\#                     ----- Nanjing University ----- ") 
        call append(8, "\#                                                    ") 
        call append(9, "\#  Records of Revisions:                             ") 
        call append(10, "\#     Date      Programmer    Description of change    ") 
        call append(11, "\#  ==========   ==========    =====================    ") 
        call append(12, "\#  ".strftime("%d/%m/%Y")."   Xianglin DAI        V.1.0                    ") 
        call append(13, "\# ========================================================================") 

        call append(15, "import numpy as np") 
        call append(16, "import scipy as sp") 
        call append(17, "") 
        call append(18, "") 
        call append(19, "import time") 
        call append(20, "def tic():") 
        call append(21, "    globals()['tt'] = time.clock()") 
        call append(22, "") 
        call append(23, "") 
        call append(24, "def toc():") 
        call append(25, "    print('\\nElapsd time: %.8 second' % (time.clock()-globals()['tt']))") 
        call append(26, "") 
        call append(27, "") 
        call append(28, "") 
        call append(29, "") 
        call append(30, "class class_name(object):") 
        call append(31, "") 
        call append(32, "") 
        call append(33, "") 
        call append(34, "    def __init__(self,parameters):") 
        call append(35, "        \"\"\"") 
        call append(36, "") 
        call append(37, "        An object that deals with XXX") 
        call append(38, "        \"\"\"") 
        call append(39, "") 
        call append(40, "") 
        call append(41, "        self.parameters=parameters") 
        call append(42, "") 
        call append(43, "") 
        call append(44, "        return self") 
        call append(45, "") 
        call append(46, "") 
        call append(47, "") 
        call append(48, "    def function(self,parameters):") 
        call append(49, "       \"\"\"") 
        call append(50, "") 
        call append(51, "        An object that deals with XXX") 
        call append(52, "        \"\"\"") 
        call append(53, "") 
        call append(54, "") 
        call append(55, "        self.parameters=parameters") 
        call append(56, "") 
        call append(57, "") 
        call append(58, "        return self") 
        call append(59, "") 
        call append(60, "") 
        call append(61, "if __name__ ==\"main\":") 
        call append(62, "") 
        call append(63, "") 
        call append(64, "") 
        call append(65, "") 
        call append(66, "") 
        call append(67, "") 
        call append(68, "    class_name().function() ") 
        call append(69, "") 
        call append(70, "") 
        call append(71, "") 
        call append(72, "") 
        call append(73, "\# PLEASE DO CHOOSE ONE OF STYLE YOU LIKE CLASS() OR MAIN()") 
        call append(74, "") 
        call append(75, "") 
        call append(76, "") 
        call append(77, "def function(self):") 
        call append(78, "") 
        call append(79, "    import package ") 
        call append(80, "") 
        call append(81, "    print(\"Hello world\")) ") 
        call append(82, "") 
        call append(83, "    return result ") 
        call append(84, "") 
        call append(85, "") 
        call append(86, "") 
        call append(87, "def main():") 
        call append(88, "") 
        call append(89, "    import package") 
        call append(90, "") 
        call append(91, "") 
        call append(92, "    result = function(parameters)") 
        call append(93, "    return result") 
        call append(94, "") 
        call append(95, "") 
        call append(96, "") 
        call append(97, "if __name__ ==__\"main\"__:") 
        call append(98, "") 
        call append(99, "    main()") 
        call append(100, "") 
        call append(101, "") 
    endif
 
    if expand("%:e") == 'ncl' 
        call setline(1,          "\;========================================================================") 
        call append(line("."),   "\;|---------------------File Name: ".expand("%")."------------------------| ")
        call append(1, "\;========================================================================") 
        call append(2, "\;      Script Usage: ") 
        call append(3, "\;        Created by: ---------- Xianglin DAI ----------- ") 
        call append(4, "\;                             Ph.D. Candidate ") 
        call append(5, "\;                    School of Atmospheric Sciences ") 
        call append(6, "\;                    Email: lyniedairce@smail.nju.edu.cn ") 
        call append(7, "\;                    ----- Nanjing University ----- ") 
        call append(8, "\;                                                   ") 
        call append(9, "\; Records of Revisions:                             ") 
        call append(10,"\;    Date      Programmer    Description of change    ") 
        call append(11,"\; ==========   ==========    =====================    ") 
        call append(12,"\; ".strftime("%d/%m/%Y")."   Xianglin DAI        V.1.0                    ") 
        call append(13,"\;========================================================================") 
        call append(14, "") 
        
        call append(15,"\load \"$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_code.ncl\"") 
        call append(16,"\load \"$NCARG_ROOT/lib/ncarg/nclscripts/csm/contributed.ncl\"") 
        call append(17,"\load \"$NCARG_ROOT/lib/ncarg/nclscripts/wrf/WRF_contributed.ncl\"") 
        call append(18,"\load \"$NCARG_ROOT/lib/ncarg/nclscripts/wrf/WRFUserARW_wuyang.ncl\"") 
        call append(19,"\load \"/data1/yangw/Candidates/My_NCLScripts/Geo_enhancements.ncl\"") 
        call append(20,"\load \"/data1/yangw/Candidates/My_NCLScripts/gsn_code_zqzhang.ncl\"") 
        call append(21,"\load \"/data1/yangw/Candidates/My_NCLScripts/ncl_code_yangwu.ncl\"") 
        call append(22, "") 
      
        call append(23, "begin") 
        call append(24, "") 
        call append(25, "    start_time = get_cpu_time()") 
        call append(26, ";========================================================================") 
        call append(27, ";User Defined Parameters                                                 ") 
        call append(28, ";========================================================================") 
        call append(29, "") 
        call append(30, ";========================================================================") 
        call append(31, ";Read and Handle Data                                                    ") 
        call append(32, ";========================================================================") 
        call append(33, "") 
        call append(34, ";========================================================================") 
        call append(35, ";Plotting Stage                                                          ") 
        call append(36, ";========================================================================") 
        call append(37, "") 
        call append(38, ";========================================================================") 
        call append(39, ";Outputting Stage                                                        ") 
        call append(40, ";========================================================================") 
        call append(41, "") 
        call append(42, ";========================================================================") 
        call append(43, "    end_time = get_cpu_time()") 
        call append(44, "    print(\"\")") 
        call append(45, "    print(\" Script Processing Time : \"+(end_time-start_time)+\" !!!\")") 
        call append(46, "") 
        call append(47, "end") 
     
    endif

endfunc

