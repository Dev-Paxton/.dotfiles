vim.g.mapleader = " "

local function format_all_tables()
    local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)
    local i = 1
    while i <= #lines do
        if lines[i]:match("^%s*|") then
            local start = i
            while i <= #lines and lines[i]:match("^%s*|") do
                i = i + 1
            end
            vim.cmd(start .. "," .. (i - 1) .. "!sed 's/ *| */|/g' | column -t -s '|' -o ' | ' | sed 's/^ //'")
            lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)
        else
            i = i + 1
        end
    end
end
vim.keymap.set("n", "<Leader>ft", format_all_tables, { desc = "Format all tables" })

vim.keymap.set("n", "<Leader>d", function()
    if vim.wo.diff then
        vim.cmd("diffoff | wincmd p | bd")
    else
        vim.cmd("vert new | set buftype=nofile | read ++edit # | 0d_ | diffthis | wincmd p | diffthis")
    end
end, { desc = "Toggle diff since last save" })

vim.keymap.set({ "n", "v" }, "j", "gj")
vim.keymap.set({ "n", "v" }, "k", "gk")

vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Window left" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Window down" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Window up" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Window right" })
