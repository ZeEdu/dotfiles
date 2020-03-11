" ALE
let g:ale_completion_enabled = 0
" Polyglot
let g:polyglot_disabled = ['css', 'cs']

call plug#begin('~/.vim/plugged')
Plug 'dense-analysis/ale'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'OmniSharp/omnisharp-vim'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'sheerun/vim-polyglot'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'alvan/vim-closetag'
" Plug 'ctrlpvim/ctrlp.vim'
Plug 'junegunn/fzf', { 'do': './install --bin' }
Plug 'junegunn/fzf.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'morhetz/gruvbox'
Plug 'dracula/vim',{'as':'dracula'}
Plug 'altercation/vim-colors-solarized'
call plug#end()


" Set VIM settings
colorscheme gruvbox
set background=dark
filetype on
syntax on
set fillchars=""
let mapleader = ','
set nocompatible
" GUI Configs  
if has("gui_running")
  set guifont=Input\ Mono\ 14 
  set guioptions-=m 
  set guioptions-=T
  set guioptions-=r
  set guioptions-=L
  set termguicolors
  set background=dark
endif

" Clipboard do sistema:
set clipboard=unnamed

" Tabs por espaços:
set expandtab
set shiftwidth=2
set tabstop=2

" Indentação:
filetype plugin indent on
set autoindent
set expandtab

" Régua, quebra e número de linhas:
set linebreak
set number
set numberwidth=5
set relativenumber
set ruler
set signcolumn=no

" Busca:
set hlsearch
set ignorecase
set incsearch

" Limpar os resultados destacados:
nmap <silent> <C-C> :silent noh<CR>

" ALE
let g:ale_warn_about_trailing_whitespace = 0
let g:ale_linters = {
      \  'javascript': ['eslint'],
      \  'typescript': ['tslint'],
      \  'cs': ['OmniSharp']
      \}
let g:ale_fixers = {
 \ 'javascript': ['eslint']
 \ }
let g:ale_javascript_prettier_use_local_config = 1
let g:ale_fix_on_save = 1
let g:ale_echo_msg_error_str = nr2char(0xf421) . ' '
let g:ale_echo_msg_warning_str = nr2char(0xf420) . ' '
let g:ale_echo_msg_info_str = nr2char(0xf05a) . ' '
let g:ale_echo_msg_format = '%severity%  %linter% - %s'
let g:ale_sign_column_always = 1
let g:ale_sign_error = g:ale_echo_msg_error_str
let g:ale_sign_warning = g:ale_echo_msg_warning_str
let g:ale_statusline_format = [
      \ g:ale_echo_msg_error_str . ' %d',
      \ g:ale_echo_msg_warning_str . ' %d',
      \ nr2char(0xf4a1) . '  ']

" Desabilitar backups:
set nobackup
set noswapfile
set nowritebackup


" Menu
set wildmenu

" Remap arrows
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

inoremap <Up> <NOP>
inoremap <Down> <NOP>
inoremap <Left> <NOP>
inoremap <Right> <NOP>

" YATS
let g:yats_host_keyword = 1

" Airline
let g:airline_theme='base16'
let g:airline#extensions#ale#enabled = 1


nnoremap <silent> <Leader><Leader> :Files<CR>
nnoremap <silent> <Leader>b :Buffers<CR>
nnoremap <silent> <Leader>. :Tags<CR>
vnoremap <leader>a "zy:execute "Ag " . @z<cr>
nnoremap <leader>a :Ag<Space>


" FZF
let g:fzf_buffers_jump = 1
command! -bang ProjectFiles call fzf#vim#files('~/Projects', <bang>0)




" CtrlP
" let g:ctrlp_map = '<c-p>'
" let g:ctrlp_cmd = 'CtrlP'
" let g:ctrlp_custom_ignore = '\v[\/]\.(DS_Storegit|hg|svn|optimized|compiled|node_modules)$'

" COC configs
let g:coc_node_path = '/home/eduardo/.asdf/shims/node'

" if hidden is not set, TextEdit might fail.
set hidden

" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" Better display for messages
" set cmdheight=2
" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns

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
autocmd CursorHold * silent call CocActionAsync('highlight')

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
nmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <TAB> <Plug>(coc-range-select)

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
let g:OmniSharp_server_stdio = 1
let g:OmniSharp_server_use_mono = 1
let g:OmniSharp_want_snippet=1
