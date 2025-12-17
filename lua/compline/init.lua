local M = {}
local config = require("compline.config")

local function set_highlights()
	local utilities = require("compline.utilities")
	local palette = require("compline.palette")
	local styles = config.options.styles

	local groups = {}
	for group, color in pairs(config.options.groups) do
		groups[group] = utilities.parse_color(color)
	end

	local function make_border(fg)
		fg = fg or groups.border
		return {
			fg = fg,
			bg = (config.options.extend_background_behind_borders and not styles.transparency) and palette.surface
				or "NONE",
		}
	end

	local highlights = {}

	-- Base editor UI highlights
	local default_highlights = {
		-- Basic UI
		ColorColumn = { bg = palette.highlight_med },
		Conceal = { bg = "NONE" },
		CurSearch = { fg = palette.base, bg = palette.yellow },
		Cursor = { fg = palette.base, bg = palette.text },
		CursorColumn = { bg = palette.highlight_low },
		CursorIM = { fg = palette.base, bg = palette.text },
		CursorLine = { bg = palette.highlight_low },
		CursorLineNr = { fg = palette.yellow, bold = styles.bold },
		Directory = { fg = palette.blue, bold = styles.bold },
		EndOfBuffer = { fg = palette.base },
		ErrorMsg = { fg = groups.error, bold = styles.bold },
		FloatBorder = make_border(),
		FloatTitle = { fg = palette.blue, bg = palette.surface, bold = styles.bold },
		FoldColumn = { fg = palette.muted, bg = "NONE" },
		Folded = { fg = palette.text, bg = palette.overlay },
		IncSearch = { fg = palette.base, bg = palette.green },
		LineNr = { fg = palette.muted },
		MatchParen = { fg = palette.yellow, bg = palette.highlight_med },
		ModeMsg = { fg = palette.subtle, bold = styles.bold },
		MoreMsg = { fg = palette.blue, bold = styles.bold },
		MsgArea = { fg = palette.subtle },
		NonText = { fg = palette.muted },
		Normal = { fg = palette.text, bg = palette.base },
		NormalFloat = { bg = palette.surface },
		NormalNC = { fg = palette.text, bg = config.options.dim_inactive_windows and palette._nc or palette.base },
		NvimInternalError = { link = "ErrorMsg" },
		Pmenu = { fg = palette.subtle, bg = palette.surface },
		PmenuExtra = { fg = palette.muted, bg = palette.surface },
		PmenuExtraSel = { fg = palette.subtle, bg = palette.overlay },
		PmenuKind = { fg = palette.blue, bg = palette.surface },
		PmenuKindSel = { fg = palette.subtle, bg = palette.overlay },
		PmenuSbar = { bg = palette.surface },
		PmenuSel = { fg = palette.text, bg = palette.overlay },
		PmenuThumb = { bg = palette.muted },
		Question = { fg = palette.yellow },
		QuickFixLine = { fg = palette.blue },
		Search = { fg = palette.base, bg = palette.yellow },
		SignColumn = { fg = palette.text, bg = "NONE" },
		SpecialKey = { fg = palette.blue },
		SpellBad = { sp = palette.subtle, undercurl = true },
		SpellCap = { sp = palette.subtle, undercurl = true },
		SpellLocal = { sp = palette.subtle, undercurl = true },
		SpellRare = { sp = palette.subtle, undercurl = true },
		StatusLine = { fg = palette.subtle, bg = palette.surface },
		StatusLineNC = { fg = palette.muted, bg = palette.surface, blend = 60 },
		Substitute = { link = "IncSearch" },
		TabLine = { fg = palette.subtle, bg = palette.surface },
		TabLineFill = { bg = palette.surface },
		TabLineSel = { fg = palette.text, bg = palette.overlay, bold = styles.bold },
		Title = { fg = palette.blue, bold = styles.bold },
		VertSplit = { fg = groups.border },
		Visual = { bg = palette.overlay },
		WarningMsg = { fg = groups.warn, bold = styles.bold },
		WildMenu = { link = "IncSearch" },
		WinBar = { fg = palette.subtle, bg = palette.surface },
		WinBarNC = { fg = palette.muted, bg = palette.surface, blend = 60 },
		WinSeparator = { fg = groups.border },

		-- Diagnostics
		DiagnosticError = { fg = groups.error },
		DiagnosticHint = { fg = groups.hint },
		DiagnosticInfo = { fg = groups.info },
		DiagnosticOk = { fg = groups.ok },
		DiagnosticWarn = { fg = groups.warn },
		DiagnosticDefaultError = { link = "DiagnosticError" },
		DiagnosticDefaultHint = { link = "DiagnosticHint" },
		DiagnosticDefaultInfo = { link = "DiagnosticInfo" },
		DiagnosticDefaultOk = { link = "DiagnosticOk" },
		DiagnosticDefaultWarn = { link = "DiagnosticWarn" },
		DiagnosticFloatingError = { link = "DiagnosticError" },
		DiagnosticFloatingHint = { link = "DiagnosticHint" },
		DiagnosticFloatingInfo = { link = "DiagnosticInfo" },
		DiagnosticFloatingOk = { link = "DiagnosticOk" },
		DiagnosticFloatingWarn = { link = "DiagnosticWarn" },
		DiagnosticSignError = { link = "DiagnosticError" },
		DiagnosticSignHint = { link = "DiagnosticHint" },
		DiagnosticSignInfo = { link = "DiagnosticInfo" },
		DiagnosticSignOk = { link = "DiagnosticOk" },
		DiagnosticSignWarn = { link = "DiagnosticWarn" },
		DiagnosticUnderlineError = { sp = groups.error, undercurl = true },
		DiagnosticUnderlineHint = { sp = groups.hint, undercurl = true },
		DiagnosticUnderlineInfo = { sp = groups.info, undercurl = true },
		DiagnosticUnderlineOk = { sp = groups.ok, undercurl = true },
		DiagnosticUnderlineWarn = { sp = groups.warn, undercurl = true },
		DiagnosticVirtualTextError = { fg = groups.error, bg = groups.error, blend = 10 },
		DiagnosticVirtualTextHint = { fg = groups.hint, bg = groups.hint, blend = 10 },
		DiagnosticVirtualTextInfo = { fg = groups.info, bg = groups.info, blend = 10 },
		DiagnosticVirtualTextOk = { fg = groups.ok, bg = groups.ok, blend = 10 },
		DiagnosticVirtualTextWarn = { fg = groups.warn, bg = groups.warn, blend = 10 },

		-- Standard syntax
		Boolean = { fg = palette.yellow },
		Character = { fg = palette.green },
		Comment = { fg = palette.muted, italic = styles.italic },
		Conditional = { fg = palette.blue },
		Constant = { fg = palette.yellow },
		Debug = { fg = palette.orange },
		Define = { fg = palette.purple },
		Delimiter = { fg = palette.subtle },
		Error = { fg = palette.red },
		Exception = { fg = palette.blue },
		Float = { fg = palette.yellow },
		Function = { fg = palette.blue },
		Identifier = { fg = palette.text },
		Include = { fg = palette.blue },
		Keyword = { fg = palette.blue },
		Label = { fg = palette.cyan },
		LspCodeLens = { fg = palette.subtle },
		LspCodeLensSeparator = { fg = palette.muted },
		LspInlayHint = { fg = palette.muted },
		LspReferenceRead = { bg = palette.highlight_med },
		LspReferenceText = { bg = palette.highlight_med },
		LspReferenceWrite = { bg = palette.highlight_med },
		Macro = { fg = palette.purple },
		Number = { fg = palette.yellow },
		Operator = { fg = palette.subtle },
		PreCondit = { fg = palette.purple },
		PreProc = { link = "PreCondit" },
		Repeat = { fg = palette.blue },
		Special = { fg = palette.cyan },
		SpecialChar = { link = "Special" },
		SpecialComment = { fg = palette.purple },
		Statement = { fg = palette.blue, bold = styles.bold },
		StorageClass = { fg = palette.cyan },
		String = { fg = palette.green },
		Structure = { fg = palette.cyan },
		Tag = { fg = palette.cyan },
		Todo = { fg = palette.base, bg = palette.orange, bold = styles.bold },
		Type = { fg = palette.cyan },
		TypeDef = { link = "Type" },
		Underlined = { fg = palette.purple, underline = true },

		healthError = { fg = groups.error },
		healthSuccess = { fg = groups.info },
		healthWarning = { fg = groups.warn },

		--- Treesitter
		["@variable"] = { fg = palette.text },
		["@variable.builtin"] = { fg = palette.red },
		["@variable.parameter"] = { fg = palette.red, italic = styles.italic },
		["@variable.parameter.builtin"] = { fg = palette.red, italic = styles.italic },
		["@variable.member"] = { fg = palette.red },

		["@constant"] = { fg = palette.yellow },
		["@constant.builtin"] = { fg = palette.yellow, bold = styles.bold },
		["@constant.macro"] = { fg = palette.orange },

		["@module"] = { fg = palette.text },
		["@module.builtin"] = { fg = palette.text, bold = styles.bold },
		["@label"] = { link = "Label" },

		["@string"] = { link = "String" },
		["@string.regexp"] = { fg = palette.purple },
		["@string.escape"] = { fg = palette.blue },
		["@string.special"] = { link = "String" },
		["@string.special.symbol"] = { link = "Identifier" },
		["@string.special.url"] = { fg = groups.link },

		["@character"] = { link = "Character" },
		["@character.special"] = { link = "Character" },

		["@boolean"] = { link = "Boolean" },
		["@number"] = { link = "Number" },
		["@number.float"] = { link = "Number" },
		["@float"] = { link = "Number" },

		["@type"] = { fg = palette.cyan },
		["@type.builtin"] = { fg = palette.cyan, bold = styles.bold },

		["@attribute"] = { fg = palette.purple },
		["@attribute.builtin"] = { fg = palette.purple, bold = styles.bold },
		["@property"] = { fg = palette.red, italic = styles.italic },

		["@function"] = { fg = palette.blue },
		["@function.builtin"] = { fg = palette.blue, bold = styles.bold },
		["@function.macro"] = { link = "Function" },
		["@function.method"] = { fg = palette.blue },
		["@function.method.call"] = { fg = palette.purple },

		["@constructor"] = { fg = palette.yellow },
		["@operator"] = { link = "Operator" },

		["@keyword"] = { link = "Keyword" },
		["@keyword.operator"] = { fg = palette.subtle },
		["@keyword.import"] = { fg = palette.blue },
		["@keyword.storage"] = { fg = palette.cyan },
		["@keyword.repeat"] = { fg = palette.blue },
		["@keyword.return"] = { fg = palette.blue },
		["@keyword.debug"] = { fg = palette.orange },
		["@keyword.exception"] = { fg = palette.blue },
		["@keyword.conditional"] = { fg = palette.blue },
		["@keyword.conditional.ternary"] = { fg = palette.blue },
		["@keyword.directive"] = { fg = palette.purple },
		["@keyword.directive.define"] = { fg = palette.purple },

		["@punctuation.delimiter"] = { fg = palette.subtle },
		["@punctuation.bracket"] = { fg = palette.subtle },
		["@punctuation.special"] = { fg = palette.orange },

		["@comment"] = { link = "Comment" },
		["@comment.documentation"] = { link = "Comment" },

		["@markup.strong"] = { bold = styles.bold },
		["@markup.italic"] = { italic = styles.italic },
		["@markup.strikethrough"] = { strikethrough = true },
		["@markup.underline"] = { underline = true },

		["@markup.heading"] = { fg = palette.blue, bold = styles.bold },
		["@markup.heading.1.markdown"] = { fg = palette.blue, bold = styles.bold },
		["@markup.heading.2.markdown"] = { fg = palette.cyan, bold = styles.bold },
		["@markup.heading.3.markdown"] = { fg = palette.yellow, bold = styles.bold },
		["@markup.heading.4.markdown"] = { fg = palette.orange, bold = styles.bold },
		["@markup.heading.5.markdown"] = { fg = palette.green, bold = styles.bold },
		["@markup.heading.6.markdown"] = { fg = palette.purple, bold = styles.bold },

		["@markup.quote"] = { fg = palette.text },
		["@markup.math"] = { link = "Special" },
		["@markup.link.markdown_inline"] = { fg = palette.subtle },
		["@markup.link.label.markdown_inline"] = { fg = palette.cyan },
		["@markup.link.url"] = { fg = groups.link },
		["@markup.raw.delimiter.markdown"] = { fg = palette.subtle },
		["@markup.list"] = { fg = palette.blue },
		["@markup.list.checked"] = { fg = palette.cyan },
		["@markup.list.unchecked"] = { fg = palette.text },

		["@tag"] = { fg = palette.blue },
		["@tag.attribute"] = { fg = palette.yellow },
		["@tag.delimiter"] = { fg = palette.subtle },

		--- Diff
		DiffAdd = { bg = groups.git_add },
		DiffChange = { bg = groups.git_change },
		DiffDelete = { bg = groups.git_delete },
		DiffText = { bg = groups.git_text },

		diffAdded = { link = "DiffAdd" },
		diffChanged = { link = "DiffChange" },
		diffRemoved = { link = "DiffDelete" },
		diffOldFile = { fg = palette.yellow },
		diffNewFile = { fg = palette.orange },
		diffFile = { fg = palette.blue },
		diffLine = { fg = palette.cyan },
		diffIndexLine = { link = "Comment" },

		--- Git
		gitcommitSummary = { fg = palette.blue },
		gitcommitOverflow = { fg = groups.error },

		--- Oil.nvim
		OilDir = { fg = palette.blue, bold = styles.bold },
		OilDirIcon = { fg = palette.blue },
		OilLink = { fg = palette.cyan, underline = true },
		OilLinkTarget = { fg = palette.muted },
		OilCopy = { fg = palette.yellow, bold = styles.bold },
		OilMove = { fg = palette.orange, bold = styles.bold },
		OilChange = { fg = palette.green, bold = styles.bold },
		OilCreate = { fg = palette.green, bold = styles.bold },
		OilDelete = { fg = palette.red, bold = styles.bold },
		OilPermissionNone = { fg = palette.muted },
		OilPermissionRead = { fg = palette.yellow },
		OilPermissionWrite = { fg = palette.green },
		OilPermissionExecute = { fg = palette.red },
		OilTypeFile = { fg = palette.text },
		OilTypeFifo = { fg = palette.orange },
		OilTypeSocket = { fg = palette.purple },
		OilSize = { fg = palette.muted },
		OilMtime = { fg = palette.muted },

		--- Snacks.nvim Dashboard
		SnacksDashboardHeader = { fg = palette.blue, bold = styles.bold },
		SnacksDashboardTitle = { fg = palette.yellow, bold = styles.bold },
		SnacksDashboardDesc = { fg = palette.muted },
		SnacksDashboardIcon = { fg = palette.cyan },
		SnacksDashboardKey = { fg = palette.green, bold = styles.bold },
		SnacksDashboardFooter = { fg = palette.orange, italic = styles.italic },
		SnacksDashboardFile = { fg = palette.text },
		SnacksDashboardDir = { fg = palette.blue },
		SnacksDashboardShortcut = { fg = palette.red },
		SnacksDashboardSpecial = { fg = palette.yellow },

		--- lazygit.nvim
		LazyGitFloat = { fg = palette.text, bg = palette.base },
		LazyGitBorder = { fg = palette.muted, bg = palette.base },

		--- lazy.nvim
		LazyNormal = { link = "NormalFloat" },
		LazyButton = { link = "CursorLine" },
		LazyButtonActive = { link = "Visual" },
		LazyH1 = { link = "IncSearch" },
		LazyH2 = { bold = styles.bold },
		LazyComment = { link = "Comment" },
		LazyCommit = { fg = palette.green },
		LazyCommitIssue = { fg = palette.yellow },
		LazyCommitType = { fg = palette.cyan },
		LazyCommitScope = { fg = palette.purple, italic = styles.italic },
		LazyDimmed = { link = "Conceal" },
		LazyDir = { fg = palette.blue },
		LazyProp = { link = "Conceal" },
		LazyReasonCmd = { fg = palette.subtle },
		LazyReasonEvent = { fg = palette.yellow },
		LazyReasonFt = { fg = palette.green },
		LazyReasonKeys = { fg = palette.blue },
		LazyReasonPlugin = { fg = palette.cyan },
		LazyReasonRuntime = { fg = palette.purple },
		LazyReasonSource = { fg = palette.green },
		LazyReasonStart = { fg = palette.red },
		LazyReasonImport = { fg = palette.text },
		LazyReasonRequire = { fg = palette.red },
		LazySpecial = { fg = palette.orange },
		LazyTaskError = { fg = groups.error },
		LazyTaskOutput = { link = "MsgArea" },
		LazyUrl = { fg = palette.blue, underline = true },
		LazyValue = { fg = palette.green },
		LazyProgressDone = { link = "Constant" },
		LazyProgressTodo = { link = "LineNr" },
		LazyNoCond = { fg = groups.warn },
		LazyLocal = { fg = palette.yellow },
		LazyError = { fg = groups.error },
		LazyInfo = { fg = groups.info },
		LazyWarning = { fg = groups.warn },

		--- Telescope
		TelescopeBorder = make_border(),
		TelescopeMatching = { fg = palette.orange },
		TelescopeNormal = { link = "NormalFloat" },
		TelescopePromptNormal = { link = "TelescopeNormal" },
		TelescopePromptPrefix = { fg = palette.subtle },
		TelescopeSelection = { fg = palette.text, bg = palette.overlay },
		TelescopeSelectionCaret = { fg = palette.orange, bg = palette.overlay },
		TelescopeTitle = { fg = palette.cyan, bold = styles.bold },

		--- nvim-tree
		NvimTreeNormal = { link = "Normal" },
		NvimTreeFolderIcon = { fg = palette.blue },
		NvimTreeRootFolder = { fg = palette.cyan, bold = styles.bold },
		NvimTreeFolderName = { fg = palette.blue },
		NvimTreeOpenedFolderName = { fg = palette.blue, bold = styles.bold },
		NvimTreeIndentMarker = { fg = palette.muted },
		NvimTreeGitDirty = { fg = groups.git_dirty },
		NvimTreeGitStaged = { fg = groups.git_stage },
		NvimTreeGitMerge = { fg = groups.git_merge },
		NvimTreeGitRenamed = { fg = groups.git_rename },
		NvimTreeGitNew = { fg = groups.git_add },
		NvimTreeGitDeleted = { fg = groups.git_delete },

		--- Gitsigns
		GitSignsAdd = { fg = groups.git_add },
		GitSignsChange = { fg = groups.git_change },
		GitSignsDelete = { fg = groups.git_delete },

		--- cmp
		CmpItemAbbr = { fg = palette.subtle },
		CmpItemAbbrDeprecated = { fg = palette.subtle, strikethrough = true },
		CmpItemAbbrMatch = { fg = palette.text, bold = styles.bold },
		CmpItemAbbrMatchFuzzy = { fg = palette.text, bold = styles.bold },
		CmpItemKind = { fg = palette.blue },
		CmpItemMenu = { fg = palette.subtle },

		--- WhichKey
		WhichKey = { fg = palette.cyan },
		WhichKeyGroup = { fg = palette.blue },
		WhichKeyDesc = { fg = palette.text },
		WhichKeySeparator = { fg = palette.subtle },
		WhichKeyFloat = { bg = palette.surface },
		WhichKeyValue = { fg = palette.orange },
	}

	-- Transparency-specific highlights
	local transparency_highlights = {
		DiagnosticVirtualTextError = { fg = groups.error },
		DiagnosticVirtualTextHint = { fg = groups.hint },
		DiagnosticVirtualTextInfo = { fg = groups.info },
		DiagnosticVirtualTextOk = { fg = groups.ok },
		DiagnosticVirtualTextWarn = { fg = groups.warn },

		FloatBorder = { fg = palette.muted, bg = "NONE" },
		FloatTitle = { fg = palette.blue, bg = "NONE", bold = styles.bold },
		Folded = { fg = palette.text, bg = "NONE" },
		NormalFloat = { bg = "NONE" },
		Normal = { fg = palette.text, bg = "NONE" },
		NormalNC = { fg = palette.text, bg = config.options.dim_inactive_windows and palette._nc or "NONE" },
		Pmenu = { fg = palette.subtle, bg = "NONE" },
		PmenuExtra = { fg = palette.text, bg = "NONE" },
		SignColumn = { fg = palette.text, bg = "NONE" },
		StatusLine = { fg = palette.subtle, bg = "NONE" },
		StatusLineNC = { fg = palette.muted, bg = "NONE" },
		TelescopeNormal = { bg = "NONE" },
		WhichKeyFloat = { bg = "NONE" },
	}

	-- Apply default highlights
	for group, highlight in pairs(default_highlights) do
		highlights[group] = highlight
	end

	-- Apply transparency if enabled
	if styles.transparency then
		for group, highlight in pairs(transparency_highlights) do
			highlights[group] = highlight
		end
	end

	-- Apply user custom highlights
	if config.options.highlight_groups ~= nil and next(config.options.highlight_groups) ~= nil then
		for group, highlight in pairs(config.options.highlight_groups) do
			local existing = highlights[group] or {}
			-- Traverse link
			while existing.link ~= nil do
				existing = highlights[existing.link] or {}
			end
			local parsed = vim.tbl_extend("force", {}, highlight)

			if highlight.fg ~= nil then
				parsed.fg = utilities.parse_color(highlight.fg) or highlight.fg
			end
			if highlight.bg ~= nil then
				parsed.bg = utilities.parse_color(highlight.bg) or highlight.bg
			end
			if highlight.sp ~= nil then
				parsed.sp = utilities.parse_color(highlight.sp) or highlight.sp
			end

			-- Merge with existing unless inherit is false
			if highlight.inherit == false then
				highlights[group] = parsed
			else
				highlights[group] = vim.tbl_extend("force", existing, parsed)
			end
		end
	end

	-- Apply before_highlight callback if provided
	if config.options.before_highlight ~= nil then
		for group, highlight in pairs(highlights) do
			local modified = config.options.before_highlight(group, highlight, palette)
			if modified ~= nil then
				highlights[group] = modified
			end
		end
	end

	-- Set all highlights
	for group, highlight in pairs(highlights) do
		-- Create a copy without the blend key for nvim_set_hl
		local hl_copy = {}
		for k, v in pairs(highlight) do
			if k ~= "blend" then
				hl_copy[k] = v
			end
		end

		vim.api.nvim_set_hl(0, group, hl_copy)
	end

	--- Terminal colors
	if config.options.enable.terminal then
		vim.g.terminal_color_0 = palette.overlay
		vim.g.terminal_color_8 = palette.subtle
		vim.g.terminal_color_1 = palette.red
		vim.g.terminal_color_9 = palette.red
		vim.g.terminal_color_2 = palette.green
		vim.g.terminal_color_10 = palette.green
		vim.g.terminal_color_3 = palette.yellow
		vim.g.terminal_color_11 = palette.yellow
		vim.g.terminal_color_4 = palette.blue
		vim.g.terminal_color_12 = palette.blue
		vim.g.terminal_color_5 = palette.purple
		vim.g.terminal_color_13 = palette.purple
		vim.g.terminal_color_6 = palette.cyan
		vim.g.terminal_color_14 = palette.cyan
		vim.g.terminal_color_7 = palette.text
		vim.g.terminal_color_15 = palette.text
	end
end

---@param variant Variant | nil
function M.colorscheme(variant)
	config.extend_options({ variant = variant })

	vim.opt.termguicolors = true
	if vim.g.colors_name then
		vim.cmd("hi clear")
		vim.cmd("syntax reset")
	end
	vim.g.colors_name = "compline"

	if variant == "lauds" then
		vim.o.background = "light"
	elseif variant == "compline" then
		vim.o.background = "dark"
	end

	set_highlights()
end

---@param options Options
function M.setup(options)
	config.extend_options(options or {})
end

return M
