vim.g.mapleader = " "

-- General
vim.keymap.set('n', '<space>w', '<cmd>write<cr>', { desc = 'Save' }) -- Space + w to save

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

local function smart_home_insert_macro()
    local key = vim.api.nvim_replace_termcodes("<C-o><Home>", true, false, true)
    vim.api.nvim_feedkeys(key, 'i', true)
end

vim.keymap.set('i', '<Home>', smart_home_insert_macro, { desc = "Smart Home for Insert mode", silent = true, noremap = true })

-- bufferline
vim.keymap.set('n', '<leader>q', '<cmd> bdelete <cr>', { desc = "Close current buffer" })

-- Nvim Tree
local nvim_tree_api = require "nvim-tree.api"
vim.keymap.set("n", "<leader><tab>", nvim_tree_api.tree.toggle, { desc = "Toggle Nvim Tree file explorer" })


-- Telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = "Find files" })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = "Live grep" })
vim.keymap.set('n', '<leader>fb', function() builtin.buffers({sort_mru = true, ignore_current_buffer = true}) end, { desc = "Find in buffers" })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = "Find in help tags" })
vim.keymap.set('n', '<leader>fd', builtin.diagnostics, { desc = "Find in diagnostics" })
vim.keymap.set('n', '<leader>fr', builtin.lsp_references, { desc = "Find in references to symbol under cursor" })
vim.keymap.set('n', 'gd', builtin.lsp_definitions, { desc = "Go to definition" })

local function smart_hover(opts)
    local status = require("dap").status()
    if status == "" then
        vim.lsp.buf.hover(opts)
    else
        require("dapui").eval()
    end
end

-- lspconfig
vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('UserLspConfig', {}),
    callback = function(ev)
        local function opts(desc)
            return { buffer = ev.buf, desc = "LSP " .. desc }
        end
        -- Enable completion triggered by <c-x><c-o>
        vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

        -- Buffer local mappings.
        -- See `:help vim.lsp.*` for documentation on any of the below functions
        vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts "Go to declaration")
        vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts "Go to implementation")
        vim.keymap.set('n', 'K', smart_hover, opts "Hover")
        vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts "Signature help")
        vim.keymap.set({'n', 'v'}, '<leader>ca', vim.lsp.buf.code_action, opts "Code action")
        vim.keymap.set({'n', 'v'}, '<leader>cf', vim.lsp.buf.format, opts "Code Format")
        vim.keymap.set('n', '<leader>cr', vim.lsp.buf.rename, opts "Code rename")
    end,
})

-- dap
local dap = require("dap")
local dapui = require("dapui")
local function opts(desc)
    return { desc = "DAP " .. desc }
end
vim.keymap.set('n', '<F5>', function() dap.continue() end, opts "Continue")
vim.keymap.set('n', '<F10>', function() dap.step_over() end, opts "Step over")
vim.keymap.set('n', '<F11>', function() dap.step_into() end, opts "Step into")
vim.keymap.set('n', '<F12>', function() dap.step_out() end, opts "Step out")
vim.keymap.set('n', '<leader>db', function() dap.toggle_breakpoint() end, opts "Toggle breakpoint")
vim.keymap.set('n', '<leader>dt', function() dapui.toggle() end, opts "Toggle UI")
vim.keymap.set('n', '<leader>ds', function() dapui.float_element("stacks", { enter = true }) end, opts "Open stack")
