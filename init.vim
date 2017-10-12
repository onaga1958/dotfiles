"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=/home/onaga/.random/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('/home/onaga/.random')
  call dein#begin('/home/onaga/.random')

  " Let dein manage dein
  " Required:
  call dein#add('/home/onaga/.random/repos/github.com/Shougo/dein.vim')

  " Add or remove your plugins here:
  call dein#add('Shougo/neosnippet.vim')
  call dein#add('Shougo/neosnippet-snippets')
  call dein#add('Shougo/deoplete.nvim')
  call dein#add('zchee/deoplete-jedi')
  call dein#add('klen/python-mode')
  call dein#add('majutsushi/tagbar')
  call dein#add('rosenfeld/conque-term')

  " You can specify revision/branch/tag.
  call dein#add('Shougo/vimshell', { 'rev': '3787e5' })

  " Required:
  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

"End dein Scripts-------------------------

let g:python3_host_prog = '/usr/bin/python3'
call deoplete#enable()
autocmd FileType python nnoremap <leader>y :0,$!yapf<Cr>

set number
set shiftwidth=4
set clipboard+=unnamedplus
set foldmethod=indent

nnoremap <C-c> "+y
vnoremap <C-c> "+y

set fileencodings=utf-8,cp1251,koi8-r,cp866
menu Encoding.koi8-r :e ++enc=koi8-r ++ff=unix<CR>
menu Encoding.windows-1251 :e ++enc=cp1251 ++ff=dos<CR>
menu Encoding.cp866 :e ++enc=cp866 ++ff=dos<CR>
menu Encoding.utf-8 :e ++enc=utf8<CR>
menu Encoding.koi8-u :e ++enc=koi8-u ++ff=unix<CR>

map <F8> :emenu Encoding.<TAB>
nmap <F7> :TagbarToggle<CR>

let g:deoplete#enable_at_startup = 1

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
    autocmd FileType ruby,python,javascript,c,cpp match Excess /\%80v.*/
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
" Code checking
let g:pymode_lint = 1
let g:pymode_lint_checker = "pyflakes,pep8"
let g:pymode_ling_message = 1

" virtualenv support
let g:pymode_virtualenv = 1

let g:pymode_breakpoint = 1
let g:pymode_breakpoint_key = "<C-S-b>"
let g:pymode_breakpoint_cmd = ''

" syntax highlight
let g:pymode_syntax = 1
let g:pymode_syntax_all = 1
let g:pymode_syntax_indent_errors = g:pymode_syntax_all
let g:pymode_syntax_space_errors = g:pymode_syntax_all

let g:pymode_folding = 1

let g:pymode_run = 1
let g:pymode_run_bind = "<F5>"
let g:pymode_motion = 1
let g:pymode_python = 'python3'
let g:pymode_doc_bind = "<C-S-d>"
let g:pymode_options_colorcolumn = 0
let g:pymode_lint_ignore = "W0612,W0611"
"=====================================================
" Python-mode end settings
"=====================================================
