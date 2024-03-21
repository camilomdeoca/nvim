local lspconfig = require'lspconfig'

local servers = { "lua_ls", "tsserver", "clangd", "cssls", "glsl_analyzer"}
-- Set up lspconfig.
local capabilities = require('cmp_nvim_lsp').default_capabilities()

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    capabilities = capabilities,
  }
end

lspconfig.angularls.setup {
  root_dir = lspconfig.util.root_pattern("angular.json", "project.json"), -- This is for monorepo's
  filetypes = { "angular", "html", "typescript", "typescriptreact" },
  capabilities = capabilities,
}


