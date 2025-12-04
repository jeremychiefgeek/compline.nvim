local p = require("compline.palette")
local config = require("compline.config")

local bg_base = p.surface
if config.options.styles.transparency then
	bg_base = "NONE"
end

return {
	normal = {
		a = { bg = p.blue, fg = p.base, gui = "bold" },
		b = { bg = p.overlay, fg = p.blue },
		c = { bg = bg_base, fg = p.text },
	},
	insert = {
		a = { bg = p.green, fg = p.base, gui = "bold" },
		b = { bg = p.overlay, fg = p.green },
		c = { bg = bg_base, fg = p.text },
	},
	visual = {
		a = { bg = p.purple, fg = p.base, gui = "bold" },
		b = { bg = p.overlay, fg = p.purple },
		c = { bg = bg_base, fg = p.text },
	},
	replace = {
		a = { bg = p.cyan, fg = p.base, gui = "bold" },
		b = { bg = p.overlay, fg = p.cyan },
		c = { bg = bg_base, fg = p.text },
	},
	command = {
		a = { bg = p.red, fg = p.base, gui = "bold" },
		b = { bg = p.overlay, fg = p.red },
		c = { bg = bg_base, fg = p.text },
	},
	inactive = {
		a = { bg = bg_base, fg = p.muted, gui = "bold" },
		b = { bg = bg_base, fg = p.muted },
		c = { bg = bg_base, fg = p.muted },
	},
}
