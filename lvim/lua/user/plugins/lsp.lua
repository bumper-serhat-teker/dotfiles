-- LSP settings

-- Show line diagnostics only for line during CursorHold
-- https://github.com/LunarVim/LunarVim/issues/1712
lvim.lsp.diagnostics.virtual_text = false
vim.api.nvim_create_autocmd("CursorHold", {
    pattern = "*",
    command = "lua vim.diagnostic.open_float(0,{scope='line'})",
})

-- Mappings
lvim.lsp.buffer_mappings.normal_mode["<leader>rn"] = { vim.lsp.buf.rename, "Rename" }

-- Null-ls

-- Format files on save
-- lvim.format_on_save = false
lvim.format_on_save = {
    pattern = {
        -- "*.go",
        "*.js",
        "*.jsx",
        "*.lua",
        "*.sh",
        "*.vim",
        "*.tf",
    },
}

-- set a formatter, this will override the language server formatting capabilities (if it exists)

local formatters = require "lvim.lsp.null-ls.formatters"
-- default linelength
local line_length = "99"

formatters.setup {
    { command = "isort", filetypes = { "python" } },
    {
        command = "black",
        filetypes = { "python" },
        extra_args = { "--line-length", line_length },
    },
    {
        -- each formatter accepts a list of options identical to
        -- https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#Configuration
        command = "prettier",
        ---@usage arguments to pass to the formatter these cannot contain
        --whitespaces, options such as `--line-width 80` become either
        --`{'--line-width', '80'}` or `{'--line-width=80'}` extra_args = {
        --"--print-with", "100" }, -@usage specify which filetypes to enable.
        --By default a providers will attach to all the filetypes it supports.
        filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
    },
    -- { command = "gofmt", filetypes = { "go" } },
    { command = "shfmt", filetypes = { "sh" } },
    { command = "fmt", filetypes = { "terraform" } },
}

-- Additional linters
local linters = require "lvim.lsp.null-ls.linters"
linters.setup {
    {
        command = "flake8",
        filetypes = { "python" },
        extra_args = { "--max-line-length", line_length },
    },
    {
        -- each linter accepts a list of options identical to
        -- https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#Configuration
        command = "shellcheck",
        ---@usage arguments to pass to the formatter these cannot contain
        --whitespaces, options such as `--line-width 80` become either
        --`{'--line-width', '80'}` or `{'--line-width=80'}`
        extra_args = { "--severity", "warning", "--line-width", line_length },
    },
    {
        command = "codespell",
        ---@usage specify which filetypes to enable. By default a providers
        --will attach to all the filetypes it supports.
        filetypes = { "javascript", "python" },
    },
}
