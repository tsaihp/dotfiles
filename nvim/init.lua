-- leader
-- vim.g.mapleader = "<c-\\>"

-- editor settings
vim.opt.number = true
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.hlsearch = true
vim.opt.ruler = true
vim.opt.encoding = "utf-8"
vim.opt.termguicolors = true

-- init lazy.nvim
vim.opt.rtp:prepend(vim.fn.stdpath("data") .. "/lazy/lazy.nvim")

require("lazy").setup({
  -- Plugin list
  { "neovim/nvim-lspconfig" },
  { "hrsh7th/nvim-cmp" },
  { "hrsh7th/cmp-nvim-lsp" },
  { "L3MON4D3/LuaSnip" },
  { "tpope/vim-fugitive" },
  { "nvim-lualine/lualine.nvim" },
  { "nvim-telescope/telescope.nvim", dependencies = { "nvim-lua/plenary.nvim" } },
  { "nvim-tree/nvim-tree.lua", dependencies = { "nvim-tree/nvim-web-devicons" } },
  { "gpanders/editorconfig.nvim" }
})

require("lsp")

require("cmp_config")

require("nvim-tree").setup({
  view = {
    width = 35,
    side = "left",
    number = true,
    relativenumber = true,
  },
  filters = {
    dotfiles = false,  -- 預設顯示 .gitignore、.config 等檔案
  },
  git = {
    enable = true,      -- 顯示 Git 狀態圖示
  },
})

vim.keymap.set('n', '<C-\\><C-D>', vim.lsp.buf.definition, {})
vim.keymap.set('n', '<C-\\><C-C>', vim.lsp.buf.references, {})
vim.keymap.set('n', '<C-\\><C-L>', require('telescope.builtin').lsp_document_symbols, {})
vim.keymap.set('n', '<C-\\><C-W>', require('telescope.builtin').lsp_workspace_symbols, {})
vim.keymap.set("n", "<C-\\><C-F>", require("telescope.builtin").find_files, {})
vim.keymap.set("n", "<leader>/", require("telescope.builtin").live_grep, {})
vim.keymap.set("n", "<C-\\>s", require("telescope.builtin").grep_string, {})
vim.keymap.set("n", "<C-\\><C-B>", require("telescope.builtin").buffers, {})
vim.keymap.set("n", "<leader>fh", require("telescope.builtin").help_tags, {})
vim.keymap.set("n", "<F5>", ":NvimTreeToggle<CR>", { silent = true, noremap = true })
vim.keymap.set("n", "<leader>o", ":NvimTreeFindFileToggle<CR>", { silent = true, noremap = true })

print("Hello, Ethan!")
