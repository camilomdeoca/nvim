local plugins = {
    {
        "nvim-lualine/lualine.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        opts = function ()
            require("plugins.configs.lualine")
        end,
        config = function (_, opts)
            require("lualine").setup(opts)
        end,
    },
    {
        "williamboman/mason.nvim",
        dependencies = { "williamboman/mason-lspconfig.nvim" },
        cmd = { "Mason", "MasonInstall", "MasonUpdate" },
        opts = function ()
            return require("plugins.configs.mason")
        end,
        config = function (_, opts)
            require("mason").setup(opts)
            require("mason-lspconfig").setup()
        end,
    },
    {
        "neovim/nvim-lspconfig",
        dependencies = { "williamboman/mason.nvim" },
        config = function()
            require("plugins.configs.lspconfig")
        end,
    },
    {
        "lukas-reineke/indent-blankline.nvim",
        opts = function ()
            return require("plugins.configs.ibl")
        end,
        config = function (_, opts)
            require("ibl").setup(opts)
        end,
        main = "ibl",
    },
    {
        "nvim-treesitter/nvim-treesitter",
        dependencies = {},
        opts = function ()
            return require("plugins.configs.treesitter")
        end,
        config = function (_, opts)
            require("nvim-treesitter.configs").setup(opts)
        end,
    },
    {
        "HiPhish/rainbow-delimiters.nvim",
        opts = function ()
            return require("plugins.configs.rainbowdelimiters")
        end,
        config = function (_, opts)
            --require("rainbow-delimiters.setup").setup(opts)
            vim.g.rainbow_delimiters = opts
        end,
    },
    {
        "RRethy/vim-illuminate",
        opts = {},
        config = function (_, opts)
            require("illuminate").configure(opts)
        end
    },
    --{
    --    "romgrk/barbar.nvim",
    --    dependencies = {
    --      'lewis6991/gitsigns.nvim', -- OPTIONAL: for git status
    --      'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
    --    },
    --    opts = function ()
    --        return require("plugins.configs.barbar")
    --    end,
    --    init = function() vim.g.barbar_auto_setup = false end,
    --},
    {
        "akinsho/bufferline.nvim",
        dependencies = "nvim-tree/nvim-web-devicons",
        opts = function ()
            return require("plugins.configs.bufferline")
        end,
        config = function (_, opts)
            require("bufferline").setup(opts)
        end,
    },
    {
        "norcalli/nvim-colorizer.lua",
        config = function ()
            require("colorizer").setup()
        end
    },
    {
        "lewis6991/gitsigns.nvim",
        opts = function ()
            return require("plugins.configs.gitsigns")
        end,
        config = function (_, opts)
            require("gitsigns").setup(opts)
        end,
    },
    {
        'nvim-telescope/telescope.nvim', branch = '0.1.x',
        dependencies = { 'nvim-lua/plenary.nvim' },
        opts = function ()
            return require("plugins.configs.telescope")
        end,
        config = function (_, opts)
            require("telescope").setup(opts)
        end,
        init = function ()
            require("telescope").load_extension("ui-select")
        end
    },
    {
        -- snippet plugin
        "L3MON4D3/LuaSnip",
        dependencies = { "rafamadriz/friendly-snippets" },
        config = function(_, opts)
            require("plugins.configs.luasnip")
        end,
    },
    { "nvim-telescope/telescope-ui-select.nvim" },
    {
        "hrsh7th/nvim-cmp",
        event = "InsertEnter",
        dependencies = {
            { "L3MON4D3/LuaSnip" },

            -- autopairing of (){}[] etc
            {
                "windwp/nvim-autopairs",
                opts = {},
                config = function(_, opts)
                    require("nvim-autopairs").setup(opts)

                    -- setup cmp for autopairs
                    local cmp_autopairs = require "nvim-autopairs.completion.cmp"
                    require("cmp").event:on("confirm_done", cmp_autopairs.on_confirm_done())
                end,
            },

            -- cmp sources plugins
            {
                "saadparwaiz1/cmp_luasnip",
                "hrsh7th/cmp-nvim-lua",
                "hrsh7th/cmp-nvim-lsp",
                "hrsh7th/cmp-buffer",
                "hrsh7th/cmp-path",
            },
        },
        opts = function()
            return require("plugins.configs.cmp")
        end,
        config = function(_, opts)
            require("cmp").setup(opts)
        end,
    },
    {
        "nvim-tree/nvim-tree.lua",
        cmd = { "NvimTreeToggle", "NvimTreeFocus" },
        opts = function ()
            return require("plugins.configs.nvimtree")
        end,
        config = function (_, opts)
            require("nvim-tree").setup(opts)
        end
    },
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        init = function ()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
        end,
        cmd = "WhichKey",
        opts = {}
    },
    { "Mofiqul/vscode.nvim", priority = 100, config = function () require "colorscheme" end },
    { "kepano/flexoki-neovim" },
    { "rebelot/kanagawa.nvim" },
}

require("lazy").setup(plugins)
