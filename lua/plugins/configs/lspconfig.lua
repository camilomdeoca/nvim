local lspconfig = require'lspconfig'

local servers = {
    "lua_ls",
    "ts_ls",
    "clangd",
    -- "cssls",
    "glsl_analyzer",
    -- "prolog_ls",
    "html",
    "rust_analyzer",
    "pyright",
    "opencl_ls",
    "tailwindcss",
    "eslint",
    "cobol_ls",
}
-- Set up lspconfig.
local capabilities = require('cmp_nvim_lsp').default_capabilities()

for _, lsp in ipairs(servers) do
  vim.lsp.config(lsp, {
    capabilities = capabilities,
  })
end

-- vim.lsp.config("angularls", {
--   root_dir = lspconfig.util.root_pattern("angular.json", "project.json"), -- This is for monorepo's
--   filetypes = { "angular", "html", "typescript", "typescriptreact" },
--   capabilities = capabilities,
-- })


