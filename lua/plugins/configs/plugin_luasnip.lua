require("luasnip.loaders.from_vscode").lazy_load()
require("luasnip.loaders.from_vscode").lazy_load { paths = "./snippets/angular" }

--if (vim.fn.filereadable("./"))
require("luasnip").filetype_extend("javascriptreact", { "html" })
