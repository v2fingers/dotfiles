vim.cmd("highlight clear")
if vim.fn.exists("syntax_on") then
	vim.cmd("syntax reset")
end

vim.g.colors_name = "mono"

local c = {
	bg       = "#0D0D0D",
	surface  = "#151515",
	surface2 = "#1F1F1F",

	border   = "#404040",
	dim      = "#666666",
	muted    = "#808080",
	gray     = "#999999",
	light    = "#ADADAD",
	bright   = "#D0D0D0",
	text     = "#E6E6E6",
	white    = "#FFFFFF",
}

local highlights = {
	-- nvim-tree
	NvimTreeNormal = {
		fg = c.text,
		bg = c.bg,
	},

	NvimTreeNormalNC = {
		fg = c.text,
		bg = c.bg,
	},

	NvimTreeEndOfBuffer = {
		fg = c.bg,
		bg = c.bg,
	},

	NvimTreeRootFolder = {
		fg = c.bright,
		bold = true,
	},

	NvimTreeFolderName = {
		fg = c.light,
	},

	NvimTreeFolderIcon = {
		fg = c.muted,
	},

	NvimTreeOpenedFolderName = {
		fg = c.white,
		bold = true,
	},

	NvimTreeEmptyFolderName = {
		fg = c.muted,
	},

	NvimTreeIndentMarker = {
		fg = c.border,
	},

	NvimTreeGitDirty = {
		fg = c.muted,
	},

	NvimTreeGitNew = {
		fg = c.bright,
	},

	NvimTreeGitDeleted = {
		fg = c.dim,
	},

	NvimTreeSpecialFile = {
		fg = c.white,
		bold = true,
	},

	NvimTreeCursorLine = {
		bg = c.surface,
	},

	NvimTreeWinSeparator = {
		fg = c.border,
		bg = c.bg,
	},


	Normal = {
		fg = c.text,
		bg = c.bg,
	},

	NormalFloat = {
		fg = c.text,
		bg = c.surface,
	},

	Cursor = {
		fg = c.bg,
		bg = c.light,
	},

	CursorLine = {
		bg = c.surface,
	},

	CursorLineNr = {
		fg = c.bright,
	},

	LineNr = {
		fg = c.dim,
	},

	Visual = {
		fg = c.bg,
		bg = c.light,
	},

	Search = {
		fg = c.bg,
		bg = c.light,
	},

	IncSearch = {
		fg = c.bg,
		bg = c.white,
	},

	StatusLine = {
		fg = c.text,
		bg = c.surface,
	},

	StatusLineNC = {
		fg = c.muted,
		bg = c.surface,
	},

	WinSeparator = {
		fg = c.border,
	},

	Pmenu = {
		fg = c.text,
		bg = c.surface,
	},

	PmenuSel = {
		fg = c.bg,
		bg = c.light,
	},

	Comment = {
		fg = c.dim,
		italic = true,
	},

	Constant = {
		fg = c.light,
	},

	String = {
		fg = c.gray,
	},

	Character = {
		fg = c.gray,
	},

	Number = {
		fg = c.bright,
	},

	Boolean = {
		fg = c.bright,
	},

	Identifier = {
		fg = c.text,
	},

	Function = {
		fg = c.white,
		bold = true,
	},

	Statement = {
		fg = c.light,
		bold = true,
	},

	Keyword = {
		fg = c.light,
	},

	Conditional = {
		fg = c.light,
	},

	Repeat = {
		fg = c.light,
	},

	Label = {
		fg = c.muted,
	},

	Operator = {
		fg = c.muted,
	},

	Type = {
		fg = c.bright,
	},

	Structure = {
		fg = c.bright,
	},

	Typedef = {
		fg = c.bright,
	},

	Delimiter = {
		fg = c.muted,
	},

	Special = {
		fg = c.light,
	},

	PreProc = {
		fg = c.gray,
	},

	Include = {
		fg = c.gray,
	},

	Define = {
		fg = c.gray,
	},

	Error = {
		fg = c.white,
		bg = c.surface2,
		bold = true,
	},

	WarningMsg = {
		fg = c.bright,
	},

	ErrorMsg = {
		fg = c.white,
		bold = true,
	},

	Todo = {
		fg = c.bg,
		bg = c.light,
		bold = true,
	},

	DiffAdd = {
		fg = c.bright,
		bg = c.surface,
	},

	DiffChange = {
		fg = c.light,
		bg = c.surface2,
	},

	DiffDelete = {
		fg = c.dim,
		bg = c.surface,
	},
}

for group, opts in pairs(highlights) do
	vim.api.nvim_set_hl(0, group, opts)
end
