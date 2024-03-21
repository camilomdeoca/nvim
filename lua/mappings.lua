vim.g.mapleader = " "

-- General
--vim.keymap.set('n', '<space>w', '<cmd>write<cr>', { desc = 'Save' }) -- Space + w to save

-- Buffer movement
local bl = require("bufferline")
vim.keymap.set('n', '<S-i>', function() bl.cycle(1) end, { desc = 'Next buffer' })
vim.keymap.set('n', '<S-u>', function() bl.cycle(-1) end, { desc = 'Prev buffer' })
vim.keymap.set('n', '<S-C-i>', function() bl.move(1) end, { desc = 'Move buffer right' })
vim.keymap.set('n', '<S-C-u>', function() bl.move(-1) end, { desc = 'Move buffer left' })

vim.keymap.set('', '<Home>', function()
    local first_nonblank = vim.fn.match(vim.fn.getline('.'), '\\S') + 1
    if first_nonblank == 0 then
        return vim.fn.col('.')
    end
    if vim.fn.col('.') == first_nonblank then
        return '0'
    end
    if vim.opt.wrap and vim.fn.wincol() > 1 then
        return 'g^'
    else
        return '^'
    end
end, { desc = 'Smart Home', expr = true, silent = true, noremap = true }) -- Smart Home

function smart_home_insert_macro()
    local key = vim.api.nvim_replace_termcodes("<C-o><Home>", true, false, true)
    vim.api.nvim_feedkeys(key, 'i', true) 
end

vim.keymap.set('i', '<Home>', smart_home_insert_macro, { desc = "Smart Home for Insert mode", silent = true, noremap = true })

-- bufferline
vim.keymap.set('n', '<leader>q', '<cmd> bdelete <cr>', { desc = "Close current buffer" })

-- Nvim Tree
local nvim_tree_api = require "nvim-tree.api"
vim.keymap.set("n", "<space><tab>", nvim_tree_api.tree.toggle, { desc = "Toggle Nvim Tree file explorer" })


-- Telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = "Find files" })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = "Live grep" })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = "Find in buffers" })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = "Find in help tags" })
vim.keymap.set('n', '<leader>fd', builtin.diagnostics, { desc = "Find in diagnostics" })
vim.keymap.set('n', '<leader>fr', builtin.lsp_references, { desc = "Find in references to symbol under cursor" })

-- lspconfig
vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('UserLspConfig', {}),
    callback = function(ev)
        -- Enable completion triggered by <c-x><c-o>
        vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

        -- Buffer local mappings.
        -- See `:help vim.lsp.*` for documentation on any of the below functions
        local opts = { buffer = ev.buf }
        vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
        --vim.keymap.set('n', 'gD', "<cmd> tab split | lua vim.lsp.buf.declaration() <CR>", opts)
        --vim.keymap.set('n', 'gd', "<cmd> tab split | lua vim.lsp.buf.definition() <CR>", opts)
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
        vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
        vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
        vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, { buffer = ev.buf, desc = "Code action" })
        vim.keymap.set('n', '<leader>cf', vim.lsp.buf.format, { buffer = ev.buf, desc = "Format" })
        vim.keymap.set('n', '<F2>', vim.lsp.buf.rename, opts)
        --vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
        --vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
        --vim.keymap.set('n', '<space>wl', function()
        --    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
        --end, opts)
        vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
        vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
        vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
        vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
        vim.keymap.set('n', '<space><S-f>', function()
            vim.lsp.buf.format { async = true }
        end, opts)
    end,
})
