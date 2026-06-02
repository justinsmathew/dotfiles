-- Leader (must be before plugins)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Plugins
vim.pack.add({
  { src = "https://github.com/ibhagwan/fzf-lua" },
  { src = "https://github.com/folke/tokyonight.nvim" },
  { src = "https://github.com/folke/which-key.nvim" },
  { src = "https://github.com/nvim-treesitter/nvim-treesitter" },
  { src = "https://github.com/lewis6991/gitsigns.nvim" },
  { src = "https://github.com/mason-org/mason.nvim" },
  { src = "https://github.com/echasnovski/mini.surround" },
  { src = "https://github.com/echasnovski/mini.pairs" },
})

-- Colorscheme
vim.cmd.colorscheme("tokyonight-night")

-- Treesitter (new API — highlight is native in 0.12, this manages parsers)
require("nvim-treesitter").setup()

vim.api.nvim_create_autocmd("FileType", {
  callback = function(ev)
    local lang = vim.treesitter.language.get_lang(ev.match)
    if lang and vim.treesitter.language.add(lang, { silent = true }) then
      vim.treesitter.start()
    end
  end,
})

-- Gitsigns
require("gitsigns").setup({
  signs = {
    add          = { text = "▎" },
    change       = { text = "▎" },
    delete       = { text = "" },
    topdelete    = { text = "" },
    changedelete = { text = "▎" },
  },
})

-- Mason
-- On first use run: :MasonInstall lua-language-server zls
require("mason").setup()

-- LSP (native vim.lsp API — no lspconfig needed)
vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(ev)
    local map = function(lhs, rhs, desc)
      vim.keymap.set("n", lhs, rhs, { buffer = ev.buf, silent = true, desc = desc })
    end
    map("gd",         vim.lsp.buf.definition,     "Go to definition")
    map("gD",         vim.lsp.buf.declaration,    "Go to declaration")
    map("gr",         vim.lsp.buf.references,     "References")
    map("K",          vim.lsp.buf.hover,          "Hover docs")
    map("<leader>rn", vim.lsp.buf.rename,         "Rename")
    map("<leader>ca", vim.lsp.buf.code_action,    "Code action")
    map("<leader>ld", vim.diagnostic.open_float,  "Line diagnostics")
    map("<leader>lf", function() vim.lsp.buf.format({ async = true }) end, "Format buffer")
    map("<leader>li", "<cmd>checkhealth lsp<cr>", "LSP info")
    map("<leader>lr", function()
      vim.lsp.stop_client(vim.lsp.get_clients({ bufnr = ev.buf }))
      vim.cmd("edit")
    end, "LSP restart")
    map("[d",         vim.diagnostic.goto_prev,   "Prev diagnostic")
    map("]d",         vim.diagnostic.goto_next,   "Next diagnostic")
  end,
})

vim.lsp.config("lua_ls", {
  cmd = { "lua-language-server" },
  filetypes = { "lua" },
  root_markers = { ".luarc.json", ".luarc.jsonc", ".git" },
  settings = {
    Lua = {
      runtime = { version = "LuaJIT" },
      workspace = {
        checkThirdParty = false,
        library = vim.api.nvim_get_runtime_file("", true),
      },
      diagnostics = { globals = { "vim" } },
      telemetry = { enable = false },
    },
  },
})
vim.lsp.enable("lua_ls")

vim.lsp.config("zls", {
  cmd = { "zls" },
  filetypes = { "zig", "zir" },
  root_markers = { "build.zig", "build.zig.zon", ".git" },
})
vim.lsp.enable("zls")

-- fzf-lua
require("fzf-lua").setup({
  winopts = { backdrop = 85 },
  keymap = {
    builtin = {
      ["<C-f>"] = "preview-page-down",
      ["<C-b>"] = "preview-page-up",
      ["<C-p>"] = "toggle-preview",
    },
  },
})

-- mini.surround
require("mini.surround").setup()

-- mini.pairs
require("mini.pairs").setup()

-- which-key
require("which-key").setup()
require("which-key").add({
  { "<leader>f",  group = "find" },
  { "<leader>g",  group = "git" },
  { "<leader>l",  group = "lsp" },
  { "<leader>x",  group = "diagnostics" },
  { "<leader>s",  group = "splits" },
  { "<leader>b",  group = "buffers" },
})

-- Options
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.signcolumn = "yes"
vim.opt.cursorline = true

vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.smartindent = true

vim.opt.wrap = false
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8

vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.splitright = true
vim.opt.splitbelow = true

vim.opt.termguicolors = true
vim.opt.updatetime = 250
vim.opt.timeoutlen = 300
vim.opt.clipboard = "unnamedplus"
vim.opt.undofile = true

-- Keymaps
local map = function(mode, lhs, rhs, desc)
  vim.keymap.set(mode, lhs, rhs, { silent = true, desc = desc })
end

-- General
map("n", "<leader>w", "<cmd>w<cr>",  "Save")
map("n", "<leader>q", "<cmd>q<cr>",  "Quit")
map("n", "<leader>e", "<cmd>Ex<cr>", "Explorer")
map("n", "<leader>m", "<cmd>Mason<cr>", "Mason")

-- Window navigation
map("n", "<C-h>", "<C-w>h", "Move left")
map("n", "<C-j>", "<C-w>j", "Move down")
map("n", "<C-k>", "<C-w>k", "Move up")
map("n", "<C-l>", "<C-w>l", "Move right")

-- Splits
map("n", "<leader>sv", "<cmd>vsplit<cr>", "Split vertical")
map("n", "<leader>sh", "<cmd>split<cr>",  "Split horizontal")
map("n", "<leader>se", "<C-w>=",          "Equalize splits")
map("n", "<leader>sx", "<cmd>close<cr>",  "Close split")

-- Buffers
map("n", "<leader>bn", "<cmd>bnext<cr>",     "Next buffer")
map("n", "<leader>bp", "<cmd>bprevious<cr>", "Prev buffer")
map("n", "<leader>bd", "<cmd>bdelete<cr>",   "Delete buffer")

-- Move lines
map("v", "J", ":m '>+1<cr>gv=gv", "Move line down")
map("v", "K", ":m '<-2<cr>gv=gv", "Move line up")

-- Navigation
map("n", "J", "mzJ`z", "Join line keep cursor")
map("n", "<C-d>", "<C-d>zz", "Scroll down centered")
map("n", "<C-u>", "<C-u>zz", "Scroll up centered")
map("n", "n", "nzzzv", "Next search centered")
map("n", "N", "Nzzzv", "Prev search centered")

-- Yank / paste
map("x", "<leader>p", [["_dP]], "Paste without yank")
map({ "n", "v" }, "<leader>d", [["_d]], "Delete without yank")

-- Find (fzf-lua)
map("n", "<leader>ff", "<cmd>FzfLua files<cr>",       "Find files")
map("n", "<leader>fg", "<cmd>FzfLua live_grep<cr>",   "Live grep")
map("n", "<leader>fb", "<cmd>FzfLua buffers<cr>",     "Buffers")
map("n", "<leader>fr", "<cmd>FzfLua oldfiles<cr>",    "Recent files")
map("n", "<leader>/",  "<cmd>FzfLua grep_curbuf<cr>", "Search current buffer")

-- Diagnostics
map("n", "<leader>xx", "<cmd>FzfLua diagnostics_workspace<cr>", "Workspace diagnostics")
map("n", "<leader>xd", "<cmd>FzfLua diagnostics_document<cr>",  "Document diagnostics")

-- Git (gitsigns)
map("n", "<leader>gs", "<cmd>Gitsigns stage_hunk<cr>",   "Stage hunk")
map("n", "<leader>gr", "<cmd>Gitsigns reset_hunk<cr>",   "Reset hunk")
map("n", "<leader>gp", "<cmd>Gitsigns preview_hunk<cr>", "Preview hunk")
map("n", "<leader>gb", "<cmd>Gitsigns blame_line<cr>",   "Blame line")
map("n", "]h", "<cmd>Gitsigns next_hunk<cr>", "Next hunk")
map("n", "[h", "<cmd>Gitsigns prev_hunk<cr>", "Prev hunk")
