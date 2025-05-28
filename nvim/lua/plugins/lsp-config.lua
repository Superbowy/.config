return {
	{
		"williamboman/mason.nvim",
		version = "1.11.0",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		version = "1.32.0",
		opts = {
			auto_install = true,
			ensure_installed = { "lua_ls", "pyright", "clangd" },
		},
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			local lspconfig = require("lspconfig")

			lspconfig.lua_ls.setup({
				capabilities = capabilities,
			})
			lspconfig.pyright.setup({
				capabilities = capabilities,
				settings = {
					pyright = { autoImportCompletion = true },
					python = {
						analysis = {
							autoSearchPaths = true,
							diagnosticMode = "openFilesOnly",
							useLibraryCodeForTypes = true,
							typeCheckingMode = "off",
						},
					},
				},
			})
			lspconfig.clangd.setup({
				capabilities = capabilities,
			})

			local diagnostics_active = true

			vim.keymap.set("n", "<leader>hd", function()
				if diagnostics_active then
					vim.diagnostic.config({
						virtual_text = false,
						signs = true,
						underline = false,
					})
					print("Diagnostics disabled")
				else
					vim.diagnostic.config({
						virtual_text = true,
						signs = true,
						underline = true,
					})
					print("Diagnostics enabled")
				end
				diagnostics_active = not diagnostics_active
			end, { desc = "Toggle LSP diagnostics" })

			vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
			vim.keymap.set("n", "<leader>rr", vim.lsp.buf.rename, {})
			vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
			vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, {})
		end,
	},
}
