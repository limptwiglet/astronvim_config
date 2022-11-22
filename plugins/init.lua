return {
	{ "iloginow/vim-stylus" },
	{ "mustache/vim-mustache-handlebars" },
	{ "EdenEast/nightfox.nvim" },


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

}
