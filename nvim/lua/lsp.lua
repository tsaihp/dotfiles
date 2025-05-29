-- 載入 nvim-lspconfig 套件
local lspconfig = require("lspconfig")
local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- 設定 clangd
lspconfig.clangd.setup({
  -- cmd = { "clangd" },  -- 可省略，預設就是 clangd
  -- filetypes = { "c", "cpp", "objc", "objcpp" },
  capabilities = capabilities,
  on_attach = function(client, bufnr)
    print("✅ clangd LSP 已啟用")
  end,
})
