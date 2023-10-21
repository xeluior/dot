local linters = require "lvim.lsp.null-ls.linters"
linters.setup { { command = "pylint", filetypes = { "python" } } }

