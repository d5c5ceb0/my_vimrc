"+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
"
" file name: vimrc - the Vim configuration file.
"
" Coperight(c), 2012 zhangwei. All Rights Reserved.
"
" author: zhangwei <d5c5ceb0@gmail.com>
"
"
" last version: 1.0.0  2012.03.10
" modify: 2016.03.27
"
"+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
"

"+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
"  Windows, Linux or macos
"  terminal or gui
"+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
let g:iswindows = 0
let g:islinux = 0
let g:ismacos = 0

if(has("win32") || has("win64") || has("win95") || has("win16"))
    let g:iswindows = 1
elseif(has("mac"))
	let g:ismacos = 1
else
	let g:islinux = 1
endif

if has("gui_running")
    let g:isGUI = 1
else
    let g:isGUI = 0
endif

"+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
" plugins
"+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
" vundle setting
set nocompatible              " be iMproved, vundle required
filetype off                  "vundle required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim 
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
"airline
Plugin 'bling/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
" tagbar
Plugin 'majutsushi/tagbar'
" nerdtree
Plugin 'scrooloose/nerdtree'
Plugin 'xuyuanp/nerdtree-git-plugin'
" mark-karkat
Plugin 'Mark--Karkat'
" orgmode
Plugin 'jceb/vim-orgmode'
" ctrlp
Plugin 'ctrlpvim/ctrlp.vim'
" git
Plugin 'tpope/vim-fugitive'
" white space
Plugin 'ShowTrailingWhitespace'
" ultisnips
Plugin 'UltiSnips'
Plugin 'honza/vim-snippets'
" gitgutter
Plugin 'airblade/vim-gitgutter'
" syntastic
"Plugin 'scrooloose/syntastic'
" solarized
Plugin 'altercation/vim-colors-solarized' 
"vim-projectroot
Plugin 'dbakker/vim-projectroot'
"Yggdroot/indentLine
"Plugin 'Yggdroot/indentLine'
"fatih/vim-go
Plugin 'fatih/vim-go'
"plasticboy/vim-markdown
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
Plugin 'iamcco/mathjax-support-for-mkdp'
"Plugin 'iamcco/markdown-preview.vim'
Plugin 'sat1993/markdown-preview.vim'
"rizzatti/dash
Plugin 'rizzatti/dash.vim'
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

"+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
" basic setting
"+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
autocmd BufEnter * if expand('%:p') !~ '://' | :lchdir %:p:h | endif

"filetype plugin indent on                           "�����ļ����ͼ��
syntax on                                           "���﷨����
set t_Co=256                                        "������ɫ����
if (g:isGUI)
    set background=dark                             "ѡ��dark
    set background=light                           "ѡ��light
    let g:solarized_termcolors=16
	colorscheme solarized
else                                                "
    set background=dark                             "ѡ��dark
	let g:solarized_termcolors=16
	colorscheme solarized
endif                                               "
"set clipboard=unnamedplus                           "ʹ��ϵͳ���а�
set autoindent                                      "�Զ�����
set autoread                                        "���ļ����ⲿ����ı�ʱ�Զ�����
set autowrite                                       "���ļ�һ�иĶ����Զ�����
set backspace=indent,eol,start                      "ʹ��backspace��������indent��eol��start
set cindent                                         "�༭c�ļ�ʱʹ��c��������ʽ
set cinoptions=:0                                   "����c�ľ���������ʽ
"set lines=31 columns=73                             "vim��Ļ��������
set completeopt=longest,menuone                     "���ڲ���ģʽ�Ĳ�ȫ
set cursorline                                      "ͻ����ʾ��ǰ��
set encoding=utf-8                                  "vim�ڲ�ʹ�õı��뷽ʽ
"set fileencoding=chinese                            "�����ļ��������
set fileencoding=utf-8                            "�����ļ��������
set fileencodings=gb2312,utf-8,gbk,gb18030,chinese  "̽���ļ��ı��뷽ʽ������
set termencoding=utf-8                              "�����ն˱��뷽ʽ
if (g:iswindows)                                    "����˵�����
    set fileformat=dos                              "�������ļ���<EOL>��ʽ
elseif(g:islinux)
    set fileformat=unix                             "�������ļ���<EOL>��ʽ
else
    set fileformat=unix                             "�������ļ���<EOL>��ʽ
endif                                               "
set fileformats=unix,dos,mac                        "�����ļ���<EOL>��ʽ����
"set foldenable                                      "�����۵�
"set foldmethod=syntax                               "�۵�����
"set foldlevel=3                                     "�����۵�����
"set foldcolumn=0                                    "ָ����ȵ���
set helpheight=10                                   "�������ڵĳ�ʼ���߶�
set helplang=cn                                     "�����ĵ�������
set hidden                                          "����δ�����޸�ʱ�л�������
set history=100                                     "��ʷ����洢����
set hlsearch                                        "�򿪸�������
set ignorecase                                      "�������Դ�Сд
set incsearch                                       "����ʵʱƥ��
set smartcase                                       "�������ģʽ�а�����д��ĸ�������Դ�Сд
"set mouse=a                                         "����ģʽ����ʹ�����
set number                                          "��ʾ�к�
"set relativenumber                                  "relative number
set pumheight=10                                    "����ģʽ��ȫ������Ŀ�������
set ruler                                           "��ʾ���λ�õ��кź��к�
set scrolloff=5                                     "���ù�������б�������
"set expandtab                                       "��Tab��ת��Ϊ�ո�
set tabstop=4                                       "����Tab���Ŀ��
set shiftwidth=4                                    "����ʱ�Զ�����4���ո�
set smarttab                                        "ָ����һ��backspace��ɾ��shiftwidth��ȵĿո�
set showcmd                                         "����Ļ���һ����ʾ����
set smartindent                                     "��������
set textwidth=78                                    "�����ı������
"set whichwrap=h,l                                   "�����ƶ��������ƶ���������
set wildignore=*.bak,*.o,*.e,*~                     "�ļ�ģʽ���б�
set wildmenu                                        "�����в�ȫʹ����ǿģʽ
set wildmode=list:longest,full                      "ʹ��widecharָ�����ַ����õĲ�ȫģʽ
if (g:isGUI)
if (g:iswindows)
	set guifont=Bitstream_Vera_Sans_Mono:h10:cANSI
else
	set guifont=Monaco\ 10, Fira\ Mono\ Medium\ for\ Powerline\ 12
endif
else
	"ʹ��terminal����
endif
set wrap                                            "�Զ�����
set writebackup                                     "�����ļ�ǰ�������ݣ�����ɹ���ɾ���ñ���
set nobackup                                        "�����ޱ����ļ�
set noswapfile                                      "��������ʱ�ļ�
"set vb t_vb=                                       "�ر���ʾ��
"set go=menu                                        "�˵���
set go=                                             "�޲˵���������
set updatetime=250                                  "vim����ʱ��250ms
set shortmess=atI                                   "ȥ����ӭ����
"set showtabline=2                                  "��ʱ��ʾ��ǩҳ
set laststatus=2                                    "������ʾ״̬��
set statusline=[%f]\ [FORMAT=%{&ff}]                "״̬������
set statusline+=\ [TYPE=%Y]\ [POS=%l,%v]\ [%p%%]
set statusline+=%{strftime(\"%d/%m/%y\ -\ %H:%M\")}
if (g:iswindows && g:isGUI)                         "����˵�����
    source $VIMRUNTIME/delmenu.vim                  "����˵�����
    source $VIMRUNTIME/menu.vim                     "����˵�����
    language messages zh_CN.utf-8                   "���consle�������
endif                                               "
if g:isGUI                                          "���� gVim ���ڳ�ʼλ�ü���С
    "au GUIEnter * simalt ~x                        "��������ʱ�Զ����
    winpos 0 0                                      "ָ�����ڳ��ֵ�λ�ã�����ԭ������Ļ���Ͻ�
	set lines=666 columns=666                       "ָ�����ڴ�С��linesΪ�߶ȣ�columnsΪ���
endif
if (g:islinux)
"Copy contents of System Clipboard to + buffer when entering vim
"autocmd VimEnter * call setreg('+', system('xsel -ob'))
"Copy contents of + buffer to System Clipboard while leaving vim
"autocmd VimLeave * call system("xsel -ib", getreg('+'))
endif

""+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
""  keymap
""+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

" set mapleader
let mapleader=","
let maplocalleader="."

" �ڲ�ʹ�� MiniBufExplorer ���ʱҲ����<C-k,j,h,l>�л����������ҵĴ�����ȥ
noremap <c-k> <c-w>k
noremap <c-j> <c-w>j
noremap <c-h> <c-w>h
noremap <c-l> <c-w>l

" ����ģʽ�������β�ո�
nmap <Leader>cS :%s/\s\+$//g<CR>
nmap <Leader>ec :w<CR>:!tclsh %<CR>
" ����ģʽ�������β^M����
":%s/<C-V><C-M>//g
"����ģʽ��ȫ��������
":g/^/m0


""+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
"" plugins setting
""+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
"
"cscope & ctags
"
function Do_CsTag()
	let g:project_path = projectroot#get()
	if ! strlen(g:project_path)
		echo "cscope not find path"
		retu []
	endif

    if(executable('cscope') && has("cscope") )
        if has("win32")
            silent! execute "!dir /b *.c,*.cpp,*.h,*.java,*.cs >> cscope.files"
        else
			silent! ProjectRootExe !find `pwd` -name "*.[chSs]" -o -name "*.java"  -o -name "*.go" > cscope.files
        endif
        silent! ProjectRootExe !cscope -Rbq -i cscope.files
    endif
	let g:tmp_path = g:project_path 
	let g:tmp_path .= "/cscope.out"
    if filereadable(g:tmp_path)
        execute "cs kill -1"
        silent! ProjectRootExe cs add cscope.out
    endif

    "ProjectRootExe !ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .
	!pwd
endf

function Do_AddTags()
	let g:project_path = projectroot#get()
	if ! strlen(g:project_path)
		echo "cscope.out not find path"
		retu []
	endif

	if has("cscope")
	  "set cscopequickfix=s-,c-,d-,i-,t-,e-
	  set csto=0
	  set cst
	  set nocsverb
	  " add any databasset autochdire in current directory
	  let g:tmp_path = g:project_path 
	  let g:tmp_path .= "/cscope.out"
	  if filereadable(g:tmp_path)
		  cs add cscope.out
        execute "cs kill -1"
        ProjectRootExe cs add cscope.out
	  endif
	  set csverb
	endif
endf

autocmd FileType c,cpp,h,S,java,go nmap <leader>s :cs find s <C-R>=expand("<cword>")<CR><CR>
autocmd FileType c,cpp,h,S,java,go nmap <leader>g :cs find g <C-R>=expand("<cword>")<CR><CR>
autocmd FileType c,cpp,h,S,java,go nmap <leader>c :cs find c <C-R>=expand("<cword>")<CR><CR>
autocmd FileType c,cpp,h,S,java,go nmap <leader>t :cs find t <C-R>=expand("<cword>")<CR><CR>
autocmd FileType c,cpp,h,S,java,go nmap <leader>e :cs find e <C-R>=expand("<cword>")<CR><CR>
autocmd FileType c,cpp,h,S,java,go nmap <leader>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
autocmd FileType c,cpp,h,S,java,go nmap <leader>i :cs find i <C-R>=expand("<cfile>")<CR><CR>
autocmd FileType c,cpp,h,S,java,go nmap <leader>d :cs find d <C-R>=expand("<cword>")<CR><CR>

nmap <Leader>ep :call Do_CsTag()<CR>
nmap <Leader>ea :call Do_AddTags()<CR>

"
" tagbar (for mac )
"
if (g:iswindows)
    let g:tagbar_ctags_bin='ctags.exe'
elseif (g:ismacos)
	let g:tagbar_ctags_bin='/usr/local/bin/ctags'
else
    let g:tagbar_ctags_bin='/usr/bin/ctags'
endif
let g:tagbar_width=30

nmap <Leader>tl :TagbarToggle<CR>

"
" NERDTree.vim
"
let g:NERDTreeWinPos="left"
let g:NERDTreeWinSize=30
let g:NERDTreeShowLineNumbers=1
let g:NERDTreeQuitOnOpen=0
"let g:NERDTreeShowIgnoredStatus = 1
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

nmap <leader>nt :ProjectRootExe NERDTreeToggle<cr>

"
" OmniCppComplete.vim
"
let OmniCpp_NamespaceSearch = 1
let OmniCpp_GlobalScopeSearch = 1
let OmniCpp_ShowAccess = 1
let OmniCpp_MayCompleteDot = 1
let OmniCpp_MayCompleteArrow = 1
let OmniCpp_MayCompleteScope = 1
let OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD"]

"
" UltiSnips
"
let g:snips_author="d5c5ceb0"
let g:snips_email="d5c5ceb0@gmail.com"
let g:snips_copyright="d5c5ceb0"
"

"
" Mark--Karkat
"
"modify for terminal solarized color
highlight def MarkWord1  ctermbg=LightCyan     ctermfg=Black  guibg=#8CCBEA    guifg=Black
highlight def MarkWord2  ctermbg=LightGreen    ctermfg=Black  guibg=#A4E57E    guifg=Black
highlight def MarkWord3  ctermbg=LightYellow   ctermfg=Black  guibg=#FFDB72    guifg=Black
highlight def MarkWord4  ctermbg=Red           ctermfg=Black  guibg=#FF7272    guifg=Black
highlight def MarkWord5  ctermbg=Magenta       ctermfg=Black  guibg=#FFB3FF    guifg=Black
highlight def MarkWord6  ctermbg=LightBlue     ctermfg=Black  guibg=#9999FF    guifg=Black

"
" airline
"
let g:airline_powerline_fonts=1
if !exists('g:airline_symbols')
let g:airline_symbols = {}
endif
let g:airline_section_x = '%Y'
let g:airline_section_z = '%p%% - (%l,%v)'
let g:airline_section_error={}
let g:airline_section_warning={}
let g:airline#extensions#wordcount#enabled = 0
"let w:airline_disabled = 1
"
" orgmode
"
let g:org_heading_shade_leading_stars = 1
let g:org_indent = 1
let g:org_todo_keywords=['TODO', 'DOIN', '|', 'DONE']
let g:org_agenda_files=['~/GTD/mywork.org']

function! GTD(...)
    :e ~/GTD/mywork.org
endf
command! -nargs=? -complete=file Gtd :call GTD("<args>")

"
" ctrlp
"
let g:ctrlp_max_depth = 40
let g:ctrlp_max_files = 0
let g:ctrlp_working_path_mode = 'ra'

"
" fugitive
"
set statusline+=\ [%{fugitive#statusline()}]

"
" gitgutter
"
let g:gitgutter_max_signs = 10000
let g:gitgutter_signs = 0
nmap <Leader>gg :GitGutterSignsToggle<CR>:GitGutterLineHighlightsToggle<CR>

"
" syntastic
"
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*
"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0
"let g:syntastic_c_remove_include_errors = 1
"let g:syntastic_c_no_include_search = 1

"
"  ShowTrailingWhitespace
"
let g:ShowTrailingWhitespace = 0
" color column
function ToggleColumn()
    if ! &colorcolumn
        set colorcolumn=81
        call ShowTrailingWhitespace#Set(1,1)
    else
        set colorcolumn=
        call ShowTrailingWhitespace#Set(0,1)
    endif
endfunction

autocmd FileType c,cpp,h nmap <leader>cc :call ToggleColumn()<CR>

"
" vim-go
"
let g:go_disable_autoinstall = 0
let g:go_highlight_functions = 1  
let g:go_highlight_methods = 1  
let g:go_highlight_structs = 1  
let g:go_highlight_operators = 1  
let g:go_highlight_build_constraints = 1

"
" markdown
"
let g:vim_markdown_folding_disabled = 1
if (g:iswindows)
elseif (g:ismacos)
	let g:mkdp_path_to_chrome = "open -a Google\\ Chrome"
else
	let g:mkdp_path_to_chrome = "google-chrome"
end
let g:mkdp_auto_start = 0
let g:mkdp_auto_open = 0
let g:mkdp_auto_close = 1
let g:mkdp_refresh_slow = 0
let g:mkdp_command_for_global = 0

