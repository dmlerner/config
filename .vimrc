
" Enable modern Vim features not compatible with Vi spec.
set nocompatible
"set rtp+=$GOPATH/src/golang.org/x/lint/misc/vim
call plug#begin('~/.vim/plugged')
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'tpope/vim-unimpaired'
Plug 'vim-syntastic/syntastic'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'mileszs/ack.vim'
"Plug 'thaerkh/vim-workspace'
Plug 'pboettch/vim-highlight-cursor-words'

au User lsp_setup call lsp#register_server({
    \ 'name': 'Kythe Language Server',
    \ 'cmd': {server_info->['/google/bin/releases/grok/tools/kythe_languageserver', '--google3']},
    \ 'whitelist': ['python', 'go', 'java', 'cpp', 'proto'],
    \})
let g:workspace_session_directory = $HOME . '/.vim/sessions/'
" Leader is the backslash key by default.
nnoremap <Leader>] :LspDefinition<CR>
nnoremap <Leader>[ :LspReferences<CR>
nnoremap <Leader>i :LspHover<CR>
call plug#end()
"""""""""""""""Gocode with vim-go
let g:go_disable_autoinstall = 1
let g:go_gocode_bin = 'gocode'
"let g:go_autodetect_gopath = 0

""" coc for kythe
let g:coc_global_extensions = [
      \ 'coc-tsserver',
      \ 'coc-json',
      \ 'coc-html',
      \ 'coc-css',
      \ 'coc-python',
      \ 'coc-ultisnips' ]
let g:lsp_signs_enabled = 1         " enable signs
let g:lsp_diagnostics_echo_cursor = 1 " enable echo under cursor when in normal mode

" Use the 'google' package by default (see http://go/vim/packages).
source /usr/share/vim/google/google.vim
source /usr/share/vim/google/glug/bootstrap.vim

" Plugin configuration.
" See http://google3/devtools/editors/vim/examples/ for example configurations
" and http://go/vim/plugins for more information about vim plugins at Google.

" Plugin loading is commented out below - uncomment the plugins you'd like to
" load.

" Load google's formatting plugins (http://go/vim/plugins/codefmt-google).
" The default mapping is \= (or <leader>= if g:mapleader has a custom value),
" with
" - \== formatting the current line or selected lines in visual mode
"   (:FormatLines).
" - \=b formatting the full buffer (:FormatCode).
"
" To bind :FormatLines to the same key in insert and normal mode, add:
"   noremap <C-K> :FormatLines<CR>
"   inoremap <C-K> <C-O>:FormatLines<CR>
Glug codefmt plugin[mappings] gofmt_executable="goimports"
Glug codefmt gofmt_executable="goimports"
Glug codefmt-google
autocmd FileType go AutoFormatBuffer gofmt
Glug codefmt-google auto_filetypes+=blazebuild

" Enable autoformatting on save for the languages at Google that enforce
" formatting, and for which all checked-in code is already conforming (thus,
" autoformatting will never change unrelated lines in a file).
" Note formatting changed lines only isn't supported yet
" (see https://github.com/google/vim-codefmt/issues/9).
augroup autoformat_settings
  autocmd FileType bzl AutoFormatBuffer buildifier
  autocmd FileType go AutoFormatBuffer gofmt
"  autocmd FileType go AutoFormatBuffer golint
"  See go/vim/plugins/codefmt-google, :help codefmt-google and :help codefmt
"  for details about other available formatters.
augroup END

" Load YCM (http://go/ycm) for semantic auto-completion and quick syntax
" error checking. Pulls in a google3-enabled version of YCM itself and
" a google3-specific default configuration.
Glug youcompleteme-google

" Load the automated blaze dependency integration for Go.
" Note: for Go, blazedeps uses the Go team's glaze tool, which is fully
" supported by the Go team. The plugin is currently unsupported for other
" languages.
Glug blazedeps auto_filetypes=`['go']`

" Load piper integration (http://go/VimPerforce).
Glug piper plugin[mappings]

" Load Critique integration. Use :h critique for more details.
Glug critique plugin[mappings]

" Load blaze integration (http://go/blazevim).
Glug blaze !alerts plugin[mappings] 
let g:blazevim_quickfix_autoopen = 1
set autowriteall
set termwinscroll=1000000


" Load the syntastic plugin (http://go/vim/plugins/syntastic-google).
" Note: this requires installing the upstream syntastic plugin from
" https://github.com/vim-syntastic/syntastic.
Glug syntastic-google 
Glug syntastic-google checkers=`{'go': ['go','gofmt', 'golint']}`
Glug corpweb plugin[mappings]

" Load the ultisnips plugin (http://go/ultisnips).
" Note: this requires installing the upstream ultisnips plugin from
" https://github.com/SirVer/ultisnips.
"Glug ultisnips-google

" All of your plugins must be added before the following line.
" See go/vim-plugin-manager if you need help picking a plugin manager and
" setting it up.

" Enable file type based indent configuration and syntax highlighting.
" Note that when code is pasted via the terminal, vim by default does not detect
" that the code is pasted (as opposed to when using vim's paste mappings), which
" leads to incorrect indentation when indent mode is on.
" To work around this, use ":set paste" / ":set nopaste" to toggle paste mode.
" You can also use a plugin to:
" - enter insert mode with paste (https://github.com/tpope/vim-unimpaired)
" - auto-detect pasting (https://github.com/ConradIrwin/vim-bracketed-paste)
filetype plugin indent on
syntax on


"""""""""""""""""
"syntastic settings
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0 
let g:syntastic_check_on_open = 0
"let g:syntastic_go_checkers = ['gofmt', 'golint', 'gotype', 'govet']
"let g:syntastic_go_checkers = ['golangci_lint', 'gofmt', 'golint', 'gotype']
"let g:syntastic_go_checkers = ['gofmt', 'golint', 'gotype']"
"let g:syntastic_go_checkers = ['golangci_lint']
let g:syntastic_aggregate_errors = 1
let g:syntastic_check_on_wq = 1
"
"
set clipboard^=unnamedplus,unnamed
set number
set undofile
set undodir=~/.vim/undo
set nowrap
set textwidth=0
set wrapmargin=0
"set tabstop=2
set cursorline
set cursorcolumn
set tw=0
"set shiftwidth=2

set incsearch
"unset hlsearch=0
set nohlsearch
"nnoremap <Enter> :noh<cr><Esc>
nnoremap Y y$

"set laststatus=2
"set statusline+=%F:
"set statusline+=%c

let g:airline_theme='solarized'
let g:airline_sectionc='%F'
set statusline+='%F'
"let g:go_godef_bin='/usr/local/google/home/davidlerner/go-vim/godef.google3'
"nmap gd <Plug>(go-def)
let g:go_def_mode='guru' "works within file
"let g:go_info_mode='guru'
"let g:go_def_mode='gopls' "does nothing at all
"let g:go_info_mode='gopls'
let g:go_def_mode='godef' "works between files!
"let g:go_info_mode='godef' "doesn't work
"let g:go_info_mode='gocode'  "doesn't work
"let g:go_info_mode='gopls'  "doesn't work
"let g:go_info_mode='guru' 
au FileType go nmap gd <Plug>(go-def)
Glug youcompleteme-google
nnoremap <silent> <C-]> :YcmCompleter GoTo<CR>
"let g:ycm_godef_binary_path='~/go/bin/godef'
"let g:ycm_godef_binary_path='/usr/local/google/home/davidlerner/go-vim/godef.google3' set ignorecase
set ignorecase
set smartcase

nmap af :w<CR>
nmap ad :SyntasticCheck<CR>:lw<CR>
"autocmd CursorMoved * exe exists("HlUnderCursor")?HlUnderCursor?printf('match IncSearch /\V\<%s\>/', escape(expand('<cword>'), '/\')):'match none':""
let HlUnderCursor=0
let g:HiCursorWords_delay = 400

" Triger `autoread` when files changes on disk
" https://unix.stackexchange.com/questions/149209/refresh-changed-content-of-file-opened-in-vim/383044#383044
" https://vi.stackexchange.com/questions/13692/prevent-focusgained-autocmd-running-in-command-line-editing-mode
"autocmd FocusGained,BufEnter,CursorHold,CursorHoldI * if mode() != 'c' | checktime | endif
" Notification after file change
" https://vi.stackexchange.com/questions/13091/autocmd-event-for-autoread
autocmd FileChangedShellPost *
  \ echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None
set completeopt-=preview
let g:syntastic_go_checkers = ['gofmt', 'golint', 'gotype']
"let g:syntastic_go_checkers = ['gofmt', 'golint', 'gotype', 'govet']
"Glug syntastic-google checkers=`{'go': ['go','gofmt', 'golint']}`
Glug syntastic-google checkers=`{'go': ['gofmt', 'golint']}`

set autowriteall
