require("advel.remap")

vim.opt.termguicolors = true

-- Indentation settings
-- Set tabstop to 4 spaces
vim.o.tabstop = 4

-- Set shiftwidth to 4 spaces for auto-indentation
vim.o.shiftwidth = 4

-- Use spaces instead of tabs (expandtab)
vim.o.expandtab = true

-- Set softtabstop to 4 (how many spaces a tab counts for in insert mode)
vim.o.softtabstop = 4

-- Automatically indent new lines
vim.o.autoindent = true

-- Enable smart indenting (based on syntax or language)
vim.o.smartindent = true

vim.opt.number = true

vim.diagnostic.config({
  virtual_text = true,
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = true,
})

vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight when yanking (copying) text",
  group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

vim.opt.termguicolors = true


