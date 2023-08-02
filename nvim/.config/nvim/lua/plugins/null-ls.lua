local null_ls = require('null-ls')

null_ls.setup({
  sources = {
    null_ls.builtins.diagnostics.flake8.with({
      disabled_filetypes = { "embedded_template" }
    }),
    null_ls.builtins.formatting.autoflake,
    null_ls.builtins.formatting.autopep8,
    null_ls.builtins.formatting.shellharden,
  }
})
