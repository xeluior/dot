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
vim.opt.signcolumn = "yes"
vim.opt.smartcase = true
vim.opt.smartindent = true
vim.opt.softtabstop = 2
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.termguicolors = os.getenv("COLORTERM") == "truecolor"

vim.g.loaded_perl_provider = 0
vim.g.mapleader = ' '

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

require('lazy').setup({
  {
    'catppuccin/nvim',
    name = 'catppuccin',
    priority = 1000,
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
        function(server_name)
          require('lspconfig')[server_name].setup {
            require('cmp_nvim_lsp').default_capabilities()
          }
        end
      }
    end,
    dependencies = {
      'williamboman/mason.nvim',
      'neovim/nvim-lspconfig',
    }
  },

  {
    'folke/neodev.nvim',
    config = true
  },

  {
    'neovim/nvim-lspconfig',
    dependencies = {
      'folke/neodev.nvim',
      'hrsh7th/cmp-nvim-lsp'
    }
  },

  -- {
  --   'nvim-telescope/telescope.nvim',
  --   dependencies = {
  --     'nvim-lua/plenary.nvim',
  --     {
  --       'nvim-telescope/telescope-fzf-native.nvim',
  --       build = 'make'
  --     }
  --   },
  --   config = function(_, opts)
  --     local telescope = require 'telescope'
  --     telescope.setup(opts)
  --     telescope.load_extension('fzf')
  --   end
  -- },

  {
    'numToStr/Comment.nvim',
    config = true
    -- uses 'gc' to toggle comments
  },

  {
    'lewis6991/gitsigns.nvim',
    config = true
  },

  {
    'ahmedkhalf/project.nvim',
    main = 'project_nvim',
    config = true
  },

  {
    'hrsh7th/nvim-cmp',
    dependencies = {
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-cmdline',
      {
        'hrsh7th/cmp-vsnip',
        dependencies = {
          'hrsh7th/vim-vsnip'
        }
      }
    },
    config = function()
      local cmp = require 'cmp'
      cmp.setup {
        snippet = {
          expand = function(args)
            vim.fn['vsnip#anonymous'](args.body)
          end
        },
        window = {},
        mapping = cmp.mapping.preset.insert({
          ['<C-b>'] = cmp.mapping.scroll_docs(-4),
          ['<C-f>'] = cmp.mapping.scroll_docs(4),
          ['<C-Space>'] = cmp.mapping.complete(),
          ['<C-e>'] = cmp.mapping.abort(),
          ['<CR>'] = cmp.mapping.confirm({ select = false }),
          ['<Tab>'] = cmp.mapping.select_next_item(),
          ['<S-Tab>'] = cmp.mapping.select_prev_item(),
        }),
        sources = cmp.config.sources({
          { name = 'nvim_lsp' },
          { name = 'buffer' },
          { name = 'path' }
        })
      }
      cmp.setup.cmdline({ '/', '?' }, {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
          { name = 'buffer' }
        }
      })
      cmp.setup.cmdline(':', {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
          { name = 'path' },
          {
            name = 'cmdline',
            option = {
              ignore_cmds = { 'Man', '!' }
            }
          }
        })
      })
    end
  }
}, {})

vim.cmd.colorscheme 'catppuccin'

-- LSP keybinds (using telescope) and completion
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(e)
    local opts = { buffer = e.buf }
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', '<Leader>f', function()
      vim.lsp.buf.format { async = true }
    end, opts)
    vim.keymap.set('n', '<Leader>r', vim.lsp.buf.rename, opts)
    vim.keymap.set({ 'n', 'v' }, '<Leader>a', vim.lsp.buf.code_action, opts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
  end
})

-- highlight region breifly on yank
vim.api.nvim_create_autocmd('TextYankPost', {
  group = vim.api.nvim_create_augroup('HighlightYank', {}),
  callback = function(_)
    vim.highlight.on_yank { higroup = 'Visual', timeout = 100 }
  end
})

-- TODO: modularize
-- TODO: additional telescope binds
