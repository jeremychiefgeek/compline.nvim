-- Minimal test configuration for compline.nvim
-- Run with: nvim -u test.lua

-- Add this repo to runtimepath
vim.opt.runtimepath:append(vim.fn.getcwd())

-- Optional: setup with configuration
require("compline").setup({
  variant = "auto",  -- or "compline" or "lauds"
  styles = {
    bold = true,
    italic = true,
    transparency = false,  -- try true to test transparency
  },
})

-- Load the colorscheme
vim.cmd("colorscheme compline")
-- or try: vim.cmd("colorscheme lauds")

-- Test some syntax
vim.cmd([[
  edit test_file.lua
  call setline(1, [
    \ '-- Test file for compline theme',
    \ 'local function test()',
    \ '  local x = "string"',
    \ '  local y = 123',
    \ '  if x then',
    \ '    print("Hello " .. y)',
    \ '  end',
    \ 'end',
  \ ])
  set ft=lua
]])
