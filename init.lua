require('settings')

-- lazy.nvim configuration
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Load plugins with lazy.nvim
require("lazy").setup({
  {
    'echasnovski/mini.icons',
    event = 'VimEnter',  -- Load on VimEnter
  },
  require 'plugins.telescope',
  -- Additional plugins...
  {
    "hrsh7th/nvim-cmp",  -- Autocompletion plugin
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",  -- LSP source for nvim-cmp
      "hrsh7th/cmp-buffer",    -- Buffer source for nvim-cmp
      "hrsh7th/cmp-path",      -- Path source for nvim-cmp
      "hrsh7th/cmp-cmdline",   -- Cmdline source for nvim-cmp
    },
    config = function()
      local cmp = require("cmp")
      cmp.setup({
        mapping = {
          ["<C-p>"] = cmp.mapping.select_prev_item(),
          ["<C-n>"] = cmp.mapping.select_next_item(),
          ["<C-d>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<C-e>"] = cmp.mapping.abort(),
          ["<CR>"] = cmp.mapping.confirm({ select = true }), -- Confirm selection
        },
        sources = {
          { name = "nvim_lsp" },
          { name = "buffer" },
          { name = "path" },
          { name = "cmdline" },
        },
        formatting = {
          format = function(entry, vim_item)
            vim_item.kind = string.format("%s", vim_item.kind)
            return vim_item
          end,
        },
      })
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
    config = function()
      require'nvim-treesitter.configs'.setup {
        ensure_installed = { "c", "java" },  -- Install parsers for C and Java
        highlight = {
          enable = true,
        },
      }
    end
  },
  require 'plugins.neo-tree',
  require 'plugins.coc',
  require 'plugins.lsp',
  require 'plugins.auto-pairs',
  require 'plugins.web-devicons',
  require 'plugins.42-header',
  require 'plugins.42-norminette',
  require 'plugins.barbar',
  require 'themes.cyberdream',
  -- Theme setup
  {
	"williamboman/mason.nvim",
	config = function()
	require("mason").setup()
	end
  },
})

-- LSP configuration for clangd
local lspconfig = require('lspconfig')

-- clangd setup with nvim-cmp capabilities
lspconfig.clangd.setup({
  capabilities = require('cmp_nvim_lsp').default_capabilities(),
  on_attach = function(client, bufnr)
    -- Key mappings for LSP functions
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', { noremap = true, silent = true })
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<Cmd>lua vim.lsp.buf.references()<CR>', { noremap = true, silent = true })
  end,
  flags = {
    debounce_text_changes = 150,
  },
})

-- LSP configuration for Java with jdtls
lspconfig.jdtls.setup({
  cmd = { "jdtls" },
  root_dir = lspconfig.util.root_pattern('.git', 'mvnw', 'gradlew', 'pom.xml', 'build.gradle'),
  settings = {
    java = {
      home = "/path/to/jdk",  -- Update with JDK path if needed
    }
  },
  capabilities = require('cmp_nvim_lsp').default_capabilities(),
  on_attach = function(client, bufnr)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', { noremap = true, silent = true })
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<Cmd>lua vim.lsp.buf.references()<CR>', { noremap = true, silent = true })
  end,
  flags = {
    debounce_text_changes = 150,
  },
})
