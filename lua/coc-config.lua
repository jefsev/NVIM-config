vim.opt.backup = false
vim.opt.writebackup = false

-- Add `:Format` command to format current buffer
vim.api.nvim_create_user_command("Format", "call CocAction('format')", {})
