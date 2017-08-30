set nocompatible              " be iMproved, required filetype off 		" required
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs' 
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'majutsushi/tagbar'
Plugin 'Shougo/neocomplete.vim'
Plugin 'Shougo/vimshell.vim'

Plugin 'stephpy/vim-php-cs-fixer'
Plugin 'rayburgemeestre/phpfolding.vim'

Plugin 'altercation/vim-colors-solarized.git'

Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'


Plugin 'altercation/solarized'
Plugin 'mileszs/ack.vim'
Plugin 'mhinz/vim-startify'
Plugin 'kshenoy/vim-signature'
Plugin 'Shougo/vimproc.vim', {
			\ 'build' : {
			\     'windows' : 'tools\\update-dll-mingw',
			\     'cygwin' : 'make -f make_cygwin.mak',
			\     'mac' : 'make',
			\     'linux' : 'make',
			\     'unix' : 'gmake',
			\    },
			\ }
Plugin 'scrooloose/syntastic'

Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
Plugin 'honza/vim-snippets'
Plugin 'benmills/vimux'


Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'

Plugin 'Yggdroot/indentLine'
Plugin 'Raimondi/delimitMate'
Plugin 'tpope/vim-surround'

"GO develop
Plugin 'fatih/vim-go'

"Plugin 'shawncplus/phpcomplete.vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required

Bundle 'DoxygenToolkit.vim'
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line


let mapleader = ";"
let g:mapleader = ";"

" Tab configuration
map <leader>to :tabnew 
map <leader>te :tabedit
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove
map <leader>tp :tabp<cr>
map <leader>tn :tabn<cr>
"map <F5> :tabprevious<CR>
"map <F6> :tabnext<CR>

" NERDTree configuration
map <F2> :NERDTreeToggle<CR>
nnoremap <leader>bm  :Bookmark<space>

nnoremap <leader>nt  :NERDTree<space>
nnoremap <leader>ntm :NERDTreeMirror<CR>
nnoremap <leader>ntf :NERDTreeFind<CR>

map <c-g> :Ack -i <space>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") &&b:NERDTreeType == "primary") | q | endif
"autocmd vimenter * NERDTree 
"let g:nerdtree_tabs_open_on_console_startup=1 
map <Leader>n <plug>NERDTreeTabsToggle<CR>

" Tagbar configuration
map <silent> <F3> :TagbarToggle<cr> 

"neocomplete configuration
"Note: This option must set it in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
			\ 'default' : '',
			\ 'vimshell' : $HOME.'/.vimshell_hist',
			\ 'scheme' : $HOME.'/.gosh_completions'
			\ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
	let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
	return neocomplete#close_popup() . "\<CR>"
	" For no inserting <CR> key.
	"return pumvisible() ? neocomplete#close_popup() : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplete#close_popup()
inoremap <expr><C-e>  neocomplete#cancel_popup()
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? neocomplete#close_popup() : "\<Space>"

" For cursor moving in insert mode(Not recommended)
"inoremap <expr><Left>  neocomplete#close_popup() . "\<Left>"
"inoremap <expr><Right> neocomplete#close_popup() . "\<Right>"
"inoremap <expr><Up>    neocomplete#close_popup() . "\<Up>"
"inoremap <expr><Down>  neocomplete#close_popup() . "\<Down>"
" Or set this.
"let g:neocomplete#enable_cursor_hold_i = 1
" Or set this.
"let g:neocomplete#enable_insert_char_pre = 1

" AutoComplPop like behavior.
"let g:neocomplete#enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplete#enable_auto_select = 1
"let g:neocomplete#disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
	let g:neocomplete#sources#omni#input_patterns = {}
endif
"let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
"let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
"let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set expandtab
set shiftwidth=4
set tabstop=4
set smarttab

set lbr
set tw=120
set encoding=utf-8
set fileencodings=utf-8,chinese,latin-1
set fileencoding=utf-8   
set nu
set wildmenu 

let g:tagbar_type_go = {
			\ 'ctagstype' : 'go',
			\ 'kinds'     : [
			\ 'p:package',
			\ 'i:imports:1',
			\ 'c:constants',
			\ 'v:variables',
			\ 't:types',
			\ 'n:interfaces',
			\ 'w:fields',
			\ 'e:embedded',
			\ 'm:methods',
			\ 'r:constructor',
			\ 'f:functions'
			\ ],
			\ 'sro' : '.',
			\ 'kind2scope' : {
			\ 't' : 'ctype',
			\ 'n' : 'ntype'
			\ },
			\ 'scope2kind' : {
			\ 'ctype' : 't',
			\ 'ntype' : 'n'
			\ },
			\ 'ctagsbin'  : 'gotags',
			\ 'ctagsargs' : '-sort -silent'
			\ }

set tags=.tags,./.tags,../.tags,../../.tags,../../../.tags,../../../../.tags,../../../../../.tags,../../../../../../.tags,../../../../../../../.tags,../../../../../../../../.tags,../../../../../../../../../../../.tags,../../../../../../../../../../../../.tags,../../../../../../../../../../../../../.tags,../../../../../../../../../../../../../../.tags






set ruler


"doxygen setting
let g:DoxygenToolkit_authorName="windha@163.com"
let g:DoxygenToolkit_briefTag_funcName="yes"
let g:doxygen_enhanced_color=1
let g:DoxygenToolkit_paramTag_pre = "@param "

" DoxAuthor Dox DoxBlock三个命令的快捷操作
map <F4>a :DoxAuthor
map <F4>f :Dox
map <F4>b :DoxBlock
map <F4>c O/** */

source ~/.vim/php-doc.vim 
inoremap <C-P> <ESC>:call PhpDocSingle()<CR>i 
nnoremap <C-P> :call PhpDocSingle()<CR> 
vnoremap <C-P> :call PhpDocRange()<CR> 

set runtimepath^=~/.vim/bundle/ctrlp.vim

"Plugin 'vim-airline/vim-airline' config 
let g:airline_theme="term" 
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
if has('statusline')
	set laststatus=2
	set statusline=%<%f\            " 文件名
	set statusline+=%w%h%m%r        " 选项

	" 显示git信息
	set statusline+=%{fugitive#statusline()}

	set statusline+=\ [%{&ff}/%Y]   " 文件类型
	set statusline+=\ [%{getcwd()}] " 当前目录
	set statusline+=%=%-14.(%l,%c%V%)\ %p%%  " 右对齐
endif


let g:vimproc_dll_path="~/.vim/bundle/vimproc.vim/lib/vimproc_mac.so"

"set columns=80
"set colorcolumn=80

set background=light
"set background=dark

syntax enable
"let g:solarized_termtrans = 1
"set background=dark
"colorscheme solarized
"togglebg#map("<F5>")
"-------------------
"curson config 
"-------------------
"set cursorline
"hi CursorLine cterm=NONE ctermbg=blue ctermfg=white
set hlsearch
hi Search cterm=NONE  ctermbg=darkblue ctermfg=red
nmap <Leader>/ :nohlsearch<CR> "关掉搜索高亮，在搜索结束后特别有用"
"搜索时忽略大小写
set ignorecase     


" Plugin: vim-startify {{{2
nnoremap <leader>st  :Startify<cr>
nnoremap <leader>ss  :SSave
nnoremap <leader>sc  :SClose<cr>
let g:startify_change_to_dir          = 0
let g:startify_enable_special         = 0
let g:startify_files_number           = 8
let g:startify_session_autoload       = 0
let g:startify_session_delete_buffers = 1
let g:startify_session_persistence    = 0
let g:startify_update_oldfiles        = 1
let g:startify_use_env                = 1



""""""""""""""""""""""""""""""
" Syntastic setting
"""""""""""""""""""""""""""""""
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0


let g:syntastic_mode_map = { 'mode': 'active',
                           \ 'passive_filetypes': ['java'] }

filetype plugin indent on    
filetype plugin on
filetype on

"Plugin 'Yggdroot/indentLine' config 
let g:indentLine_enabled = 1
" Vim
let g:indentLine_color_term = 239
map <leader>il :IndentLinesToggle<CR>


" Gitgutter {{{
if isdirectory(expand("~/.vim/bundle/vim-gitgutter/"))
	noremap <leader>g :GitGutterToggle<CR>
endif
" }}}

"Plugin 'Shougo/vimshell.vim' config
map <leader>vst :VimShellTab <cr>
map <leader>vsp :VimShellPop <cr>
let  g:vimshell_vimshrc_path = '~/.vim/vimshrc'
"Plugin 'rayburgemeestre/phpfolding.vim' config 
"let g:DisableAutoPHPFolding =1 
set clipboard=unnamed


