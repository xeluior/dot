vim.opt.autoindent = true
vim.opt.clipboard = "unnamedplus"
vim.opt.confirm = true
vim.opt.cursorline = true
vim.opt.expandtab = true
vim.opt.ignorecase = true
vim.opt.linebreak = true
vim.opt.list = true
vim.opt.listchars = {
  tab = "│ ",
  leadmultispace = "│ ",
  extends = ">",
  precedes = "<"
}
vim.opt.mouse = "a"
vim.opt.number = true
vim.opt.scrolloff = 3
vim.opt.shiftwidth = 2
vim.opt.showbreak = "↪"
vim.opt.sidescrolloff = 3
vim.opt.signcolumn = "number"
vim.opt.smartcase = true
vim.opt.smartindent = true
vim.opt.softtabstop = 2
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.termguicolors = os.getenv("COLORTERM") == "truecolor"

vim.g.loaded_perl_provider = 0

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  {
    'catppuccin/nvim',
    name = 'catppuccin',
    opts = {
      flavour = 'mocha',
      transparent_backround = true,
      dim_inactive = {
        enabled = true,
        shade = 'dark',
        percentage = 0.5
      },
      integrations = {
        cmp = true,
        mason = true,
        treesitter = true
      }
    }
  },

  {
    'xiyaowong/transparent.nvim',
    opts = {
      exclude_groups = {
        'CursorLine',
        'StatusLine'
      }
    }
  },

  {
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    config = true
  },

  {
    'nvim-treesitter/nvim-treesitter',
    build = ":TSUpdate",
    config = function()
      local configs = require 'nvim-treesitter.configs'
      configs.setup {
        auto_install = true,
        ensure_installed = { 'c', 'lua', 'vim', 'vimdoc', 'python' },
        sync_install = false,
        ignore_install = {},
        highlight = { enable = true },
        indent = { enable = true },
        modules = {}
      }
    end
  },

  {
    'williamboman/mason.nvim',
    config = true
  },

  {
    'williamboman/mason-lspconfig.nvim',
    config = function(_, opts)
      local config = require 'mason-lspconfig'
      config.setup(opts)
      config.setup_handlers {
        function (server_name)
          require('lspconfig')[server_name].setup {}
        end
      }
    end,
    dependencies = {
      'williamboman/mason.nvim',
      'neovim/nvim-lspconfig'
    }
  },

  {
    'folke/neodev.nvim',
    config = true
  },

  {
    'nvim-telescope/telescope.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
      {
        'nvim-telescope/telescope-fzf-native.nvim',
        build = 'make'
      }
    },
    config = function(_, opts)
      local telescope = require 'telescope'
      telescope.setup(opts)
      telescope.load_extension('fzf')
    end
  }
}, {})

vim.cmd.colorscheme 'catppuccin'

-- TODO: LSP keybinds and completion
-- TODO: highlight region breifly on yank
-- TODO: gitsigns
-- TODO: modularize
