require("formatter").setup {
  filetype = {
    python = {
      require("formatter.filetypes.python").black,
      require("formatter.filetypes.python").isort,
    },
    rust = {
      require("formatter.filetypes.rust").rustfmt,
    },
    ["*"] = {
      require("formatter.filetypes.any").remove_trailing_whitespace
    }
  }
}
vim.keymap.set("n", "<leader>cf", ":Format<CR>")
