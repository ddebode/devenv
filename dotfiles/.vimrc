if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

let g:ale_disable_lsp = 1

call plug#begin('~/.vim/plugged')

" Fancy statusline
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Navigate files in a sidebar
Plug 'scrooloose/nerdtree'

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'dhruvasagar/vim-zoom'
Plug 'othree/xml.vim'
Plug 'vim-scripts/vim-auto-save'
Plug 'terryma/vim-expand-region'
Plug 'brooth/far.vim'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-obsession'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'
Plug 'dhruvasagar/vim-table-mode'
Plug 'frazrepo/vim-rainbow'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } }
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'xavierchow/vim-swagger-preview'
Plug 'junegunn/vim-easy-align'
Plug 'machakann/vim-highlightedyank'
Plug 'dense-analysis/ale', { 'on':  'ALEToggle' }

" Java script
Plug 'pangloss/vim-javascript'    " JavaScript support
Plug 'leafgarland/typescript-vim' " TypeScript syntax
Plug 'maxmellon/vim-jsx-pretty'   " JS and JSX syntax

Plug 'ryanoasis/vim-devicons'
Plug 'sheerun/vim-polyglot'

" Support markdown tables
let g:table_mode_corner='|'

" List ends here. Plugins become visible to Vim after this call.
" Use PlugInstall and PlugClean to install and remove plugins
call plug#end()

" Vim tree config "
map <C-n> :NERDTreeToggle<CR>
map <C-b> :NERDTreeFind<CR>
let NERDTreeShowHidden=1

autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

let g:far#source = 'rg' 

" Basic
let mapleader = "\<Space>"
set number              " show line numbers
set wrap                " wrap lines
set encoding=utf-8      " set encoding to UTF-8 (default was "latin1")
set mouse=a             " enable mouse support (might not work well on Mac OS X)
set wildmenu            " visual autocomplete for command menu
set relativenumber
set modelines=0 	" Set modelines of for security 
set autoread
colo desert

" Triger `autoread` when files changes on disk
autocmd FocusGained,BufEnter,CursorHold,CursorHoldI *
  \ if mode() !~ '\v(c|r.?|!|t)' && getcmdwintype() == '' | checktime | endif

" Notification after file change
autocmd FileChangedShellPost *
  \ echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None


" to see the cursor in the matching bracket more easily
" hi MatchParen cterm=underline,bold ctermbg=green ctermfg=none
" Turned off matching parens
let g:loaded_matchparen=0
let g:rainbow_active = 1

" Navigate
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j 
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Copy to system clipboard with xsel
noremap <leader>p :read !xsel --clipboard --output<cr>
noremap <leader>c :w !xsel -ib<cr><cr>

" Delete to zero register
noremap <leader>d "_d<cr>
noremap dd "_dd
noremap c "_c
noremap x "_x

set statusline+=%{zoom#statusline()}

" Custom mappings
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>r :so ~/.vimrc<CR> 
nnoremap <Leader>x :1,$!xmllint -format -<CR>
nnoremap <leader>q :q<cr>
nnoremap <leader>n :nohl<cr>
nnoremap <leader>/ :Ag<cr>
nmap <leader>o o<Esc>
nmap <leader>' vi"
nmap v" vi"
nmap y" yi"
map <leader>a <esc>ggVG<CR>

" <leader><leader> toggles between buffers
nnoremap <leader><leader> <c-^>
"nnoremap <Tab> :bnext<CR>
"nnoremap <S-Tab> :bprevious<CR>
nnoremap <Tab> :bnext<CR>:redraw<CR>:ls<CR>
nnoremap <S-Tab> :bprevious<CR>:redraw<CR>:ls<CR>

" Find and replace
vnoremap <Leader>1 "zy :%s/<C-R>z//g
nnoremap <Leader>2 :%s///g

" move line
nnoremap <C-j> :m .+1<CR>==
nnoremap <C-k> :m .-2<CR>==
inoremap <C-j> <Esc>:m .+1<CR>==gi
inoremap <C-k> <Esc>:m .-2<CR>==gi
vnoremap <C-j> :m '>+1<CR>gv=gv
vnoremap <C-k> :m '<-2<CR>gv=gv

" Saving files
set noswapfile
let g:auto_save = 1  "Auto-save plugin: enable AutoSave on Vim startup
let g:auto_save_in_insert_mode = 0  "Auto-save plugin do not save while in insert mode
set autoread

" No comments automatically
set formatoptions-=cro

" Set clipboard to system clipboard
" On ubuntu install package vim-gtk
let uname = system("uname -s")
if uname == "Darwin\n"
   set clipboard=unnamed
else
   set clipboard=unnamedplus
endif

" In visual mode paste action will not overwrite the default register
vnoremap p pgvy

" after yank cursor stays in same position
vmap y ygv<Esc>

" Search case insentive
set ignorecase

" Paste
set pastetoggle=<F2>

" record playback (start record with qq)
noremap Q @q

" Allow backspace to delete more than what is inserted
set backspace=indent,eol,start

" Indent
set shiftwidth=4
set autoindent
set smartindent

" Augmenting Ag command using fzf#vim#with_preview function
"   * fzf#vim#with_preview([[options], [preview window], [toggle keys...]])
"     * For syntax-highlighting, Ruby and any of the following tools are required:
"       - Bat: https://github.com/sharkdp/bat
"       - Highlight: http://www.andre-simon.de/doku/highlight/en/highlight.php
"       - CodeRay: http://coderay.rubychan.de/
"       - Rouge: https://github.com/jneen/rouge
"
"   :Ag  - Start fzf with hidden preview window that can be enabled with "?" key
"   :Ag! - Start fzf in fullscreen and display the preview window above
command! -bang -nargs=* Ag
  \ call fzf#vim#ag(<q-args>,
  \                 <bang>0 ? fzf#vim#with_preview('up:60%')
  \                         : fzf#vim#with_preview('right:50%:hidden', '?'),
  \                 <bang>0)

" change cursor
if exists('$TMUX')
  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif

" Fzf mappings
nnoremap <leader>h :History<CR>
nnoremap <leader>b :Buffers<CR>
nnoremap <leader>f :Files<CR>
nnoremap <leader>l :Lines<CR>

" ALE mappings
nmap [t :ALEToggle<CR>
nmap ]a :ALENextWrap<CR>
nmap [a :ALEPreviousWrap<CR>
nmap ]A :ALELast
nmap [A :ALEFirst

let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'javascript': ['eslint'],
\}

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" highlight yank plugin
let g:highlightedyank_highlight_duration = 300

" Save session on exit
fu! SaveSess()
    execute 'mksession! ~/.vim/session.vim'
endfunction

autocmd VimLeave * call SaveSess()
" end 

"
" Begin coc settings
"

" CoC extensions
let g:coc_global_extensions = ['coc-solargraph', 'coc-tsserver', 'coc-json']

" Add CoC Prettier if prettier is installed
if isdirectory('./node_modules') && isdirectory('./node_modules/prettier')
  let g:coc_global_extensions += ['coc-prettier']
endif

" Add CoC ESLint if ESLint is installed
if isdirectory('./node_modules') && isdirectory('./node_modules/eslint')
  let g:coc_global_extensions += ['coc-eslint']
endif

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>cc  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>cq  <Plug>(coc-fix-current)

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>cf  <Plug>(coc-format-selected)
nmap <leader>cf  <Plug>(coc-format-selected)

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>ca  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>ce  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>cl  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>co  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>cs  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>cj  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>ck  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>cp  :<C-u>CocListResume<CR>

"
" end coc settings
"

" Custom functions
" Function to easily move maven depedency version to the property section
function ReplaceMavenVersion()
   " copy artifactId and put version in register m"
   exe "norm! yitj\"mcit$\{\}"
   " Paste and type version"
   exe "norm! Pa\.version"
   " Copy property key to k"
   exe "norm! h\"kyi}"
endfunction

function AddMavenVersion()
    " Add new line"
   exe "norm! o<>"
   " paste property key from register m"
   exe "norm! \"kP"
   " paste version"
   exe "norm! l\"mp"
   " add closing tag"
   exe "norm! a</>"
   " paste property key from register m"
   exe "norm! \"kP"
endfunction
    
nnoremap <leader>rmv :call ReplaceMavenVersion()<CR>
nnoremap <leader>amv :call AddMavenVersion()<CR>

syntax on
" Enable hl search
set hlsearch
hi Search term=standout ctermfg=0 ctermbg=3 guifg=Black guibg=Yellow

