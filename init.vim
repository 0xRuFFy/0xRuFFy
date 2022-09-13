:set number
:set autoindent
:set tabstop=4
:set shiftwidth=4
:set smarttab
:set softtabstop=4
:set mouse=a

call plug#begin()

Plug 'https://github.com/vim-airline/vim-airline'
Plug 'https://github.com/preservim/nerdtree'
Plug 'https://github.com/tpope/vim-surround'
Plug 'https://github.com/tpope/vim-commentary'
Plug 'http://github.com/ap/vim-css-color'
Plug 'http://github.com/rafi/awesome-vim-colorschemes'
Plug 'https://github.com/ryanoasis/vim-devicons'
Plug 'http://github.com/preservim/tagbar'
Plug 'http://github.com/terryma/vim-multiple-cursors'
Plug 'http://github.com/neoclide/coc.nvim'

call plug#end()

nnoremap <C-n> :NERDTreeFocus<CR>
nnoremap <C-f> :NERDTreeFind<CR>
nnoremap <C-t> :NERDTreeToggle<CR>

nmap <F8> :TagbarToggle<CR>

inoremap <exr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

:colorscheme gruvbox
:hi Normal ctermbg=None " only for windows terminal (use windows terminal bg color for opacity) 

