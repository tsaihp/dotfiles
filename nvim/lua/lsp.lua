-- 載入 nvim-lspconfig 套件
local lspconfig = require("lspconfig")
local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- 設定 clangd
lspconfig.clangd.setup({
  cmd = { "clangd", "--compile-commands-dir=./" },
  filetypes = { "c", "cpp", "objc", "objcpp" },
  capabilities = capabilities,
  root_dir = require('lspconfig.util').root_pattern(
      'compile_commands.json', '.git'
  ),
  -- on_attach = function(client, bufnr)
  --   print("✅ clangd LSP 已啟用")
  -- end,
})
