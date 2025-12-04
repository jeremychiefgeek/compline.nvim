# compline.nvim

A Neovim colorscheme plugin featuring two complementary themes ported from [Joshua Blais' compline theme](https://github.com/jblais493/compline.git).

## Features

- Two carefully crafted colorschemes: **compline** (dark) and **lauds** (light)
- Minimal, easy-on-the-eyes color palette
- Extensive plugin support (Oil.nvim, Telescope, Gitsigns, nvim-cmp, and more)
- Highly configurable with setup options
- Support for transparency and custom highlight groups
- Built-in lualine themes
- LSP and Treesitter integration

## Themes

### compline

A dark and minimal theme with muted, earthy tones that reduce eye strain during long coding sessions. Perfect for late-night hacking.

### lauds

A parchment-like light theme with warm, natural colors. A light theme you'll actually enjoy using!

## Installation

### lazy.nvim

**Basic setup:**

```lua
{
  "jeremychiefgeek/compline.nvim",
  name = "compline",
  lazy = false,
  priority = 1000,
  config = function()
    vim.cmd("colorscheme compline")
    -- or for the light theme:
    -- vim.cmd("colorscheme lauds")
  end,
}
```

**Structured setup with options:**

```lua
-- lua/plugins/compline.lua
return {
  "jeremychiefgeek/compline.nvim",
  name = "compline",
  lazy = false,
  priority = 1000,
  config = function()
    require("compline").setup({
      variant = "auto", -- auto, compline, or lauds
      dim_inactive_windows = false,
      extend_background_behind_borders = true,

      styles = {
        bold = true,
        italic = true,
        transparency = false,
      },
    })
    vim.cmd("colorscheme compline")
  end,
}
```

### pam.nvim

```lua
{ source = "jeremychiefgeek/compline.nvim", as = "compline" }
```

### Manual

1. Clone this repository into your Neovim plugin directory:
   ```bash
   git clone https://github.com/jeremychiefgeek/compline.nvim ~/.local/share/nvim/site/pack/plugins/start/compline.nvim
   ```

2. Add to your `init.lua`:
   ```lua
   vim.cmd("colorscheme compline")
   ```

## Configuration

> [!IMPORTANT]
> Configure options _before_ setting the colorscheme.

Compline has two variants: **compline** (dark) and **lauds** (light). By default, `variant = "auto"` will follow `vim.o.background`, using lauds for light and compline for dark.

Colour values accept named colours from the compline palette (e.g., "blue", "green", "red") or valid hex values (e.g., "#fa8072").

### Full Configuration Options

```lua
require("compline").setup({
    variant = "auto", -- auto, compline, or lauds
    dim_inactive_windows = false,
    extend_background_behind_borders = true,

    enable = {
        terminal = true,
        legacy_highlights = true,
        migrations = true,
    },

    styles = {
        bold = true,
        italic = true,
        transparency = false,
    },

    groups = {
        border = "muted",
        link = "blue",
        panel = "surface",

        error = "red",
        hint = "cyan",
        info = "blue",
        ok = "green",
        warn = "yellow",
        note = "cyan",
        todo = "orange",

        git_add = "green",
        git_change = "yellow",
        git_delete = "red",
        git_dirty = "yellow",
        git_ignore = "muted",
        git_merge = "purple",
        git_rename = "cyan",
        git_stage = "cyan",
        git_text = "yellow",
        git_untracked = "subtle",

        h1 = "blue",
        h2 = "green",
        h3 = "yellow",
        h4 = "orange",
        h5 = "cyan",
        h6 = "purple",
    },

    palette = {
        -- Override the builtin palette per variant
        -- compline = {
        --     base = '#1a1d21',
        --     overlay = '#3d424a',
        -- },
    },

    highlight_groups = {
        -- Extend or override highlight groups
        -- Comment = { fg = "cyan" },
        -- Visual = { fg = "base", bg = "text", inherit = false },
    },

    before_highlight = function(group, highlight, palette)
        -- Modify highlights before they're applied
        -- Example: Disable all undercurls
        -- if highlight.undercurl then
        --     highlight.undercurl = false
        -- end
    end,
})

vim.cmd("colorscheme compline")
-- or
-- vim.cmd("colorscheme lauds")
```

### Color Palette

#### Compline (Dark)

```lua
{
    base = "#1a1d21",        -- Background
    surface = "#232529",     -- Slightly lighter background
    overlay = "#3d424a",     -- Overlay elements
    muted = "#515761",       -- Muted text
    subtle = "#7d7a75",      -- Subtle text
    text = "#e0dcd4",        -- Main text

    red = "#CDACAC",
    orange = "#c4beb0",
    yellow = "#DBCDB3",
    green = "#b8c4b8",
    blue = "#b4bcc4",
    cyan = "#b0bcc8",
    purple = "#c0b8bc",
    brown = "#c8beb8",
}
```

#### Lauds (Light)

```lua
{
    base = "#f0efeb",        -- Background
    surface = "#f5f4f2",     -- Slightly lighter background
    overlay = "#e5e3e0",     -- Overlay elements
    muted = "#9a9791",       -- Muted text
    subtle = "#7d7a75",      -- Subtle text
    text = "#1a1d21",        -- Main text

    red = "#8B6666",
    orange = "#7A6D5A",
    yellow = "#8B7E52",
    green = "#5A6B5A",
    blue = "#5A6B7A",
    cyan = "#64757d",
    purple = "#4D6B6B",
    brown = "#546470",
}
```

## Lualine Support

Compline includes two lualine themes:

```lua
-- Standard theme
require('lualine').setup({
  options = {
    theme = 'compline'
  }
})

-- Alternative theme with subtle styling
require('lualine').setup({
  options = {
    theme = 'compline-alt'
  }
})
```

## Plugin Support

Compline includes optimized highlight groups for:

- **File explorers**: Oil.nvim, nvim-tree
- **Fuzzy finders**: Telescope
- **Git**: Gitsigns, lazygit.nvim
- **Completion**: nvim-cmp
- **UI**: WhichKey, Snacks.nvim
- **LSP**: Native LSP, diagnostics
- **Treesitter**: Full semantic highlighting

## Gallery

### Compline (Dark)
*A dark theme with earthy, muted tones*

### Lauds (Light)
*A warm, parchment-like light theme*

## Contributing

Contributions are welcome! Feel free to:
- Report bugs or request features via GitHub issues
- Submit pull requests for improvements
- Share plugin highlight configurations

## License

MIT License - see LICENSE file for details

## Credits

Original theme by [Joshua Blais](https://github.com/jblais493/compline)

Theme structure inspired by [rose-pine/neovim](https://github.com/rose-pine/neovim)

