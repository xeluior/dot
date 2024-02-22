-- Read the docs: https://www.lunarvim.org/docs/configuration
-- Video Tutorials: https://www.youtube.com/watch?v=sFA9kX-Ud_c&list=PLhoH5vyxr6QqGu0i7tt_XoVK9v-KvZ3m6
-- Forum: https://www.reddit.com/r/lunarvim/
-- Discord: https://discord.com/invite/Xb9B4Ny
vim.o.confirm = true
lvim.colorscheme = 'tokyonight-night'
lvim.transparent_window = true
lvim.builtin.terminal.direction = 'horizontal'
lvim.builtin.terminal.size = function(_)
  return vim.o.lines * 0.35
end
lvim.builtin.which_key.mappings["e"] = { "<cmd>NvimTreeFocus<CR>", "Explorer" }
