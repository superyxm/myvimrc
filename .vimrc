" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
autocmd VimEnter * NERDTree | wincmd p
colorscheme torte
filetype plugin indent on
nmap <F7> :w!<cr>
set expandtab
set foldmethod=indent
set lines=30
set number
set shiftwidth=4
set wildmenu
syntax on
