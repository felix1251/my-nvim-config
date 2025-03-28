local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
  -- Package Manager
  use 'wbthomason/packer.nvim'

  -- Color Scheme
  use 'ellisonleao/gruvbox.nvim'

  -- Syntax Highlighting
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
  use 'norcalli/nvim-colorizer.lua'

  -- Indent lines
  use "lukas-reineke/indent-blankline.nvim"

  -- Navigation
  use 'nvim-tree/nvim-web-devicons'
  use 'nvim-tree/nvim-tree.lua'
  use { 'akinsho/bufferline.nvim', tag = "*", requires = 'nvim-tree/nvim-web-devicons' }
  use { 'nvim-telescope/telescope.nvim', tag = '0.1.6', requires = { { 'nvim-lua/plenary.nvim' } } } -- Install ripgrep if problem using live grep
  use { 'nvim-lualine/lualine.nvim', requires = { 'nvim-tree/nvim-web-devicons', opt = true } }

  -- Lsp/completion/formatter
  use "github/copilot.vim"
  use "hrsh7th/nvim-cmp"
  use "hrsh7th/cmp-nvim-lsp"
  use "L3MON4D3/LuaSnip"
  use "saadparwaiz1/cmp_luasnip"
  use "rafamadriz/friendly-snippets"
  use "williamboman/mason.nvim"
  use "williamboman/mason-lspconfig.nvim"
  use "neovim/nvim-lspconfig"
  use "stevearc/conform.nvim"
  use { 'codota/tabnine-nvim', run = "./dl_binaries.sh" } -- install unzip if problem installing

  -- Git
  use "lewis6991/gitsigns.nvim"
  use "tpope/vim-fugitive"

  -- Comment
  use "numToStr/Comment.nvim"
  use "JoosepAlviste/nvim-ts-context-commentstring"

  if packer_bootstrap then
    require('packer').sync()
  end
end)
