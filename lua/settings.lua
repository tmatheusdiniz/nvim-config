vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })
-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Show line numbers and relative line numbers
vim.opt.number = true   -- Exibe números de linha
vim.opt.relativenumber = true  -- Exibe números relativos

-- Set tab and indentation settings
vim.opt.tabstop = 4       -- Define tabulações para 4 espaços
vim.opt.shiftwidth = 4    -- Define o recuo automático para 4 espaços
vim.opt.expandtab = false -- keep tabulações
vim.g.have_nerd_font = true

--Show whitespaces characters
vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- reserve a column to compilation erros
vim.opt.signcolumn = "yes"

-- Key mappings for creating terminal splits (Ctrl + Up, Ctrl + Down, Ctrl + Left, Ctrl + Right)
vim.api.nvim_set_keymap('n', '<C-Up>', ':split | terminal<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-Down>', ':split | terminal<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-Left>', ':vsplit | terminal<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-Right>', ':vsplit | terminal<CR>', { noremap = true, silent = true })

-- Move terminal between splits horizontally or vertically using Ctrl + Shift
vim.api.nvim_set_keymap('n', '<C-S-Up>', ':wincmd K<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-S-Down>', ':wincmd J<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-S-Left>', ':wincmd H<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-S-Right>', ':wincmd L<CR>', { noremap = true, silent = true })

-- Key mappings for navigating between terminal splits (Alt + d, u, l, r)
vim.api.nvim_set_keymap('n', '<A-d>', ':wincmd j<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<A-u>', ':wincmd k<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<A-r>', ':wincmd l<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<A-l>', ':wincmd h<CR>', { noremap = true, silent = true })

-- Save the current file with Ctrl + S (Normal Mode)
vim.api.nvim_set_keymap('n', '<C-s>', ':w<CR>', { noremap = true, silent = true })

-- Save the current file with Ctrl + S (Insert Mode)
vim.api.nvim_set_keymap('i', '<C-s>', '<Esc>:w<CR>', { noremap = true, silent = true })

-- Copy selected text with Ctrl + C (Insert Mode)
vim.api.nvim_set_keymap('i', '<C-c>', '<Esc>"+y', { noremap = true, silent = true })

-- Paste from clipboard with Ctrl + V (Insert Mode)
vim.api.nvim_set_keymap('i', '<C-v>', '<C-r>+', { noremap = true, silent = true })

-- Cut selected text with Ctrl + X (Insert Mode)
vim.api.nvim_set_keymap('i', '<C-x>', '<Esc>"+d', { noremap = true, silent = true })

--Ctrl z
vim.api.nvim_set_keymap('i', '<C-z>', '<C-o>u', { noremap = true, silent = true })

--Start and end of archive
vim.api.nvim_set_keymap('i', '<C-a>', '<Esc>ggI', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '<C-e>', '<Esc>G$a', { noremap = true, silent = true })
--Start and end of line
vim.api.nvim_set_keymap('i', '<C-d>', '<Esc>^i', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '<C-t>', '<Esc>$a', { noremap = true, silent = true })

-- Copy selected text with Ctrl + C (Normal Mode)
vim.api.nvim_set_keymap('v', '<C-c>', '"+y', { noremap = true, silent = true })

-- Cut selected text with Ctrl + X (Normal Mode)
vim.api.nvim_set_keymap('v', '<C-x>', '"+d', { noremap = true, silent = true })

-- Key mappings for selection with Ctrl + Shift + Left/Right
vim.api.nvim_set_keymap('i', '<C-S-Left>', '<Esc>v0i', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '<C-S-Right>', '<Esc>v$ia', { noremap = true, silent = true })

--Terminal
vim.api.nvim_set_keymap('t', '<C-n>', '<C-\\><C-n>', { noremap = true, silent = true })

--Key for <
vim.api.nvim_set_keymap('i', '<', '<><Esc>i', { noremap = true, silent = true })

--Search for the word in the text
vim.api.nvim_set_keymap('n', '<C-f>', '/\\C', { noremap = true, silent = false })

--Replace the word
vim.api.nvim_set_keymap('n', '<C-r>', ':%s/<C-r><C-w>/', { noremap = true, silent = false })

--GotoLine
vim.api.nvim_set_keymap('n', '<C-g>', ':execute "normal! " . input("Go to line: ") . "G"<CR>', { noremap = true, silent = true })

-- Navigation into buffers /barbar plugin
vim.api.nvim_set_keymap('n', 'H', '<Cmd>BufferPrevious<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'L', '<Cmd>BufferNext<CR>', { noremap = true, silent = true })
-- Key mapping to close the current buffer/tab in barbar.nvim
vim.api.nvim_set_keymap('n', '<C-q>', '<Cmd>BufferClose<CR>', { noremap = true, silent = true })

--prevent swap files
vim.opt.swapfile = false
