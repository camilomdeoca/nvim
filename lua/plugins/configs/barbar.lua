return {
    icons = {
        diagnostics = {
          [vim.diagnostic.severity.ERROR] = {enabled = true, icon = 'ﬀ'},
          [vim.diagnostic.severity.WARN] = {enabled = true},
          [vim.diagnostic.severity.INFO] = {enabled = true},
          [vim.diagnostic.severity.HINT] = {enabled = true},
        },
    },
    sidebar_filetypes = {
        -- Use the default values: {event = 'BufWinLeave', text = nil}
        NvimTree = {text = "NvimTree"},
        -- Or, specify both
        --Outline = {event = 'BufWinLeave', text = 'symbols-outline'},
    },
}
