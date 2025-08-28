return {
    view = {
        width = 40,
        side = "right",
    },
    renderer = {
        highlight_diagnostics = "name",
        highlight_git = "name",
        indent_markers = {
            enable = true,
        },
    },
    diagnostics = {
        enable = true,
        show_on_dirs = true,
    },
    filters = {
        git_ignored = false,
        dotfiles = false,
    },
}
