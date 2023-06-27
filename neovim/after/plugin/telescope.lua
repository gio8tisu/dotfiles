require('telescope').load_extension('dap')
local builtin = require('telescope.builtin')
local function find_files() builtin.find_files({ hidden = true }) end

vim.keymap.set('n', '<leader>ff', find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.git_files, {})
vim.keymap.set('n', '<leader>fG', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fm', builtin.marks, {})
vim.keymap.set("n", "<leader>s", builtin.treesitter, {})
vim.keymap.set("n", "<leader>?", builtin.keymaps, {})
vim.keymap.set("n", "<leader> ", builtin.resume, {})
