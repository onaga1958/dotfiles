" to setup it for your environment you need to change python3_host_prog
" and path to dein in runtimepath and arguments in dein#begin and first dein#add
" also don't forget to
" pip3 install --user neovim jedi

"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=/Users/onaga/.cache/dein/repos/github.com/Shougo/dein.vim

" Required:
call dein#begin('/Users/onaga/.cache/dein')

" Let dein manage dein
" Required:
call dein#add('/Users/onaga/.cache/dein/repos/github.com/Shougo/dein.vim')

" Add or remove your plugins here:
call dein#add('Shougo/neosnippet.vim')
call dein#add('Shougo/neosnippet-snippets')
call dein#add('Shougo/deoplete.nvim')
call dein#add('zchee/deoplete-jedi')
call dein#add('zchee/deoplete-clang')
call dein#add('Shougo/neocomplete.vim')
call dein#add('szw/vim-tags')
call dein#add('scrooloose/nerdcommenter')
call dein#add('klen/python-mode')
call dein#add('majutsushi/tagbar')
call dein#add('rosenfeld/conque-term')
call dein#add('vim-airline/vim-airline')
call dein#add('vim-airline/vim-airline-themes')
call dein#add('vim-syntastic/syntastic')
call dein#add('Yggdroot/indentLine')
" call dein#add('SirVer/ultisnips')
" call dein#add('honza/vim-snippets')
call dein#add('tpope/vim-surround')
call dein#add('scrooloose/nerdtree')
call dein#add('michalbachowski/vim-wombat256mod')

" You can specify revision/branch/tag.
" call dein#add('Shougo/vimshell', { 'rev': '3787e5' })

" Required:
call dein#end()

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

"End dein Scripts-------------------------

" secure enable of local .vimrc files
set exrc
set secure

" to navigate on russian (C-^ to change language)
set keymap=russian-jcukenwin
set iminsert=0
set imsearch=0
highlight lCursor guifg=NONE guibg=Cyan

" for spell checking
set spelllang=ru_yo,en_us

" Jump to particular tab directly
noremap <unique> <C-1> 1gt
noremap <unique> <C-2> 2gt
noremap <unique> <C-3> 3gt
noremap <unique> <C-4> 4gt
noremap <unique> <C-5> 5gt
noremap <unique> <C-6> 6gt
noremap <unique> <C-7> 7gt
noremap <unique> <C-8> 8gt
noremap <unique> <C-9> 9gt
noremap <unique> <C-0> 10gt

" map newline insert
map <Shift-Enter> o<ESC>

let g:python3_host_prog = '/usr/bin/python3'
let g:deoplete#sources#clang#libclang_path = '/usr/local/opt/llvm/lib/libclang.dylib'
let g:deoplete#sources#clang#clang_header = '/usr/local/opt/llvm/lib/clang/'
set guicursor=
call deoplete#enable()
autocmd FileType python nnoremap <leader>y :0,$!yapf<Cr>

" mapping for specific tags opening
map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
map <A-]> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>

" add 256 colors in vim for airline
set t_Co=256
let g:airline_theme='luna'

colorscheme wombat256mod

" nerdtree settings
let NERDTreeShowLineNumbers=1
map <F2> :NERDTreeToggle<CR>

" syntastic settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_cpp_compiler_options = '-fsanitize=address,undefined -fno-sanitize-recover=all -fsanitize-undefined-trap-on-error -g -std=c++17 -O2 -Wall -Werror'
let g:syntastic_cpp_cpplint_exec = 'cpplint'
let g:syntastic_cpp_clang_tidy_exec = '/usr/local/opt/llvm/bin/clang-tidy'
let g:syntastic_cpp_checkers = ['cpplint', 'gcc', 'clang_tidy']
let g:syntastic_cpp_cpplint_args = "--filter \"-legal/copyright\" --linelength=120"
" use pymode instead
let g:syntastic_python_checkers = []

" indentLine settings
let g:indentLine_char = '│'
let g:indentLine_color_term = 239

" snippets mappings
let g:UltiSnipsSnippetDirectories=['UltiSnips', $HOME.'/.conf/nvim/MyUltiSnips']
let g:UltiSnipsListSnippets = get(g:, 'UltiSnipsListSnippets', '<c-l>')
let g:UltiSnipsExpandTrigger = get(g:, 'UltiSnipsExpandTrigger', '<c-y>')
let g:UltiSnipsJumpForwardTrigger = get(g:, 'UltiSnipsJumpForwardTrigger', '<c-j>')
let g:UltiSnipsJumpBackwardTrigger = get(g:, 'UltiSnipsJumpBackwardTrigger', '<c-k>')

" set line numbers
set number
set relativenumber

" cursor indicators
set cursorline
set cursorcolumn

" replace all tabs with 4 spaces
set expandtab      " tabs to spaces
set tabstop=4      " tab width
set shiftwidth=4   " space number added by < and >
set smarttab       " delete spaces in the begging
set si             " smart tab adding

" make folds using indents
set foldmethod=indent
set more

" enable coping from vim
set clipboard+=unnamedplus
nnoremap <C-c> "+y
vnoremap <C-c> "+y

" create encoding menu
set fileencodings=utf-8,cp1251,koi8-r,cp866
menu Encoding.koi8-r :e ++enc=koi8-r ++ff=unix<CR>
menu Encoding.windows-1251 :e ++enc=cp1251 ++ff=dos<CR>
menu Encoding.cp866 :e ++enc=cp866 ++ff=dos<CR>
menu Encoding.utf-8 :e ++enc=utf8<CR>
menu Encoding.koi8-u :e ++enc=koi8-u ++ff=unix<CR>
map <F7> :emenu Encoding.<TAB>

" tagbar settings
let g:tagbar_show_linenumbers = -1 " linenumber policy equal to global
let g:tagbar_sort = 0 " sort tags according to their order in the source file
nmap <F8> :TagbarToggle<CR>

let g:deoplete#enable_at_startup = 1
" use smart case
call deoplete#custom#option('smart_case', v:true)
" set completeopt+=noinsert
" deoplete tab-complete
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

augroup vimrc
  " Automatically delete trailing DOS-returns and whitespace on file open and
  " write.
  autocmd BufRead,BufWritePre,FileWritePre * silent! %s/[\r \t]\+$//
augroup END

" show if line is longer than 80
augroup vimrc_autocmds
    autocmd!
    autocmd FileType ruby,python,javascript,c,cpp highlight Excess ctermbg=DarkGrey guibg=Black
    autocmd FileType ruby,python,javascript,c,cpp match Excess /\%120v.*/
    autocmd FileType ruby,python,javascript,c,cpp set nowrap
augroup END

"=====================================================
" Python-mode settings
"=====================================================

" turn off autocomplete, use deoplete instead
let g:pymode_rope = 0
let g:pymode_rope_completion = 0
let g:pymode_rope_complete_on_dot = 0

" Documentation
let g:pymode_doc = 1
let g:pymode_doc_key = 'K'
let g:pymode_doc_bind = "<C-d>"

" Code checking
let g:pymode_lint = 1
let g:pymode_lint_checker = "pyflakes,pep8,pylint"
let g:pymode_ling_message = 1

" virtualenv support
let g:pymode_virtualenv = 1

let g:pymode_breakpoint = 1
let g:pymode_breakpoint_key = "<C-b>"
let g:pymode_breakpoint_cmd = ''

" syntax highlight
let g:pymode_syntax = 1
let g:pymode_syntax_all = 1
let g:pymode_syntax_indent_errors = g:pymode_syntax_all
let g:pymode_syntax_space_errors = g:pymode_syntax_all
let g:pymode_options_max_line_length = 120

let g:pymode_folding = 1

let g:pymode_run = 1
let g:pymode_run_bind = "<F5>"
let g:pymode_motion = 1
let g:pymode_python = 'python3'
let g:pymode_options_colorcolumn = 0
let g:pymode_lint_ignore = ["E741", "W0612", "W0611"]

fu! CheckWithoutIgnore()
    let tmp_ignore = g:pymode_lint_ignore
    let g:pymode_lint_ignore = []
    :PymodeLint
    let g:pymode_lint_ignore = tmp_ignore
endfunction

map <F3> :call CheckWithoutIgnore()<CR>
"=====================================================
" Python-mode end settings
"=====================================================
