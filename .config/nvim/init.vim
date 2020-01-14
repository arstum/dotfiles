
" ## Vim-set {{{
let mapleader=","
set nosmartindent
set noautoindent
" " 键盘错位修复
" nmap  j gj
" nmap  k gk
" 显示所有补全命令
" set wildmode=list:longest
set clipboard+=unnamed
set scrolloff=12
" 开启文件类型侦测
filetype on
" 根据侦测到的不同类型加载对应的插件
filetype plugin on
" 开启实时搜索功能
set incsearch
" 搜索时大小写不敏感
set ignorecase
" 关闭兼容模式
set nocompatible
" vim 自身命令行模式智能补全
" set wildmenu
" 总是显示状态栏
set laststatus=2
" 显示光标当前位置
set ruler
" 开启行号显示
set number
set relativenumber
" 高亮显示当前行/列
set cursorline
" set cursorcolumn
" 高亮显示搜索结果
" set hlsearch
" 输入的命令显示出来，看的清楚些 
" set showcmd
" Yggdroot/indentLine
" let g:indentLine_color_term = 239
let g:indentLine_showFirstIndentLevel = 1
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set iskeyword+=_,$,@,%,#,-,.
set noswapfile
" se  mousa=a
" folder autosave
au BufWinLeave *\.* silent mkview
au BufWinEnter *\.* silent loadview
set foldenable
set foldmethod=marker
syntax on
" function
" keep position
if has("autocmd")
    au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif
" windows
nmap <Leader>n :tabedit %<CR>
nmap <Leader>m :tabclose<CR>
vnoremap <Space><CR> :!sh<CR>    # run cursorline
nnoremap <Space><CR> V:!sh<CR>   # run cursorline
" }}}

" ## abbreviate {{{
" " 插入模式缩写
"         :iabbrev
" "命令行模式缩写
"         :cabbrev
" "插入、命令行两种模式缩写
"         :abbreviate
" :cabbrev vin e ~/.config/nvim/init.vim
:cabbrev vit e ~/.tmux.conf
:cabbrev viv e ~/.vimrc
:cabbrev vin e ~/.config/nvim/init.vim
:cabbrev vip e ~/.ideavimrc
:cabbrev viz e ~/.zshrc
:cabbrev vir e ~/.config/ranger/rc.conf
" }}}

" ## Vim-plug {{{
call plug#begin('~/.vim/plugged')
" # Text & File {{{
" tcomment_vim' | gc {{{
    Plug 'tomtom/tcomment_vim' " gc
" }}}
" vim-easymotion | leader g{{{
    Plug 'easymotion/vim-easymotion'
let g:EasyMotion_do_mapping = 0 " Disable default mappings
nmap <leader>g <Plug>(easymotion-bd-w)
vmap <leader>g <Plug>(easymotion-bd-w)
" }}}
" ranger | leader f{{{
    Plug 'francoiscabrol/ranger.vim'
    Plug 'rbgrouleff/bclose.vim'
" " disable default key leader f
" let g:ranger_map_keys = 0
" map <leader>k :Ranger<CR>
" ranger replace netrw
let g:ranger_replace_netrw = 1 " open ranger when vim open a directory
" }}}
" vim-visual-multi | C-n {{{
    Plug 'mg979/vim-visual-multi' " C-n
" }}}
" ? 百度 search | open-browser.vim | gx {{{
Plug 'tyru/open-browser.vim'
let g:netrw_nogx = 1 " disable netrw's gx mapping.
nmap gx <Plug>(openbrowser-smart-search)
vmap gx <Plug>(openbrowser-smart-search)
" nnoremap <Leader>o :<C-u>execute "OpenBrowser" "file:///" . expand('%:p:gs?\\?/?')<CR>
" }}}
" terryma/vim-multiple-cursor | <C-n> {{{
Plug 'terryma/vim-multiple-cursors'
" }}}
" tpope/vim-surroun | cs cst ds ysiw yssb ysiw  {{{
Plug 'tpope/vim-surround'
" }}}
" vimwiki/vimwik {{{
Plug 'vimwiki/vimwiki'
" }}}



" }}}
" # Display {{{
" # Theme {{{
" colorscheme {{{
Plug 'morhetz/gruvbox'
" attribute
" }}}
" airline {{{
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
" 关闭 vim-airline 集成：
let g:airline#extensions#coc#enabled = 0
" 改变错误标签：
let airline#extensions#coc#error_symbol = 'Error:'
" 改变警告标签：
let airline#extensions#coc#warning_symbol = 'Warning:'
" 改变错误格式：
let airline#extensions#coc#stl_format_err = '%E{[%e(#%fe)]}'
" 改变警告格式：
let airline#extensions#coc#stl_format_warn = '%W{[%w(#%fw)]}'
" attribute "
" }}}
" }}}
    Plug 'Yggdroot/indentLine'
" }}}
" # Git {{{
    Plug 'tpope/vim-fugitive'
" }}}
" # Power {{{
" vim-which-key {{{
    " Plug 'liuchengxu/vim-which-key'
    Plug 'liuchengxu/vim-which-key', { 'on': ['WhichKey', 'WhichKey!'] }
let g:mapleader = "\<Space>"
" let g:maplocalleader = ","
nnoremap <silent> <leader> :WhichKey '<Space>'<CR>
" nnoremap <silent> <localleader> :WhichKey ','<CR>
" let g:mapleader = ","
" nnoremap <silent> <leader> :WhichKey ','<CR>
" }}}
" coc.nvim {{{
	Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}}
" coc-snippets | C-j C-k C-l {{{
" :CocInstall coc-snippets | C-l
" Use <C-l> for trigger snippet expand.
imap <C-l> <Plug>(coc-snippets-expand)
" Use <C-j> for select text for visual placeholder of snippet.
vmap <C-j> <Plug>(coc-snippets-select)
" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<c-j>'
" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-k>'
" Use <C-j> for both expand and jump (make expand higher priority.)
imap <C-j> <Plug>(coc-snippets-expand-jump)
inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
let g:coc_snippet_next = '<tab>'
" }}}
" :CocInstall coc-pairs | right
" :CocInstall coc-python
"  {{{

" }}}

" }}}
" fzf {{{
" set rtp+=/usr/local/opt/fzf
    Plug '/usr/local/opt/fzf'
    Plug 'junegunn/fzf.vim'
" nmap ; :Buffers<CR>
" " nmap <Leader>r :Tags<CR>
" nmap <Leader>r :History:<CR>
" " nmap <Leader>t :Rg --files<CR>
" nmap <Leader>t :Files<CR>
" " nmap <Leader>a :Rg $(python -c /"import sys.path;site")<CR>
" nmap <Leader>a :Rg<CR>
" }}}
" }}}
call plug#end()
" }}}

" ## fzf.vim{{{

let g:fzf_layout = { 'down': '~40%' }

" Populate quickfix list with selected files
function! s:build_quickfix_list(lines)
  call setqflist(map(copy(a:lines), '{ "filename": v:val }'))
  botright copen
  cc
endfunction

" Ctrl-q allows to select multiple elements an open them in quick list
let g:fzf_action = {
  \ 'ctrl-q': function('s:build_quickfix_list'),
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-s': 'split',
  \ 'ctrl-v': 'vsplit' }

" Add namespace for fzf.vim exported commands
let g:fzf_command_prefix = 'Fzf'

" [Buffers] Jump to the existing window if possible
let g:fzf_buffers_jump = 1

" File path completion in Insert mode using fzf
imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-l> <plug>(fzf-complete-buffer-line)

" Use preview when FzfFiles runs in fullscreen
command! -nargs=? -bang -complete=dir FzfFiles
      \ call fzf#vim#files(<q-args>, <bang>0 ? fzf#vim#with_preview('up:60%') : {}, <bang>0)

" Mappings
nnoremap <silent> <leader>o :FzfFiles<CR>
nnoremap <silent> <leader>O :FzfFiles!<CR>
nnoremap <silent> <leader>l  :FzfBuffers<CR>
nnoremap <silent> <leader>b :FzfBLines<CR>
nnoremap <silent> <leader>m :FzfMaps<CR>
nnoremap <silent> <leader>`  :FzfMarks<CR>
nnoremap <silent> <leader>p :FzfCommands<CR>
nnoremap <silent> <leader>t :FzfFiletypes<CR>
nnoremap <silent> <F1> :FzfHelptags<CR>
inoremap <silent> <F1> <ESC>:FzfHelptags<CR>
" cnoremap <silent> <expr> <C-p> getcmdtype() == ":" ? "<C-u>:FzfHistory:\<CR>" : "\<ESC>:FzfHistory/\<CR>"
" cnoremap <silent> <C-_> <C-u>:FzfCommands<CR>

" fzf.Tags uses existing 'tags' file or generates it otherwise
nnoremap <silent> <leader>] :FzfTags<CR>
xnoremap <silent> <leader>] "zy:FzfTags <C-r>z<CR>

" fzf.BTags generate tags on-fly for current file
nnoremap <silent> <leader>} :FzfBTags<CR>
xnoremap <silent> <leader>} "zy:FzfBTags <C-r>z<CR>

" Show list of change in fzf
" Some code is borrowed from ctrlp.vim and tweaked to work with fzf
command FzfChanges call s:fzf_changes()
nnoremap <silent> <leader>; :FzfChanges<CR>

function! s:fzf_changelist()
  redir => result
  silent! changes
  redir END

  return map(split(result, "\n")[1:], 'tr(v:val, "	", " ")')
endf

function! s:fzf_changeaccept(line)
  let info = matchlist(a:line, '\s\+\(\d\+\)\s\+\(\d\+\)\s\+\(\d\+\).\+$')
  call cursor(get(info, 2), get(info, 3))
  silent! norm! zvzz
endfunction

function! s:fzf_changes()
  return fzf#run(fzf#wrap({
        \ 'source':  reverse(s:fzf_changelist()),
        \ 'sink': function('s:fzf_changeaccept'),
        \ 'options': '+m +s --nth=3..'
        \ }))
endfunction

" Enable per-command history.
" CTRL-N and CTRL-P will be automatically bound to next-history and
" previous-history instead of down and up. If you don't like the change,
" explicitly bind the keys to down and up in your $FZF_DEFAULT_OPTS.
let g:fzf_history_dir = '~/.local/share/fzf-history'
function! MyUniq(lst)
    return filter(a:lst, 'count(a:lst, v:val) == 1')
endfunction
" netrw
command! -bang FzfHistory call fzf#run(fzf#wrap('netrw_dirhist',
    \ {'source': 
    \ !exists('g:netrw_dirhist_cnt')
    \   ?"tail -n +3 ".g:netrw_home.".netrwhist | cut -d \"'\" -f2- | rev | cut -d \"'\" -f2- | rev | awk '!seen[$0]++'"
    \   :MyUniq(map(range(1,g:netrw_dirhist_cnt), 'g:netrw_dirhist_{v:val}'))
    \ }, <bang>0))
" }}}

" ## attribute {{{
" # Display gruvbox {{{
" Plug 'morhetz/gruvbox'
colorscheme gruvbox
syntax on
set background=dark " use dark mode
" set background=light " uncomment to use light mode

" }}}
" }}}


