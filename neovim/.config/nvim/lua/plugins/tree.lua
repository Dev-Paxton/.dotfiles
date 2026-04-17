return {
	"nvim-tree/nvim-tree.lua",
	dependencies = {
		"nvim-tree/nvim-web-devicons"
	},
	lazy = false,
	init = function()
		vim.g.loaded_netrw = 1
		vim.g.loaded_netrwPlugin = 1
	end,
	config = function()
		require('nvim-tree').setup({
			git = { ignore = false },
		})
	end,
	keys = {
		{ '<leader>e', '<cmd>NvimTreeToggle<CR>', desc = 'Toggle file tree' }
	}
}
