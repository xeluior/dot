vim.opt = {
  autoindent = true
  clipboard = "unnamedplus"
  confirm = true
  cursorline = true
  expandtab = false
  ignorecase = true
  linebreak = true
  list = true
  listchars = {
    tab = "│ ",
    leadmultispace = "│ ",
    extends = ">",
    precedes = "<"
  }
  mouse = "a"
  number = true
  scrolloff = 3
  shiftwidth = 2
  showbreak = "↪"
  sidescrolloff = 3
  signcolumn = "number"
  smartcase = true
  smartindent = true
  softtabstop = 2
  splitbelow = true
  splitright = true
  termguicolors = os.getenv("COLORTERM") == "truecolor"
}
