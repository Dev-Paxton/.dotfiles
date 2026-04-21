return {
    'nvim-telescope/telescope.nvim', version = '*',
    dependencies = {
        'nvim-lua/plenary.nvim',
        { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    },
    init = function()
        vim.api.nvim_create_autocmd("VimEnter", {
            callback = function()
		if vim.fn.argc() == 0 then
                    vim.schedule(function()
                        require("telescope.builtin").find_files({ hidden = true })
                    end)
                end
            end,
        })
    end,
    keys = {
        { '<leader>ff', '<cmd>Telescope find_files hidden=true<CR>', desc = 'Find files' },
        { '<leader>fa', '<cmd>Telescope find_files hidden=true no_ignore=true<CR>', desc = 'Find all files (incl. gitignored)' },
        { '<leader>fg', '<cmd>Telescope live_grep<CR>', desc = 'Live grep' },
        { '<leader>fb', '<cmd>Telescope buffers<CR>', desc = 'Buffers' },
        { '<leader>fh', '<cmd>Telescope help_tags<CR>', desc = 'Help tags' },
        { '<leader>fk', '<cmd>Telescope keymaps<CR>', desc = 'Keymaps' },
    },
}
