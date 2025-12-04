local options = require("compline.config").options

local variants = {
	compline = {
		_nc = "#16141a",
		base = "#1a1d21",
		surface = "#232529",
		overlay = "#3d424a",
		muted = "#515761",
		subtle = "#7d7a75",
		text = "#e0dcd4",
		
		-- Named colors from original palette
		red = "#cdacac",
		orange = "#ccc4b4",
		yellow = "#d4ccb4",
		green = "#b8c4b8",
		blue = "#b4bcc4",
		cyan = "#b4c0c8",
		purple = "#c0b8bc",
		brown = "#c8beb8",
		teal = "#b4c4bc",
		dark_cyan = "#98a4ac",
		
		-- Additional colors
		highlight_low = "#232529",
		highlight_med = "#3d424a",
		highlight_high = "#515761",
		none = "NONE",
	},
	lauds = {
		_nc = "#e8e7e3",
		base = "#f0efeb",
		surface = "#f5f4f2",
		overlay = "#e5e3e0",
		muted = "#9a9791",
		subtle = "#7d7a75",
		text = "#1a1d21",
		
		-- Named colors from original palette
		red = "#8B6666",
		orange = "#7A6D5A",
		yellow = "#8B7E52",
		green = "#5A6B5A",
		blue = "#5A6B7A",
		cyan = "#64757d",
		purple = "#4D6B6B",
		brown = "#546470",
		
		-- Additional colors
		highlight_low = "#efeeed",
		highlight_med = "#e5e3e0",
		highlight_high = "#d8d6d3",
		none = "NONE",
	},
}

-- Apply user palette overrides if provided
if options.palette ~= nil and next(options.palette) then
	for variant_name, override_palette in pairs(options.palette) do
		if variants[variant_name] then
			variants[variant_name] = vim.tbl_extend("force", variants[variant_name], override_palette or {})
		end
	end
end

-- Select the appropriate variant
if variants[options.variant] ~= nil then
	return variants[options.variant]
end

-- Auto-select based on background
return vim.o.background == "light" and variants.lauds or variants.compline
