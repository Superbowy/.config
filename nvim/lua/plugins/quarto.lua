return {
	{
		"quarto-dev/quarto-nvim",
		dependencies = {
			"jmbuhr/otter.nvim",
			"nvim-treesitter/nvim-treesitter",
		},
		config = function()
			require("quarto").setup({})

			require("otter").setup({
				lsp = {
					diagnostic_update_events = { "BufWritePost"},
				},
			})
		end,
	},
}
