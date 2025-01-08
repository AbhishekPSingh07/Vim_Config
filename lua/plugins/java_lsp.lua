require("lspconfig").jdtls.setup({
  cmd = { "jdtls" },
  root_dir = require("lspconfig.util").root_pattern(".git", "mvnw", "gradlew", "pom.xml", "build.gradle"),
  settings = {
    java = {
      home = "/Library/Java/JavaVirtualMachines/jdk-21.jdk/Contents/Home",
    },
  },
  on_attach = function(client, bufnr)
    local bufopts = { noremap = true, silent = true, buffer = bufnr }
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
    vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
  end,
})
