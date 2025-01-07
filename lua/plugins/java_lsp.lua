return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        jdtls = {
          cmd = {
            "jdtls", -- Ensure this points to the correct jdtls binary if it's not globally available
          },
          root_dir = require("lspconfig.util").root_pattern(".git", "mvnw", "gradlew", "pom.xml", "build.gradle"),
          settings = {
            java = {
              home = "/Library/Java/JavaVirtualMachines/jdk-20.jdk/Contents/Home", -- Optional: Specify your Java home if needed
            },
          },
          on_attach = function(client, bufnr)
            -- Keybindings and other LSP features can be configured here
            local opts = { buffer = bufnr }
            vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
            vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
          end,
        },
      },
    },
  },
}
