if !empty(glob('~/google'))
	source /usr/share/vim/google/glug/bootstrap.vim
	source /usr/share/vim/google/core.vim
endif
"set autoread | au CursorHold * checktime | call feedkeys("lh")

set expandtab
set ts=2
set sw=2
syntax on

call plug#begin('~/.vim/plugged')
" Isn't syntastic redundant with coc.nvim lsp?
" Plug 'vim-syntastic/syntastic'
" signify is causing errors
Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) } }
"Plug 'mhinz/vim-signify'
"Plug 'djoshea/vim-autoread'
"Plug 'chrisbra/changesPlugin'
Plug 'ctrlpvim/ctrlp.vim'
" with set hidden, ctrlspace messes up syntax highlighting except for first and last buffer; lolwtf
"Plug 'vim-ctrlspace/vim-ctrlspace'
Plug 'majutsushi/tagbar'
Plug 'mileszs/ack.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'pboettch/vim-highlight-cursor-words'
Plug 'preservim/nerdcommenter'
"Plug 'preservim/nerdtree'
Plug 'shougo/echodoc.vim'
"Plug 'thaerkh/vim-indentguides'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'valloric/matchtagalways'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" for search count
"Plug 'osyo-manga/vim-anzu'
"Plug 'emilyst/match-count-statusline'

Plug 'vim-scripts/tabmerge'
Plug 'tmux-plugins/vim-tmux-focus-events'
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
	nnoremap <leader>i :CsImporter<CR>
        nnoremap <leader>cs :CsImporterSort<CR>
        Glug outline-window

        "Glug glug sources+=/google/src/head/depot/google3/experimental/users/jkolb/vim
        "Glug simplegutter
        " Add n or p to the map prefix to go the next or previous signgroup, or add l to view logs.
        " Diff and lint autorun on save and load.
        "Glug sg_diff plugin[mappings]='cd'
        "Glug sg_lint plugin[mappings]='cx'

        " Add b or t to the map prefix to build or test the current buffer.
        " Note that auto_query=1 will blaze query every buffer ahead of time. I like this, but you might want to remove it.
        "Glug sg_blaze plugin[mappings]='cz' auto_query=1
endif

set autowriteall


"if !empty(glob("~/google-desktop"))
	"":FZFPiperActiveFiles or :FZFPiperActiveFiles?
	"Glug fzf-piper
	"nnoremap <Leader>p :FZFPiperActiveFiles<Cr>

	"Glug piper plugin[mappings]
	"" Keep sourcing this after glugs...
	"" https://groups.google.com/a/google.com/g/vi-users/c/7bvZehko_Oc/m/cuUxZyFDDgAJ
	"source /usr/share/vim/google/google.vim
"endif


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
      \ 'coc-java' ]
" if hidden is not set, TextEdit might fail.
set hidden
" let g:CtrlSpaceProjectRootMarkers = [
let g:ctrlp_root_markers = [
      \ "BUILD",
      \ "davidlerner",
      \ "__init__.py",
      \ ".gitignore",
      \ ".git",
      \ "METADATA",
      \]

" auto use current file directory
let g:ctrlp_working_path_mode = 'c'
let g:ctrlp_switch_buffer = ''
let g:ctrlp_cmd = 'CtrlPBuffer'
let g:ctrlp_by_filename = 0
let g:ctrlp_match_current_file = 1
"let g:ctrlp_cmd = 'CtrlP'
nnoremap <leader><leader> :CtrlPBuffer<CR>
nnoremap <leader>pc :CtrlPChange<CR>
nnoremap <leader>pC :CtrlPChangeAll<CR>
nnoremap <leader>pu :CtrlPUndo<CR>
nnoremap <leader>pb :CtrlPBuffer<CR>

" Some servers have issues with backup files, see #649
"set nobackup
"set nowritebackup

" Better display for messages
set cmdheight=2

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=no

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

nmap af :wa<CR>
nmap ad :xa<CR>
let HlUnderCursor=0
let g:HiCursorWords_delay = 400


augroup Reload
  autocmd!
  " Triger `autoread` when files changes on disk
  " https://unix.stackexchange.com/questions/149209/refresh-changed-content-of-file-opened-in-vim/383044#383044
  " https://vi.stackexchange.com/questions/13692/prevent-focusgained-autocmd-running-in-command-line-editing-mode
  autocmd FocusGained,BufEnter,CursorHold,CursorHoldI *
    \ if mode() !~ '\v(c|r.?|!|t)' && getcmdwintype() == '' | checktime | endif

  " eg logs chanignng make this annoying
  " Notification after file change
  " https://vi.stackexchange.com/questions/13091/autocmd-event-for-autoread
  "+autocmd FileChangedShellPost *
   " \ echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None

augroup END
set completeopt-=preview
set completeopt-=menu

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
	"autocmd BufNewFile,BufEnter * silent! lcd %:p:h
augroup END
nnoremap <Leader>d :SignifyHunkDiff<Cr><C-w>

augroup settings
  autocmd!
  autocmd FileType * set
        \ clipboard^=unnamedplus,unnamed
        \   number
        \   undofile
        \   undodir=/var/tmp//,.,~/tmp,/tmp
        \   directory=/var/tmp//,.,~/tmp,/tmp
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
let g:CtrlSpaceGlobCommand = 'ag --nocolor -g ""'
let g:CtrlSpaceSearchTiming = 500
let g:CtrlSpaceLoadLastWorkspaceOnStart = 1
let g:CtrlSpaceSaveWorkspaceOnSwitch = 1
let g:CtrlSpaceSaveWorkspaceOnExit = 1
set showtabline=1
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

augroup AutoSave
  " consider instead w or w!
"  au FocusLost * :wa
"Ignore warnings from untitled buffersEdit
"The above command will complain if you have untitled buffers open. The command below will cause those warnings to be ignored.

  au FocusLost * silent! wa
augroup END

" Use AG for CtrlP
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = '/usr/bin/ag %s -i --nocolor --nogroup --hidden
    \ --ignore .git
    \ --ignore .svn
    \ --ignore .hg
    \ --ignore .DS_Store
    \ --ignore "**/*.pyc"
    \ --ignore review
    \ -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 1
endif

let g:ackprg = 'ag --vimgrep --smart-case'

let g:signify_vcs_list=['hg', 'git', 'perforce']
let g:signify_vcs_cmds = {
  \ 'hg': 'hg diff -r .^ --config extensions.color=! --config defaults.diff= --nodates -U0 -- %f',
  \ 'git': 'git diff --no-color --no-ext-diff -U0 -- %f',
  \ 'perforce': 'p4 info >& /dev/null && env G4MULTIDIFF=0 P4DIFF=%d p4 diff -dU0 %f',
  \ }

function GenerateFigDiffs()
  ! zsh ~/gdrive/config/hg-diffs.zsh
endfunction

function LoadFigDiffs()
  tabnew | args ~/hgdiffs/*p4head ~/hgdiffs/*exported | vertical all
  tabnew | args ~/hgdiffs/*change ~/hgdiffs/*commit ~/hgdiffs/hgdiff | vertical all
endfunction

function GenerateAndLoadFigDiffs()
  call GenerateFigDiffs()
  call LoadFigDiffs()
endfunction

nnoremap <leader>fld :silent! call GenerateAndLoadFigDiffs()<CR>
nnoremap <leader>fd :silent! call GenerateFigDiffs()<CR>

function! JavaSucks()
  let terse = shellescape(getline("."))
  let cmd = 'echo ' . terse . '| python3 ~/DriveFileStream/My\ Drive/scripts/suball/suball.py | tee ~/out.txt'
  let output = system(cmd)
  call setline(".", split(output, '\n'))
endfunction

nnoremap <leader>j :bn<CR>
nnoremap <leader>k :bp<CR>

nnoremap <leader>dj :call JavaSucks()<CR>
nnoremap <leader>di :CsImporter<CR>
" print [a]rgument value and name
" todo: more than first argument
nnoremap <leader>da :norm 0f(f wywoSystem.out.println("pA");yyp:s/"//g
" print [f]unction name
nnoremap <leader>df :norm 0f(F lyt(oSystem.out.println("");F(lp?"n
nnoremap <leader>dfa :norm 0f(f wywoSystem.out.println("pA");yyp:s/"//g0f(F lyt(oSystem.out.println("");F(lp?"n
" print [v]ariable under cursor
nnoremap <leader>dv :norm yawOiSystem.out.println("pA");F"i=yyp:s/"//gf=xjdd
"source /google/data/ro/projects/vigor/vigor.vim

if &term =~ "screen"
        let &t_BE = "\e[?2004h"
        let &t_BD = "\e[?2004l"
        exec "set t_PS=\e[200~"
        exec "set t_PE=\e[201~"
endif
nnoremap <leader>dc :'<,'>s/\S\+//gn<CR>

set shortmess-=S
nnoremap cp :let @+=expand("%:p")<CR>
nnoremap cdp :let @+=expand("%:h")<CR>
set backupdir=$HOME/gdrive/vimbackups

