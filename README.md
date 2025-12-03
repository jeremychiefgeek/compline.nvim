# compline.nvim

A Neovim colorscheme plugin featuring two complementary themes ported from [[https://github.com/jblais493/compline.git][Joshua Blais' compline theme]].

## Features

- Two carefully crafted colorschemes: compline (dark) and lauds (light)
- Minimal, easy-on-the-eyes color palette
- Built-in support for oil.nvim file browser
- Syntax highlighting for common programming languages
- LSP diagnostics integration

## Themes

### compline

A dark and minimal theme with muted, earthy tones that reduce eye strain during long coding sessions. Perfect for late-night hacking.

### lauds

A parchment-like light theme with warm, natural colors. A light theme you'll actually enjoy using!

## Installation

### lazy.nvim

``` lua
{
  "jeremychiefgeek/compline.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    vim.cmd([[colorscheme compline]])
    -- or for the light theme:
    -- vim.cmd([[colorscheme lauds]])
  end,
}
```


### Manual

1. Clone this repository into your Neovim plugin directory:
   ``` bash
   git clone https://github.com/jeremychiefgeek/compline.nvim ~/.local/share/nvim/site/pack/plugins/start/compline.nvim
   ```

2. Add to your =init.lua=:
   ``` lua
   vim.cmd([[colorscheme compline]])
   ```

## Usage

To switch between themes, use:

``` vim
:colorscheme compline
:colorscheme lauds
```

** Supported Plugins

- *oil.nvim* - File browser with custom highlights for directories, symlinks, file operations, and permissions
- *snacks.nvim* - Dashboard with colorized headers, icons, keybindings, and footer elements
- Native LSP diagnostics
- Treesitter (basic syntax highlighting)

## Credits

Original theme by [[https://github.com/jblais493/compline.git][Joshua Blais]].
