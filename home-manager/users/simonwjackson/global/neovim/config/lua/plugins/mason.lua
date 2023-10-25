-- Portable package manager for Neovim that runs everywhere Neovim runs. Easily install and manage LSP servers,
-- DAP servers, linters, and formatters.

return {
	{
		"williamboman/mason.nvim",
		init = function()
			require("mason").setup()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"lua_ls",
					-- Broken "awk_ls",
					"astro",
					"bashls",
					"clangd",
					"cssmodules_ls",
					"cucumber_language_server",
					"denols",
					"dockerls",
					"docker_compose_language_service",
					"eslint",
					"elixirls",
					"elmls",
					"graphql",
					"html",
					-- Broken "hls",
					"jsonls",
					"tsserver",
					"zk",
					"marksman",
					"remark_ls",
					"vale_ls",
					-- "nil_ls",
					-- Broken "ocamllsp",
					"purescriptls",
					"jedi_language_server",
					"pyre",
					"pyright",
					-- "pylyzer",
					"sourcery",
					"pylsp",
					"ruff_lsp",
					"rescriptls",
					"reason_ls",
					"ruby_ls",
					--"solargraph",
					"sorbet",
					--"standardrb",
					"sqlls",
					"svelte",
					"taplo",
					"stylelint_lsp",
					"tailwindcss",
					"tsserver",
					"vimls",
					"vuels",
					"yamlls",
					"lemminx",
				},
			})
		end,
		build = ":MasonUpdate", -- :MasonUpdate updates registry contents
	},
}
