nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files({ hidden = true} )<cr>
nnoremap <leader>gf <cmd>lua require('telescope.builtin').git_files({ hidden = true} )<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>

lua << EOF
local telescope = require("telescope")
local actions = require "telescope.actions"
telescope.setup({
	defaults = {
		mappings = {
			i = {
				["<leader>d"] = actions.delete_buffer,
			}
		},
		file_ignore_patterns = { ".git/*", "node_modules/*" },
	}
})
EOF
