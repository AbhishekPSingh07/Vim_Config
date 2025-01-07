return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        gopls = {
          cmd = { "gopls" }, -- Ensure "gopls" is in your PATH or provide the full path
          root_dir = require("lspconfig.util").root_pattern("go.mod", ".git"),
          settings = {
            gopls = {
              analyses = {
                unusedparams = true, -- Enable analysis for unused parameters
              },
              staticcheck = true, -- Enable static analysis
            },
          },
          on_attach = function(client, bufnr)
            -- Configure keybindings and other LSP features for Go
            local opts = { buffer = bufnr }
            vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
            vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
            vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
            vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
            vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
            vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
          end,
        },
      },
    },
  },
}
