if !empty(glob('~/google'))
	source /usr/share/vim/google/glug/bootstrap.vim
	source /usr/share/vim/google/core.vim
endif

call plug#begin('~/.vim/plugged')
Plug 'chrisbra/changesPlugin'
Plug 'pboettch/vim-highlight-cursor-words'
Plug 'tpope/vim-unimpaired'
" Isn't syntastic redundant with coc.nvim lsp?
"Plug 'vim-syntastic/syntastic'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'mileszs/ack.vim'
Plug 'mhinz/vim-signify'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'vim-ctrlspace/vim-ctrlspace'
"Plug 'yehuohan/vim-ctrlspace'
call plug#end()

if !empty(glob('~/google'))
	Glug codefmt-google
	Glug codefmt-google auto_filetypes+=blazebuild
	Glug blazedeps auto_filetypes=`['go']`
	Glug critique plugin[mappings]
	Glug blaze !alerts plugin[mappings]
	let g:blazevim_quickfix_autoopen = 1
	Glug syntastic-google
	Glug syntastic-google checkers=`{ 'go': ['go','gofmt', 'golint'], 'java':['glint'], 'proto':['glint'] }`
	Glug corpweb plugin[mappings]
	" uses <Leader>r
	Glug relatedfiles plugin[mappings]
	Glug google-csimporter
	nnoremap <leader>ci :CsImporter<CR>
	nnoremap <leader>cs :CsImporterSort<CR>
endif

set autowriteall

if !empty(glob("~/google-desktop"))
	":FZFPiperActiveFiles or :FZFPiperActiveFiles?
	Glug fzf-piper
	nnoremap <C-p> :FZFPiperActiveFiles<Cr>

	Glug piper plugin[mappings]
	" Keep sourcing this after glugs...
	" https://groups.google.com/a/google.com/g/vi-users/c/7bvZehko_Oc/m/cuUxZyFDDgAJ
	source /usr/share/vim/google/google.vim
endif


filetype plugin indent on
syntax on

set background=light
let mapleader = " "
map <Leader>v  :source ~/.vimrc<CR> :e<CR>

"""" CoC settings
let g:coc_global_extensions = [
      \ 'coc-tsserver',
      \ 'coc-json',
      \ 'coc-html',
      \ 'coc-css',
      \ 'coc-python',
      \ 'coc-java',
      \ 'coc-ultisnips' ]
" if hidden is not set, TextEdit might fail.
set hidden
let g:CtrlSpaceProjectRootMarkers = [
      \ "BUILD",
      \ "davidlerner",
      \ "__init__.py",
      \]

" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" Better display for messages
set cmdheight=2

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Or use `complete_info` if your vim support it, like:
" inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
augroup Highlight
	autocmd!
	autocmd CursorHold * silent call CocActionAsync('highlight')
augroup End

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Create mappings for function text object, requires document symbols feature of languageserver.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <TAB> for select selections ranges, needs server support, like: coc-tsserver, coc-python
" disabled because tab is apparently ctrl i lol
" https://github.com/neoclide/coc.nvim/issues/1089
"nmap <silent> <TAB> <Plug>(coc-range-select)
"xmap <silent> <TAB> <Plug>(coc-range-select)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Using CocList
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>
""""


let g:lsp_async_completion = 1
let g:lsp_signs_enabled = 1         " enable signs
let g:lsp_diagnostics_echo_cursor = 1 " enable echo under cursor when in normal mode
let g:asyncomplete_smart_completion = 1
let g:asyncomplete_auto_popup = 1



augroup autoformat_settings
  autocmd!
  autocmd FileType bzl AutoFormatBuffer buildifier
  autocmd FileType go AutoFormatBuffer gofmt
  autocmd FileType java AutoFormatBuffer google-java-format
  autocmd FileType proto AutoFormatBuffer clang-format
augroup END



let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_aggregate_errors = 1

" disable this for go; use an aucommand some day
let g:syntastic_check_on_wq = 0

nnoremap Y y$

set ignorecase
set smartcase

nmap af :w<CR>
nmap ad :SyntasticCheck<CR>:lw<CR>
let HlUnderCursor=0
let g:HiCursorWords_delay = 400

" Triger `autoread` when files changes on disk
" https://unix.stackexchange.com/questions/149209/refresh-changed-content-of-file-opened-in-vim/383044#383044
" https://vi.stackexchange.com/questions/13692/prevent-focusgained-autocmd-running-in-command-line-editing-mode
"autocmd FocusGained,BufEnter,CursorHold,CursorHoldI * if mode() != 'c' | checktime | endif
" Notification after file change
" https://vi.stackexchange.com/questions/13091/autocmd-event-for-autoread
augroup Reload
	autocmd!
	autocmd FileChangedShellPost *
	      \ echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None
augroup END
set completeopt-=preview

set autowriteall



let g:signify_skip_filename_pattern = ['\.pipertmp.*']
tnoremap <leader><Esc> <C-\><C-n><CR>
noremap <C-w>j <C-w><C-j>
noremap <C-w>k <C-w><C-k>
noremap <C-w>h <C-w><C-h>
noremap <C-w>l <C-w><C-l>
tnoremap <C-w>j <C-\><C-n><CR><C-w><C-j>
tnoremap <C-w>k <C-\><C-n><CR><C-w><C-k>
tnoremap <C-w>h <C-\><C-n><CR><C-w><C-h>
tnoremap <C-w>l <C-\><C-n><CR><C-w><C-l>




"let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline_theme='solarized'
let g:airline#extensions#tabline#show_buffers = 1
let g:airline#extensions#tabline#fnametruncate = 8
let g:airline#extensions#tabline#formatter = 'default'
let g:airline_powerline_fonts=1
let g:airline_sectionc='%F'
let g:airline_section_y=''
let g:airline_section_x=''
let g:airline_section_a=''
set statusline+='%F'
set noshowmode

" todo better buffer clearing using magic like this
"nmap <c-w><c-l> :set scrollback=1 \| sleep 100m \| set scrollback=10000<cr>
"tmap <c-w><c-l> <c-\><c-n><c-w><c-l>i<c-l>

augroup PWD
	autocmd!
	"automatically use path of current file as pwd
	autocmd BufNewFile,BufEnter * silent! lcd %:p:h
augroup END
nnoremap <Leader>d :SignifyHunkDiff<Cr><C-w>

augroup settings
  autocmd!
  autocmd FileType * set
        \ clipboard^=unnamedplus,unnamed
        \   number
        \   undofile
        \   undodir=~/.vim/undo
        \   nowrap
        \   textwidth=0
        \   wrapmargin=0
        \   cursorline
        \   cursorcolumn
        \   tw=0
        \   incsearch
        \   nohlsearch
        \   fo-=cro
augroup END

augroup Blah
	autocmd!
	autocmd BufWritePre * %s/\s\+$//e
	autocmd Filetype text setlocal wrap linebreak nolist ts=2 sw=2 nocursorline nocursorcolumn
augroup END

let g:CtrlSpaceDefaultMappingKey = "<C-space> "
" feels like I should not need this, but appranetly for non-bookmarked...
nnoremap <silent><leader>,  :CtrlSpace<CR>
let s:vimfiles = '~/.vim'
let s:os = 'linux'

let g:CtrlSpaceFileEngine = s:vimfiles . '/plugged/vim-ctrlspace' . '/bin/file_engine_' . s:os . '_amd64'
let g:CtrlSpaceGlobCommand = 'ack --nocolor -g ""'
let g:CtrlSpaceSearchTiming = 500
let g:CtrlSpaceLoadLastWorkspaceOnStart = 1
let g:CtrlSpaceSaveWorkspaceOnSwitch = 1
let g:CtrlSpaceSaveWorkspaceOnExit = 1
set showtabline=0
let g:airline_exclude_preview = 1
let g:CtrlSpaceUseTabline = 1

set encoding=utf-8
let g:CtrlSpaceUseUnicode = 0

if ! has('gui_running')
	set ttimeoutlen=10
	augroup FastEscape
		autocmd!
		au InsertEnter * set timeoutlen=0
		au InsertLeave * set timeoutlen=1000
	augroup END
endif

let g:LanguageClient_loggingFile = '/tmp/LanguageClient.log'
let g:LanguageClient_loggingLevel = 'DEBUG'
augroup SetText
	autocmd!
	autocmd BufEnter,BufNewFile,BufRead * if &ft == '' | set ft=text | endif
augroup END
