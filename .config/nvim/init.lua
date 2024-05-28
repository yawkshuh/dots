-- Package Manager --
local basepath = vim.fn.stdpath("data") .. "/git-plugins/"

local function add_packages(packages)
    for key, repo in pairs(packages) do
        local plugin = vim.split(repo, "/")[2]

        if not (vim.uv or vim.loop).fs_stat(basepath .. plugin) then
            print("Cloning package: " .. plugin)

            vim.fn.system({
                "git",
                "clone",
                "--depth=1",
                "https://github.com/" .. repo,
                basepath .. plugin
            })
        end
    end
end

vim.opt.rtp:prepend(basepath .. "/*")

-- Plugins --
add_packages({
    "ellisonleao/gruvbox.nvim",
    "lewis6991/gitsigns.nvim",
    "nvim-tree/nvim-tree.lua",
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim",
    "tpope/vim-fugitive",

    "neovim/nvim-lspconfig",
    "hrsh7th/nvim-cmp",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-buffer",
})

require('gruvbox').setup({
    overrides = {
        SignColumn = { link = "Normal" },
        GruvboxGreenSign = { bg = "" },
        GruvboxOrangeSign = { bg = "" },
        GruvboxPurpleSign = { bg = "" },
        GruvboxYellowSign = { bg = "" },
        GruvboxRedSign = { bg = "" },
        GruvboxBlueSign = { bg = "" },
        GruvboxAquaSign = { bg = "" },
    },
})
require("lualine").setup()
require("gitsigns").setup()
require("nvim-tree").setup({ view = { side = "right" } })
require("telescope").setup()

-- Config --
local api = vim.api
local o   = vim.opt

vim.g.mapleader = ' '

o.number = true
o.cursorline = true

o.scrolloff = 10

o.tabstop = 4
o.shiftwidth = 4
o.expandtab = true

o.signcolumn = "yes"

-- Disable arrow keys
vim.keymap.set('n', '<Up>', '<nop>', { noremap = true })
vim.keymap.set('n', '<Down>', '<nop>', { noremap = true })
vim.keymap.set('n', '<Right>', '<nop>', { noremap = true })
vim.keymap.set('n', '<Left>', '<nop>', { noremap = true })

o.background = "dark"
vim.cmd([[colorscheme gruvbox]])

-- lsp config --
local lspconfig = require("lspconfig")
local capabilities = require("cmp_nvim_lsp").default_capabilities()

lspconfig.gopls.setup({
    capabilities = capabilities,
})

lspconfig.omnisharp.setup({
    cmd = { "/home/riccardo/Downloads/omnisharp-linux-x64-net6.0/OmniSharp" },
    settings = {
        FormattingOptions = {
            EnableEditorConfigSupport = true,
            OrganizeImports = nil,
        },
        MsBuild = {
            LoadProjectsOnDemand = nil,
        },
        RoslynExtensionsOptions = {
            EnableAnalyzersSupport = nil,
            EnableImportCompletion = nil,
            AnalyzeOpenDocumentsOnly = nil,
        },
        Sdk = {
            IncludePrereleases = true,
        },
    },
})

vim.opt.completeopt = { "menu", "menuone", "noselect" }

local cmp = require("cmp")
cmp.setup({
    snippet = {
        expand = function(args)
            vim.snippet.expand(args.body)
        end
    },
    window = {
        documentation = cmp.config.window.bordered()
    },
    mapping = cmp.mapping.preset.insert({
        ["<Tab>"]     = cmp.mapping.select_next_item(),
        ["<S-Tab>"]   = cmp.mapping.select_prev_item(),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<C-e>"]     = cmp.mapping.abort(),
        ["<CR>"]      = cmp.mapping.confirm({ select = true }),
    }),
    sources = cmp.config.sources({
        { name = "path" },
        { name = "nvim_lsp", keyword_length = 1 },
        { name = "buffer", keyword_length = 3 },
    }, {
        { name = "buffer" },
    })
})

vim.api.nvim_create_autocmd("LspAttach", {
    desc = "LSP Actions",
    callback = function()
        local bufmap = function(mode, lhs, rhs)
            local opts = { buffer = true }
            vim.keymap.set(mode, lhs, rhs, opts)
        end

        bufmap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>")
        bufmap("n", "gf", "<cmd>lua vim.lsp.buf.references()<cr>")
        bufmap("n", "gr", "<cmd>lua vim.lsp.buf.rename()<cr>")
    end
})

-- Telescope Config --
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers,    {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep,  {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags,  {})

-- Nvim Tree Config --
vim.keymap.set('n', '<leader>n', ':NvimTreeOpen<cr>', {})
vim.keymap.set('n', '<leader>N', ':NvimTreeToggle<cr>', {})
