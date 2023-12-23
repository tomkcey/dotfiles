local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()


require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  use { 'williamboman/mason.nvim', run = ':MasonUpdate' }

  use 'nvim-lua/plenary.nvim'

  use { 'nvim-tree/nvim-tree.lua', requires = { 'nvim-tree/nvim-web-devicons' } }
  use { 'nvim-telescope/telescope.nvim', tag = '0.1.5' }

  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }

  use {
    'VonHeikemen/lsp-zero.nvim',
    branch = "v1.x",
    requires = {
      'neovim/nvim-lspconfig',
      'williamboman/mason-lspconfig.nvim',

      'hrsh7th/nvim-cmp',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-nvim-lua',
      'saadparwaiz1/cmp_luasnip',

      'L3MON4D3/LuaSnip',
      'rafamadriz/friendly-snippets'
    }
  }

  use 'jose-elias-alvarez/null-ls.nvim'

  use {
    "folke/trouble.nvim",
    requires = 'nvim-tree/nvim-web-devicons',
    config = function ()
      require("trouble").setup {
        icons = true,
        action_keys = {
          hover = 'K',
          cancel = '<esc>',
          refresh = 'r',
          jump = { '<tab>' },
          open_split = { '<c-x>' },
          toggle_preview = 'P',
        }
      }
    end
  }
end)

require('mason').setup()