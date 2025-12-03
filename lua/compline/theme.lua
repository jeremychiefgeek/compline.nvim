local M = {}

M.palette = {
	background = "#1a1d21",
	foreground = "#e0dcd4",
	cursor = "#DBCDB3",
	cursor_text_color = "background",
	selection_foreground = "#e0dcd4",
	selection_background = "#3d424a",

	color0 = "#1a1d21",
	color8 = "#515761",

	color1 = "#CDACAC",
	color9 = "#c8beb8",

	color2 = "#b8c4b8",
	color10 = "#b4beb4",

	color3 = "#DBCDB3",
	color11 = "#ccc4b0",

	color4 = "#b4bcc4",
	color12 = "#b4bcc4",

	color5 = "#c0b8bc",
	color13 = "#c4beb8",

	color6 = "#b0bcc8",
	color14 = "#b0c0b8",

	color7 = "#c0bdb8",
	color15 = "#e0dcd4",
}

function M.setup()
	local p = M.palette
	local set = vim.api.nvim_set_hl

	-- Basic UI
	set(0, "Normal", { fg = p.fg, bg = p.bg })
	set(0, "CursorLine", { bg = p.color0 })
	set(0, "LineNr", { fg = p.color8 })
	set(0, "Visual", { fg = p.selection_foreground })
	set(0, "Visual", { bg = p.selection_background })
	set(0, "CursorLineNr", { fg = p.color3, bold = true })

	-- Syntax
	set(0, "Comment", { fg = p.color8, italic = true })
	set(0, "String", { fg = p.color2 })
	set(0, "Function", { fg = p.color4 })
	set(0, "Identifier", { fg = p.color1 })
	set(0, "Keyword", { fg = p.color1 })

	-- Treesitter Syntax Highlighting
	set(0, "@comment", { fg = p.color8, italic = true }) -- Comments
	set(0, "@comment.documentation", { fg = p.color8, italic = true }) -- Doc comments

	set(0, "@string", { fg = p.color2 }) -- Strings
	set(0, "@string.escape", { fg = p.color10 }) -- Escape sequences
	set(0, "@string.special", { fg = p.color2 }) -- Special strings
	set(0, "@character", { fg = p.color2 }) -- Characters

	set(0, "@number", { fg = p.color3 }) -- Numbers
	set(0, "@boolean", { fg = p.color3 }) -- Booleans
	set(0, "@float", { fg = p.color3 }) -- Floats

	set(0, "@function", { fg = p.color4 }) -- Functions
	set(0, "@function.builtin", { fg = p.color12 }) -- Built-in functions
	set(0, "@function.call", { fg = p.color4 }) -- Function calls
	set(0, "@function.macro", { fg = p.color5 }) -- Macros
	set(0, "@method", { fg = p.color4 }) -- Methods
	set(0, "@method.call", { fg = p.color4 }) -- Method calls

	set(0, "@constructor", { fg = p.color3 }) -- Constructors
	set(0, "@parameter", { fg = p.color1 }) -- Parameters

	set(0, "@keyword", { fg = p.color1 }) -- Keywords
	set(0, "@keyword.function", { fg = p.color1 }) -- Function keywords
	set(0, "@keyword.operator", { fg = p.color1 }) -- Operator keywords
	set(0, "@keyword.return", { fg = p.color1 }) -- Return keyword
	set(0, "@keyword.conditional", { fg = p.color1 }) -- if, else, etc.
	set(0, "@keyword.repeat", { fg = p.color1 }) -- for, while, etc.

	set(0, "@conditional", { fg = p.color1 }) -- Conditionals
	set(0, "@repeat", { fg = p.color1 }) -- Loops
	set(0, "@label", { fg = p.color5 }) -- Labels

	set(0, "@operator", { fg = p.foreground }) -- Operators
	set(0, "@exception", { fg = p.color1 }) -- Exceptions

	set(0, "@variable", { fg = p.foreground }) -- Variables
	set(0, "@variable.builtin", { fg = p.color1 }) -- Built-in variables
	set(0, "@variable.member", { fg = p.color1 }) -- Member variables

	set(0, "@type", { fg = p.color3 }) -- Types
	set(0, "@type.builtin", { fg = p.color3 }) -- Built-in types
	set(0, "@type.definition", { fg = p.color3 }) -- Type definitions

	set(0, "@constant", { fg = p.color3 }) -- Constants
	set(0, "@constant.builtin", { fg = p.color3 }) -- Built-in constants
	set(0, "@constant.macro", { fg = p.color5 }) -- Macro constants

	set(0, "@property", { fg = p.color1 }) -- Properties
	set(0, "@field", { fg = p.color1 }) -- Fields
	set(0, "@namespace", { fg = p.color6 }) -- Namespaces

	set(0, "@punctuation.delimiter", { fg = p.foreground }) -- Delimiters
	set(0, "@punctuation.bracket", { fg = p.foreground }) -- Brackets
	set(0, "@punctuation.special", { fg = p.color5 }) -- Special punctuation

	set(0, "@tag", { fg = p.color4 }) -- Tags (HTML/XML)
	set(0, "@tag.attribute", { fg = p.color3 }) -- Tag attributes
	set(0, "@tag.delimiter", { fg = p.foreground }) -- Tag delimiters

	set(0, "@text", { fg = p.foreground }) -- Text
	set(0, "@text.strong", { bold = true }) -- Bold text
	set(0, "@text.emphasis", { italic = true }) -- Italic text
	set(0, "@text.underline", { underline = true }) -- Underlined text
	set(0, "@text.title", { fg = p.color4, bold = true }) -- Titles
	set(0, "@text.literal", { fg = p.color2 }) -- Literal text
	set(0, "@text.uri", { fg = p.color6, underline = true }) -- URIs/URLs

	set(0, "@markup.heading", { fg = p.color4, bold = true }) -- Headings
	set(0, "@markup.strong", { bold = true }) -- Bold
	set(0, "@markup.italic", { italic = true }) -- Italic
	set(0, "@markup.link", { fg = p.color6, underline = true }) -- Links
	set(0, "@markup.list", { fg = p.color5 }) -- List markers

	-- Diagnostics
	set(0, "DiagnosticError", { fg = p.color1 })
	set(0, "DiagnosticWarn", { fg = p.color3 })
	set(0, "DiagnosticInfo", { fg = p.color2 })
	set(0, "DiagnosticHint", { fg = p.color8 })

	-- Oil.nvim
	set(0, "OilDir", { fg = p.color4, bold = true }) -- Directories
	set(0, "OilDirIcon", { fg = p.color4 }) -- Directory icons
	set(0, "OilLink", { fg = p.color6, underline = true }) -- Symbolic links
	set(0, "OilLinkTarget", { fg = p.color8 }) -- Link targets
	set(0, "OilCopy", { fg = p.color3, bold = true }) -- Copied files
	set(0, "OilMove", { fg = p.color5, bold = true }) -- Moved files
	set(0, "OilChange", { fg = p.color2, bold = true }) -- Changed files
	set(0, "OilCreate", { fg = p.color2, bold = true }) -- New files
	set(0, "OilDelete", { fg = p.color1, bold = true }) -- Deleted files
	set(0, "OilPermissionNone", { fg = p.color8 }) -- No permissions
	set(0, "OilPermissionRead", { fg = p.color3 }) -- Read permission
	set(0, "OilPermissionWrite", { fg = p.color2 }) -- Write permission
	set(0, "OilPermissionExecute", { fg = p.color1 }) -- Execute permission
	set(0, "OilTypeFile", { fg = p.foreground }) -- Regular files
	set(0, "OilTypeFifo", { fg = p.color5 }) -- Named pipes
	set(0, "OilTypeSocket", { fg = p.color13 }) -- Sockets
	set(0, "OilSize", { fg = p.color8 }) -- File size
	set(0, "OilMtime", { fg = p.color8 }) -- Modification time

	-- Snacks.nvim Dashboard
	set(0, "SnacksDashboardHeader", { fg = p.color4, bold = true }) -- Dashboard header/logo
	set(0, "SnacksDashboardTitle", { fg = p.color3, bold = true }) -- Section titles
	set(0, "SnacksDashboardDesc", { fg = p.color8 }) -- Descriptions
	set(0, "SnacksDashboardIcon", { fg = p.color6 }) -- Icons
	set(0, "SnacksDashboardKey", { fg = p.color2, bold = true }) -- Keybindings
	set(0, "SnacksDashboardFooter", { fg = p.color5, italic = true }) -- Footer text
	set(0, "SnacksDashboardFile", { fg = p.foreground }) -- File names
	set(0, "SnacksDashboardDir", { fg = p.color4 }) -- Directory names
	set(0, "SnacksDashboardShortcut", { fg = p.color1 }) -- Shortcuts
	set(0, "SnacksDashboardSpecial", { fg = p.color3 }) -- Special elements
end

return M
