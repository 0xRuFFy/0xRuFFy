:set number relativenumber
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
Plug 'https://github.com/ryanoasis/vim-devicons'
Plug 'KabbAmine/yowish.vim'
Plug 'http://github.com/preservim/tagbar'
Plug 'http://github.com/terryma/vim-multiple-cursors'
Plug 'http://github.com/neoclide/coc.nvim'
Plug 'https://github.com/Raimondi/delimitMate'
Plug 'github/copilot.vim'
Plug 'sheerun/vim-polyglot'
Plug 'nvim-lua/plenary.nvim'
Plug 'folke/todo-comments.nvim'
Plug 'akinsho/bufferline.nvim', { 'tag': 'v3.*' }
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'branch': '0.1.x' }
Plug 'rust-lang/rust.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'kdheepak/lazygit.nvim'
Plug 'https://github.com/neovim/nvim-lspconfig'
Plug 'https://github.com/simrat39/rust-tools.nvim'
Plug 'embark-theme/vim', { 'as': 'embark', 'branch': 'main' }
Plug 'nvim-lua/plenary.nvim'
Plug 'saecki/crates.nvim', { 'tag': 'v0.4.0' }
Plug 'ful1e5/onedark.nvim'
Plug 'lewis6991/gitsigns.nvim'

call plug#end()

nnoremap <C-n> :NERDTreeFocus<CR>
nnoremap <C-f> :NERDTreeFind<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <S-l> :bnext<CR>
nnoremap <S-h> :bprevious<CR>
nnoremap <S-d> :bdelete<CR>
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

inoremap <silent><expr> <tab> coc#pum#visible() ? coc#pum#confirm() : "\<tab>"
nnoremap <silent> ca <cmd>lua vim.lsp.buf.code_action()<CR>
nnoremap <silent> <leader>gg :LazyGit<CR>

nmap <F8> :TagbarToggle<CR>


"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX))
  if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif


" let g:gruvbox_contrast_dark = 'hard'
" let g:gruvbox_contrast_light = 'hard'
" colorscheme gruvbox
" colorscheme hybrid
" colorscheme embark

colorscheme onedark
let g:onedark_transparent = "true"
let g:onedark_transparent_sidebar = "true"


highlight Normal guibg=none ctermbg=none
highlight NonText guibg=none ctermbg=none
highlight LineNr guibg=none ctermbg=none
highlight SignColumn guibg=none ctermbg=none
highlight SignColumnSB guibg=none ctermbg=none
highlight NormalNC guibg=none ctermbg=none
highlight NormalFloat guibg=none ctermbg=none
highlight EndOfBuffer guibg=none ctermbg=none
highlight TelescopeNormal guibg=none ctermbg=none
highlight TelescopeBorder guibg=none ctermbg=none
highlight GitSignsAdd guibg=none
highlight GitSignsDelete guibg=none
highlight GitSignsChange guibg=none

au ColorScheme * hi Normal ctermbg=none guibg=none
au ColorScheme myspecialcolors hi Normal ctermbg=red guibg=red

let NERDTreeShowHidden=1
let NERDTreeMinimalUI=1
let g:rustfmt_autosave = 1

set tags=tags;/

lua << EOF
  require('gitsigns').setup()
  require('crates').setup()
  require('todo-comments').setup {}
  require('bufferline').setup {
    options = {
      numbers = "ordinal",
      diagnostics = "coc",
      diagnostics_indicator = function(count, level, diagnostics_dict, context)
        local s = " "
        for e, n in pairs(diagnostics_dict) do
          if e == "error" then
            s = s .. " " .. n
          elseif e == "warning" then
            s = s .. " " .. n
          end
        end
        return s
      end,
    }    
  }
EOF
