vim.cmd([[set shortmess+=I]])
vim.cmd([[set noswapfile]])
vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.opt.winborder = "rounded"
vim.opt.pumborder = "rounded"
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.showtabline = 2
vim.opt.signcolumn = "yes"
vim.opt.wrap = false
vim.opt.cursorcolumn = false
vim.opt.ignorecase = true
vim.opt.smartindent = true
vim.opt.termguicolors = true
vim.opt.undofile = true
vim.opt.number = true
vim.opt.relativenumber = true

vim.pack.add({
	{ src = "https://github.com/oskarnurm/koda.nvim" },
	{ src = "https://github.com/stevearc/oil.nvim" },
	{ src = "https://github.com/nvim-tree/nvim-web-devicons" },
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter" },
	{ src = "https://github.com/aznhe21/actions-preview.nvim" },

	{ src = "https://github.com/LinArcX/telescope-env.nvim" },
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter-textobjects" },
	{ src = "https://github.com/nvim-telescope/telescope.nvim" },
	{ src = "https://github.com/nvim-telescope/telescope-ui-select.nvim" },

	{ src = "https://github.com/nvim-lua/plenary.nvim" },
	{ src = "https://github.com/neovim/nvim-lspconfig" },
	{ src = "https://github.com/mason-org/mason.nvim" },
	{ src = "https://github.com/nvim-tree/nvim-tree.lua" },
	{ src = "https://github.com/akinsho/bufferline.nvim" },
	{ src = "https://github.com/goolord/alpha-nvim" },
})

require("koda").setup({
	colors = {
		dark = {
			bg = "#090909",
			line = "#1a1a1a",
		},

		moss = {
			bg = "#090d0e",
			line = "#151d1e",
		},
	},
})

vim.cmd.colorscheme("koda-dark")

require("mason").setup()

-- NVIM-TREE SETUP & CONFIG
require("nvim-tree").setup({
	sort_by = "case_sensitive",
	renderer = {
		group_empty = true,
	},
	filters = {
		dotfiles = false,
	},
})

vim.keymap.set("n", "<leader>e", require("nvim-tree.api").tree.toggle, { desc = "Toggle file explorer" })

-- TELESCOPE SETUP & CONFIG
local telescope = require("telescope")
local builtin = require("telescope.builtin")
telescope.setup({
	defaults = {
		preview = { treesitter = false },
		color_devicons = true,
		sorting_strategy = "ascending",
		path_displays = { "smart" },
		layout_config = {
			height = 0.9,
			width = 0.9,
			prompt_position = "bottom",
			preview_cutoff = 40,
		},
	},
})
telescope.load_extension("ui-select")

require("actions-preview").setup({
	backend = { "telescope" },
	extensions = { "env" },
	telescope = vim.tbl_extend("force", require("telescope.themes").get_dropdown(), {}),
})

vim.keymap.set("n", "<leader>ff", builtin.find_files)
vim.keymap.set("n", "<leader>fg", builtin.live_grep)
vim.keymap.set("n", "<leader>fb", builtin.buffers)
vim.keymap.set("n", "<leader>fh", builtin.help_tags)


-- LSP SETUP & CONFIG

vim.opt.winborder = "rounded"

vim.lsp.config("*", {
	-- Make LSP floating windows rounded
	ui = {
		border = "rounded",
	},
})

vim.lsp.config("clangd", {
	cmd = { "clangd" },
})

vim.lsp.enable("clangd")
vim.diagnostic.config({
	virtual_text = true,
	signs = {
		text = {
			[vim.diagnostic.severity.ERROR] = "E",
			[vim.diagnostic.severity.WARN] = "W",
			[vim.diagnostic.severity.INFO] = "I",
			[vim.diagnostic.severity.HINT] = "H",
		},
	},
	underline = true,
	update_in_insert = false,
	severity_sort = true,
})

vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("my.lsp", {}),
	callback = function(args)
		local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
		if client:supports_method("textDocument/completion") then
			-- Optional: trigger autocompletion on EVERY keypress. May be slow!
			local chars = {}
			for i = 32, 126 do
				table.insert(chars, string.char(i))
			end
			client.server_capabilities.completionProvider.triggerCharacters = chars
			vim.lsp.completion.enable(true, client.id, args.buf, { autotrigger = true })
		end
	end,
})

vim.cmd([[set completeopt+=menuone,noselect,popup]])

vim.lsp.enable({
	"lua_ls",
	"clangd",
	"glsl_analyzer",
})

vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(event)
		local opts = { buffer = event.buf }

		vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
		vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
		vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
		vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
		vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
	end,
})

-- TREESITTER SETUP & CONFIG
require("nvim-treesitter").install({ "c", "cpp" })

vim.api.nvim_create_autocmd("FileType", {
	pattern = { "c", "cpp" },
	callback = function()
		vim.treesitter.start()
	end,
})

-- OIL SETUP & CONFIG
require("oil").setup()
vim.keymap.set("n", "-", "<cmd>Oil<cr>")

-- FORMATTING
vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*",
	callback = function()
		local ft = vim.bo.filetype
		if ft == "c" or ft == "cpp" or ft == "lua" then
			vim.lsp.buf.format({ timeout_ms = 2000 })
		end
	end,
})

-- BUFFERS
require("bufferline").setup {
	options = {
		numbers = "ordinal",
		buffer_close_icon = "x",
		modified_icon = "o",
		close_icon = "x",
		show_buffer_icons = true,
		show_buffer_close_icons = true,
		show_tab_close_icons = true,
		always_show_bufferline = true,
		separator_style = "none",
	},
}

-- ALPHA DASHBOARD SETUP
local alpha = require("alpha")
local dashboard = require("alpha.themes.dashboard")

--vim.fn.stdpath("config") .. "/Logo.txt"
dashboard.section.header.val = {
	[[                                                                     ]],
	[[       ███████████           █████      ██                     ]],
	[[      ███████████             █████                             ]],
	[[      ████████████████ ███████████ ███   ███████     ]],
	[[     ████████████████ ████████████ █████ ██████████████   ]],
	[[    █████████████████████████████ █████ █████ ████ █████   ]],
	[[  ██████████████████████████████████ █████ █████ ████ █████  ]],
	[[ ██████  ███ █████████████████ ████ █████ █████ ████ ██████ ]],
	[[ ██████   ██  ███████████████   ██ █████████████████ ]],
	[[ ██████   ██  ███████████████   ██ █████████████████ ]],
}

dashboard.section.buttons.val = {
	dashboard.button("f", "  Find File", "<cmd>Telescope find_files<CR>"),
	dashboard.button("e", "  Explorer", "<cmd>Oil<CR>"),
	dashboard.button("q", "  Quit", "<cmd>qa<CR>"),
}

dashboard.section.buttons.val = {
	dashboard.button("e", "  > New File", "<cmd>ene<CR>"),
	dashboard.button("SPC ff", "󰱼 > Find File", "<cmd>Telescope find_files<CR>"),
	dashboard.button("CTRL N", "  > Toggle file explorer", "<cmd>Oil<CR>"),
	dashboard.button("SPC fw", "  > Find Word", "<cmd>Telescope live_grep<CR>"),
	dashboard.button("q", " > Quit NVIM", "<cmd>qa<CR>"),
}

dashboard.section.footer.val = {
	"Welcome to Neovim " .. vim.version().major .. "." .. vim.version().minor,
}

alpha.setup(dashboard.opts)
