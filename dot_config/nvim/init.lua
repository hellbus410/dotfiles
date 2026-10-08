vim.g.netrw_banner = 0

vim.o.number = true
vim.o.relativenumber = true
vim.o.scrolloff = 8
vim.o.sidescrolloff = 8

vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true

vim.o.list = true
vim.o.listchars = "tab:» ,trail:·,nbsp:␣"

vim.o.wrap = true
vim.o.inccommand = "split"

vim.o.splitbelow = true
vim.o.splitright = true

vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.laststatus = 3

vim.o.termguicolors = true
vim.o.signcolumn = "yes"

vim.o.undofile = true

vim.o.pumborder = "rounded"
vim.o.winborder = "rounded"

vim.o.foldlevelstart = 99

--- Plugins ---
vim.pack.add({
    "https://github.com/lewis6991/gitsigns.nvim",
    "https://github.com/tpope/vim-sleuth",
    "https://github.com/folke/which-key.nvim",
    "https://github.com/neovim/nvim-lspconfig",
    { src = "https://github.com/nvim-treesitter/nvim-treesitter", version = "main" },
    { src = "https://github.com/saghen/blink.cmp", version = vim.version.range("1") },
})

require("blink.cmp").setup({
    keymap = {
        preset = "default",
        ["<C-n>"] = { "select_next", "fallback" },
        ["<C-p>"] = { "select_prev", "fallback" },
        ["<C-k>"] = false,
    },
    cmdline = { enabled = false },
    completion = {
        documentation = {
            auto_show = true,
            window = {
                direction_priority = {
                    menu_north = { "s", "n", "e", "w" },
                    menu_south = { "n", "s", "e", "w" },
                },
            },
        },
    },
    signature = { enabled = true },
})

--- Filetypes ---
local function in_helm_chart(path)
    if vim.fs.root(path, "Chart.yaml") then
        return "helm"
    end
end

vim.filetype.add({
    extension = {
        tofu = "opentofu",
        tofuvars = "opentofu-vars",
    },
    filename = {
        ["compose.yaml"] = "yaml.docker-compose",
        ["compose.yml"] = "yaml.docker-compose",
        ["docker-compose.yaml"] = "yaml.docker-compose",
        ["docker-compose.yml"] = "yaml.docker-compose",
    },
    pattern = {
        [".*/roles/.*/tasks/.*%.ya?ml"] = "yaml.ansible",
        [".*/roles/.*/handlers/.*%.ya?ml"] = "yaml.ansible",
        [".*/playbooks/.*%.ya?ml"] = "yaml.ansible",
        [".*/templates/.*%.ya?ml"] = in_helm_chart,
        [".*/templates/.*%.tpl"] = in_helm_chart,
        [".*/values%.ya?ml"] = function(path)
            if vim.uv.fs_stat(vim.fs.joinpath(vim.fs.dirname(path), "Chart.yaml")) then
                return "yaml.helm-values"
            end
        end,
    },
})

--- Language servers ---
vim.diagnostic.config({ virtual_lines = true })

vim.lsp.enable({
    "nixd",
    "bashls",
    "ansiblels",
    "yamlls",
    "dockerls",
    "docker_compose_language_service",
    "helm_ls",
    "tofu_ls",
    "lua_ls",
    "marksman",
    "taplo",
    "jsonls",
    "systemd_lsp",
})

--- Tree-sitter ---
local parsers = {
    "bash",
    "nix",
    "yaml",
    "dockerfile",
    "helm",
    "terraform",
    "toml",
    "json",
}

local install = require("nvim-treesitter").install(parsers)
if #vim.api.nvim_list_uis() == 0 then
    install:wait(300000)
end

vim.treesitter.language.register("terraform", { "opentofu", "opentofu-vars" })

vim.api.nvim_create_autocmd("FileType", {
    group = vim.api.nvim_create_augroup("treesitter", {}),
    callback = function(args)
        local lang = vim.treesitter.language.get_lang(args.match)
        if not lang or not vim.treesitter.language.add(lang) then
            return
        end
        vim.treesitter.start(args.buf, lang)
        vim.wo[0][0].foldexpr = "v:lua.vim.treesitter.foldexpr()"
        vim.wo[0][0].foldmethod = "expr"
    end,
})
