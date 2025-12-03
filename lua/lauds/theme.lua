local M = {}

M.palette = {
	bg = "#f0efeb",
	bg_alt = "#e0dcd4",

	base0 = "#f5f4f2",
	base1 = "#efeeed",
	base2 = "#e5e3e0",
	base3 = "#d8d6d3",
	base4 = "#b8b5b0",
	base5 = "#9a9791",
	base6 = "#7d7a75",
	base7 = "#5f5c58",
	base8 = "#2d2a27",

	fg = "#1a1d21",
	fg_alt = "#4A4D51",

	red = "#8B6666",
	orange = "#7A6D5A",
	green = "#5A6B5A",
	yellow = "#8B7E52",
	blue = "#5A6B7A",
	cyan = "#64757d",
	teal = "#4D6B6B",
	dark_cyan = "#546470",
}

function M.setup()
	local p = M.palette
	local set = vim.api.nvim_set_hl

	-- UI
	set(0, "Normal", { fg = p.fg, bg = p.bg_alt })
	set(0, "CursorLine", { bg = p.base2 })
	set(0, "LineNr", { fg = p.base7 })
	set(0, "CursorLineNr", { fg = p.base8, bold = true })
	set(0, "Visual", { bg = p.base7, fg = p.bg })
	set(0, "Cursor", { fg = p.bg, bg = p.base8 })

	-- Syntax
	set(0, "Comment", { fg = p.base7, italic = true })
	set(0, "String", { fg = p.fg })
	set(0, "Function", { fg = p.fg })
	set(0, "Identifier", { fg = p.blue })
	set(0, "Keyword", { fg = p.blue, bold = true })
	set(0, "Operator", { fg = p.green, bold = true })
	set(0, "Type", { fg = p.blue, bold = true })

	-- Treesitter Syntax Highlighting
	set(0, "@comment", { fg = p.base7, italic = true }) -- Comments
	set(0, "@comment.documentation", { fg = p.base7, italic = true }) -- Doc comments

	set(0, "@string", { fg = p.green }) -- Strings
	set(0, "@string.escape", { fg = p.teal }) -- Escape sequences
	set(0, "@string.special", { fg = p.green }) -- Special strings
	set(0, "@character", { fg = p.green }) -- Characters

	set(0, "@number", { fg = p.yellow }) -- Numbers
	set(0, "@boolean", { fg = p.yellow }) -- Booleans
	set(0, "@float", { fg = p.yellow }) -- Floats

	set(0, "@function", { fg = p.blue }) -- Functions
	set(0, "@function.builtin", { fg = p.dark_cyan }) -- Built-in functions
	set(0, "@function.call", { fg = p.blue }) -- Function calls
	set(0, "@function.macro", { fg = p.orange }) -- Macros
	set(0, "@method", { fg = p.blue }) -- Methods
	set(0, "@method.call", { fg = p.blue }) -- Method calls

	set(0, "@constructor", { fg = p.yellow }) -- Constructors
	set(0, "@parameter", { fg = p.red }) -- Parameters

	set(0, "@keyword", { fg = p.blue, bold = true }) -- Keywords
	set(0, "@keyword.function", { fg = p.blue, bold = true }) -- Function keywords
	set(0, "@keyword.operator", { fg = p.blue, bold = true }) -- Operator keywords
	set(0, "@keyword.return", { fg = p.blue, bold = true }) -- Return keyword
	set(0, "@keyword.conditional", { fg = p.blue, bold = true }) -- if, else, etc.
	set(0, "@keyword.repeat", { fg = p.blue, bold = true }) -- for, while, etc.

	set(0, "@conditional", { fg = p.blue, bold = true }) -- Conditionals
	set(0, "@repeat", { fg = p.blue, bold = true }) -- Loops
	set(0, "@label", { fg = p.orange }) -- Labels

	set(0, "@operator", { fg = p.green, bold = true }) -- Operators
	set(0, "@exception", { fg = p.red }) -- Exceptions

	set(0, "@variable", { fg = p.fg }) -- Variables
	set(0, "@variable.builtin", { fg = p.red }) -- Built-in variables
	set(0, "@variable.member", { fg = p.red }) -- Member variables

	set(0, "@type", { fg = p.blue, bold = true }) -- Types
	set(0, "@type.builtin", { fg = p.blue, bold = true }) -- Built-in types
	set(0, "@type.definition", { fg = p.blue, bold = true }) -- Type definitions

	set(0, "@constant", { fg = p.yellow }) -- Constants
	set(0, "@constant.builtin", { fg = p.yellow }) -- Built-in constants
	set(0, "@constant.macro", { fg = p.orange }) -- Macro constants

	set(0, "@property", { fg = p.red }) -- Properties
	set(0, "@field", { fg = p.red }) -- Fields
	set(0, "@namespace", { fg = p.cyan }) -- Namespaces

	set(0, "@punctuation.delimiter", { fg = p.fg }) -- Delimiters
	set(0, "@punctuation.bracket", { fg = p.fg }) -- Brackets
	set(0, "@punctuation.special", { fg = p.orange }) -- Special punctuation

	set(0, "@tag", { fg = p.blue }) -- Tags (HTML/XML)
	set(0, "@tag.attribute", { fg = p.yellow }) -- Tag attributes
	set(0, "@tag.delimiter", { fg = p.fg }) -- Tag delimiters

	set(0, "@text", { fg = p.fg }) -- Text
	set(0, "@text.strong", { bold = true }) -- Bold text
	set(0, "@text.emphasis", { italic = true }) -- Italic text
	set(0, "@text.underline", { underline = true }) -- Underlined text
	set(0, "@text.title", { fg = p.blue, bold = true }) -- Titles
	set(0, "@text.literal", { fg = p.green }) -- Literal text
	set(0, "@text.uri", { fg = p.cyan, underline = true }) -- URIs/URLs

	set(0, "@markup.heading", { fg = p.blue, bold = true }) -- Headings
	set(0, "@markup.strong", { bold = true }) -- Bold
	set(0, "@markup.italic", { italic = true }) -- Italic
	set(0, "@markup.link", { fg = p.cyan, underline = true }) -- Links
	set(0, "@markup.list", { fg = p.orange }) -- List markers

	-- Diagnostics
	set(0, "DiagnosticError", { fg = p.red })
	set(0, "DiagnosticWarn", { fg = p.yellow })
	set(0, "DiagnosticInfo", { fg = p.green })
	set(0, "DiagnosticHint", { fg = p.base7 })

	-- Oil.nvim
	set(0, "OilDir", { fg = p.blue, bold = true }) -- Directories
	set(0, "OilDirIcon", { fg = p.blue }) -- Directory icons
	set(0, "OilLink", { fg = p.cyan, underline = true }) -- Symbolic links
	set(0, "OilLinkTarget", { fg = p.base7 }) -- Link targets
	set(0, "OilCopy", { fg = p.yellow, bold = true }) -- Copied files
	set(0, "OilMove", { fg = p.orange, bold = true }) -- Moved files
	set(0, "OilChange", { fg = p.green, bold = true }) -- Changed files
	set(0, "OilCreate", { fg = p.green, bold = true }) -- New files
	set(0, "OilDelete", { fg = p.red, bold = true }) -- Deleted files
	set(0, "OilPermissionNone", { fg = p.base7 }) -- No permissions
	set(0, "OilPermissionRead", { fg = p.yellow }) -- Read permission
	set(0, "OilPermissionWrite", { fg = p.green }) -- Write permission
	set(0, "OilPermissionExecute", { fg = p.red }) -- Execute permission
	set(0, "OilTypeFile", { fg = p.fg }) -- Regular files
	set(0, "OilTypeFifo", { fg = p.orange }) -- Named pipes
	set(0, "OilTypeSocket", { fg = p.dark_cyan }) -- Sockets
	set(0, "OilSize", { fg = p.base7 }) -- File size
	set(0, "OilMtime", { fg = p.base7 }) -- Modification time

	-- Snacks.nvim Dashboard
	set(0, "SnacksDashboardHeader", { fg = p.blue, bold = true }) -- Dashboard header/logo
	set(0, "SnacksDashboardTitle", { fg = p.yellow, bold = true }) -- Section titles
	set(0, "SnacksDashboardDesc", { fg = p.base7 }) -- Descriptions
	set(0, "SnacksDashboardIcon", { fg = p.cyan }) -- Icons
	set(0, "SnacksDashboardKey", { fg = p.green, bold = true }) -- Keybindings
	set(0, "SnacksDashboardFooter", { fg = p.orange, italic = true }) -- Footer text
	set(0, "SnacksDashboardFile", { fg = p.fg }) -- File names
	set(0, "SnacksDashboardDir", { fg = p.blue }) -- Directory names
	set(0, "SnacksDashboardShortcut", { fg = p.red }) -- Shortcuts
	set(0, "SnacksDashboardSpecial", { fg = p.yellow }) -- Special elements
end

return M
