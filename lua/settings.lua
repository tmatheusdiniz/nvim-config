-- Set <space> as the leader key
-- Note: This must happen before plugins are loaded (otherwise the wrong leader will be used)
vim.g.mapleader = ' '  -- Leader key for normal mode
vim.g.maplocalleader = ' '  -- Leader key for local mappings

-- Display line numbers and relative line numbers
vim.opt.number = true       -- Show absolute line numbers
vim.opt.relativenumber = true  -- Show relative line numbers

-- Set tab and indentation settings
vim.opt.tabstop = 4       -- Use 4 spaces for tab characters
vim.opt.shiftwidth = 4    -- Indentation width is 4 spaces
vim.opt.expandtab = false -- Keep tabs as they are (no spaces for tab expansion)
vim.g.have_nerd_font = true  -- Enable Nerd fonts (for icons and other symbols)

-- Show special whitespace characters
vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- Keep the sign column visible (for diagnostics and error signs)
vim.opt.signcolumn = "yes"

-- Key mappings for creating terminal splits (Ctrl + Arrow Keys)
vim.api.nvim_set_keymap('n', '<C-Up>', ':split | terminal<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-Down>', ':split | terminal<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-Left>', ':vsplit | terminal<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-Right>', ':vsplit | terminal<CR>', { noremap = true, silent = true })

-- Move terminal between splits (Ctrl + Shift + Arrow Keys)
vim.api.nvim_set_keymap('n', '<C-S-Up>', ':wincmd K<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-S-Down>', ':wincmd J<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-S-Left>', ':wincmd H<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-S-Right>', ':wincmd L<CR>', { noremap = true, silent = true })

-- Key mappings for navigating between terminal splits (Alt + WASD)
vim.api.nvim_set_keymap('n', '<A-d>', ':wincmd j<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<A-u>', ':wincmd k<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<A-r>', ':wincmd l<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<A-l>', ':wincmd h<CR>', { noremap = true, silent = true })

local opts = { noremap = true, silent = true }
-- Key mappings for navigating between terminal splits, in the insert mode (Alt + WASD)
vim.api.nvim_set_keymap('i', '<A-u>', '<Esc>:wincmd k<CR>i', opts)
vim.api.nvim_set_keymap('i', '<A-d>', '<Esc>:wincmd j<CR>i', opts)
vim.api.nvim_set_keymap('i', '<A-l>', '<Esc>:wincmd h<CR>i', opts)
vim.api.nvim_set_keymap('i', '<A-r>', '<Esc>:wincmd l<CR>i', opts)

-- Key mappings for navigating between terminal splits, in the terminal mode (Alt + WASD)
vim.api.nvim_set_keymap('t', '<A-u>', '<C-\\><C-n>:wincmd k<CR>', opts)
vim.api.nvim_set_keymap('t', '<A-d>', '<C-\\><C-n>:wincmd j<CR>', opts)
vim.api.nvim_set_keymap('t', '<A-l>', '<C-\\><C-n>:wincmd h<CR>', opts)
vim.api.nvim_set_keymap('t', '<A-r>', '<C-\\><C-n>:wincmd l<CR>', opts)

-- Save the current file with Ctrl + S (Normal Mode)
vim.api.nvim_set_keymap('n', '<C-s>', ':w<CR>', { noremap = true, silent = true })

-- Select all text and enter Visual Mode (Ctrl + Alt + A)
vim.api.nvim_set_keymap('n', '<C-A-a>', 'ggVG', { noremap = true, silent = true })

-- Save the current file with Ctrl + S (Insert Mode)
vim.api.nvim_set_keymap('i', '<C-s>', '<Esc>:w<CR>i', { noremap = true, silent = true })

-- Copy selected text with Ctrl + C (Insert Mode)
vim.api.nvim_set_keymap('i', '<C-c>', '<Esc>"+y', { noremap = true, silent = true })

-- Paste from clipboard with Ctrl + V (Insert Mode)
vim.api.nvim_set_keymap('i', '<C-v>', '<C-r>+', { noremap = true, silent = true })

-- Cut selected text with Ctrl + X (Insert Mode)
vim.api.nvim_set_keymap('i', '<C-x>', '<Esc>"+d', { noremap = true, silent = true })

-- Undo with Ctrl + Z (Insert Mode)
vim.api.nvim_set_keymap('i', '<C-z>', '<C-o>u', { noremap = true, silent = true })

-- Move to the start and end of the text (Ctrl + A, Ctrl + E)
vim.api.nvim_set_keymap('i', '<C-a>', '<Esc>ggI', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '<C-e>', '<Esc>G$a', { noremap = true, silent = true })

-- Move to the start and end of the line (Ctrl + D, Ctrl + T)
vim.api.nvim_set_keymap('i', '<C-d>', '<Esc>^i', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '<C-t>', '<Esc>$a', { noremap = true, silent = true })

-- Copy selected text with Ctrl + C (Normal Mode)
vim.api.nvim_set_keymap('v', '<C-c>', '"+y', { noremap = true, silent = true })

-- Cut selected text with Ctrl + X (Normal Mode)
vim.api.nvim_set_keymap('v', '<C-x>', '"+d', { noremap = true, silent = true })

-- Select text using Ctrl + Shift + Left/Right (Insert Mode)
vim.api.nvim_set_keymap('i', '<C-S-Left>', '<Esc>v0i', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '<C-S-Right>', '<Esc>v$ia', { noremap = true, silent = true })

-- Terminal mode mappings
vim.api.nvim_set_keymap('t', '<C-n>', '<C-\\><C-n>', { noremap = true, silent = true })

-- Search for a word in the text (Ctrl + F)
vim.api.nvim_set_keymap('n', '<C-f>', '/\\C', { noremap = true, silent = false })

-- Replace a word (Ctrl + R)
vim.api.nvim_set_keymap('n', '<C-r>', ':%s/<C-r><C-w>/', { noremap = true, silent = false })

-- Jump to a specific line (Ctrl + G)
vim.api.nvim_set_keymap('n', '<C-g>', ':execute "normal! " . input("Go to line: ") . "G"<CR>', { noremap = true, silent = true })

-- Navigation into buffers using barbar plugin
vim.api.nvim_set_keymap('n', 'H', '<Cmd>BufferPrevious<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'L', '<Cmd>BufferNext<CR>', { noremap = true, silent = true })

-- Close the current buffer/tab (Ctrl + Q)
vim.api.nvim_set_keymap('n', '<C-q>', ':q<CR>', { noremap = true, silent = true })

-- Disable swap files
vim.opt.swapfile = false  -- Avoid creating swap files

