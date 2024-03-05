nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
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
		}
	}
})
EOF
