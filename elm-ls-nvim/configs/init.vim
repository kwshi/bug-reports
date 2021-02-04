call plug#begin()
Plug 'neovim/nvim-lspconfig'
call plug#end()

lua << EOF 
require'lspconfig'.elmls.setup{}
EOF 
