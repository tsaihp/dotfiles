-- 基本編輯器設定
vim.opt.number = true
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

-- 初始化 lazy.nvim
vim.opt.rtp:prepend(vim.fn.stdpath("data") .. "/lazy/lazy.nvim")

require("lazy").setup({
  -- Plugin 清單等一下補上
  { "neovim/nvim-lspconfig" },
  { "hrsh7th/nvim-cmp" },
  { "hrsh7th/cmp-nvim-lsp" },
  { "L3MON4D3/LuaSnip" },
  { "nvim-lualine/lualine.nvim" },
  { "nvim-telescope/telescope.nvim", dependencies = { "nvim-lua/plenary.nvim" } }
})

print("✅ lazy.nvim 載入成功")

-- init leader
-- vim.g.mapleader = "<C-\\>"

require("lsp")

require("cmp_config")

vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
vim.keymap.set('n', 'gr', vim.lsp.buf.references, {})
vim.keymap.set('n', '<leader>fs', require('telescope.builtin').lsp_document_symbols, {})
vim.keymap.set('n', '<leader>fw', require('telescope.builtin').lsp_workspace_symbols, {})

