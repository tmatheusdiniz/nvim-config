require('settings')

-- Configuração do lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- versão estável
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Carregar plugins com lazy.nvim
require("lazy").setup({
  {
    'echasnovski/mini.icons',
    event = 'VimEnter',  -- ou outro evento apropriado
  },
  require 'plugins.telescope',
  -- Outros plugins...
  {
    "hrsh7th/nvim-cmp",  -- Plugin de autocompletar
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",  -- Integra o nvim-cmp com LSP (incluindo clangd)
      "hrsh7th/cmp-buffer",    -- Completamento com base no conteúdo do buffer
      "hrsh7th/cmp-path",      -- Completamento para caminhos de arquivos
      "hrsh7th/cmp-cmdline",   -- Completamento de comandos no Neovim
    },
    config = function()
      local cmp = require("cmp")

      -- Configuração do nvim-cmp
      cmp.setup({
        mapping = {
          ["<C-p>"] = cmp.mapping.select_prev_item(),
          ["<C-n>"] = cmp.mapping.select_next_item(),
          ["<C-d>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<C-e>"] = cmp.mapping.abort(),
          ["<CR>"] = cmp.mapping.confirm({ select = true }), -- Confirmar completamento
        },
        sources = {
          { name = "nvim_lsp" },      -- Autocompletar usando o LSP (como clangd)
          { name = "buffer" },        -- Autocompletar a partir do conteúdo do buffer
          { name = "path" },          -- Autocompletar com caminhos de arquivos
          { name = "cmdline" },       -- Autocompletar comandos no Neovim
        },
        formatting = {
          format = function(entry, vim_item)
            -- Formatação para exibir os itens de forma mais agradável
            vim_item.kind = string.format("%s", vim_item.kind)
            return vim_item
          end,
        },
      })
    end,
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
})

-- Configuração do LSP para clangd
local lspconfig = require('lspconfig')

-- Configuração do clangd para usar com nvim-cmp
lspconfig.clangd.setup({
  capabilities = require('cmp_nvim_lsp').default_capabilities(),  -- Integra o LSP com nvim-cmp
  on_attach = function(client, bufnr)
    -- Mapeamento de teclas para ir para a definição, encontrar referências, etc.
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', { noremap = true, silent = true })
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<Cmd>lua vim.lsp.buf.references()<CR>', { noremap = true, silent = true })
  end,
  flags = {
    debounce_text_changes = 150,
  },
  -- Outros ajustes conforme necessário
})

