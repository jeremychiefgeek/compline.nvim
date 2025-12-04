---@alias Variant "compline" | "lauds"
---@alias Palette { base: string, surface: string, overlay: string, muted: string, subtle: string, text: string, red: string, orange: string, yellow: string, green: string, blue: string, cyan: string, purple: string, brown: string }
---@alias PaletteColor "base" | "surface" | "overlay" | "muted" | "subtle" | "text" | "red" | "orange" | "yellow" | "green" | "blue" | "cyan" | "purple" | "brown" | "highlight_low" | "highlight_med" | "highlight_high"
---@alias Highlight { link: string, inherit: boolean } | { fg: string, bg: string, sp: string, bold: boolean, italic: boolean, undercurl: boolean, underline: boolean, underdouble: boolean, underdotted: boolean, underdashed: boolean, strikethrough: boolean, inherit: boolean }

local config = {}

---@class Options
config.options = {
	---Set the desired variant: "auto" will follow the vim background,
	---defaulting to "compline" for dark and "lauds" for light.
	---@type "auto" | Variant
	variant = "auto",

	---Differentiate between active and inactive windows and panels.
	dim_inactive_windows = false,

	---Extend background behind borders. Appearance differs based on which
	---border characters you are using.
	extend_background_behind_borders = true,

	enable = {
		legacy_highlights = true,
		migrations = true,
		terminal = true,
	},

	styles = {
		bold = true,
		italic = true,
		transparency = false,
	},

	---@type table<string, table<string, string>>
	palette = {},

	---@type table<string, string | PaletteColor>
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

		---@type string | PaletteColor
		h1 = "blue",
		h2 = "green",
		h3 = "yellow",
		h4 = "orange",
		h5 = "cyan",
		h6 = "purple",
	},

	---@type table<string, Highlight>
	highlight_groups = {},

	---Called before each highlight group, return a modified highlight or nil
	---to pass through.
	---@type fun(group: string, highlight: Highlight, palette: Palette): Highlight | nil
	before_highlight = nil,
}

---Migrate deprecated options to their current names
---@param options Options
---@return Options
local function migrate(options)
	-- Migrate disable_bold/disable_bolds to styles.bold
	if options.disable_bold ~= nil or options.disable_bolds ~= nil then
		options.styles.bold = not (options.disable_bold or options.disable_bolds)
	end

	-- Migrate disable_italic/disable_italics to styles.italic
	if options.disable_italic ~= nil or options.disable_italics ~= nil then
		options.styles.italic = not (options.disable_italic or options.disable_italics)
	end

	-- Set h1 through h6 to the same color if only one is specified
	if type(options.groups.headings) == "string" then
		options.groups.h1 = options.groups.headings
		options.groups.h2 = options.groups.headings
		options.groups.h3 = options.groups.headings
		options.groups.h4 = options.groups.headings
		options.groups.h5 = options.groups.headings
		options.groups.h6 = options.groups.headings
	elseif type(options.groups.headings) == "table" then
		options.groups.h1 = options.groups.headings.h1 or options.groups.h1
		options.groups.h2 = options.groups.headings.h2 or options.groups.h2
		options.groups.h3 = options.groups.headings.h3 or options.groups.h3
		options.groups.h4 = options.groups.headings.h4 or options.groups.h4
		options.groups.h5 = options.groups.headings.h5 or options.groups.h5
		options.groups.h6 = options.groups.headings.h6 or options.groups.h6
	end
	options.groups.headings = nil

	return options
end

---@param options Options | nil
function config.extend_options(options)
	config.options = vim.tbl_deep_extend("force", config.options, options or {})

	if config.options.enable.migrations then
		config.options = migrate(config.options)
	end
end

return config
