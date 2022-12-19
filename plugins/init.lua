return {
	-- Languages
	{ "iloginow/vim-stylus" },
	{ "mustache/vim-mustache-handlebars" },
	{ "pangloss/vim-javascript" },
	{ "jelera/vim-javascript-syntax" },

	-- Themes
	{ "EdenEast/nightfox.nvim" },
	{ "nyoom-engineering/oxocarbon.nvim" },
	{ "wuelnerdotexe/vim-enfocado" },

	-- UI
	{ "karb94/neoscroll.nvim" },

	-- Debugging
	["mfussenegger/nvim-dap"] = {},
	["mxsdev/nvim-dap-vscode-js"] = {
		after = "mason-nvim-dap.nvim",
		config = function() require "user.plugins.nvim-dap-vscode-js" end,
	},
	["jayp0521/mason-nvim-dap.nvim"] = {
		after = { "mason.nvim", "nvim-dap" },
		config = function() require "user.plugins.mason-nvim-dap" end,
	},
	["rcarriga/nvim-dap-ui"] = { after = "nvim-dap", config = function() require "user.plugins.dapui" end },
	["theHamsta/nvim-dap-virtual-text"] = {
		after = "nvim-dap",
		config = function() require "user.plugins.nvim-dap-virtual-text" end,
	},

	{
		"folke/trouble.nvim",
		requires = "kyazdani42/nvim-web-devicons",
		config = function()
			require("trouble").setup {
				-- your configuration comes here
				-- or leave it empty to use the default settings
				-- refer to the configuration section below
			}
		end
	},
}
