return {
  "stevearc/conform.nvim",
  opts = {
    formatters_by_ft = {
      lua = { "stylua" },
      -- Conform can also run multiple formatters sequentially
      python = { "isort", "ruff_fix", "ruff_format" },
      -- You can use a sub-list to tell conform to run *until* a formatter
      -- is found.
      javascript = { { "prettierd", "prettier" } },
      toml = { "taplo" },
      sql = { "sqlfluff" },
      markdown = { "markdownlint-cli2" },
      sh = { "shfmt" },
      nix = { "nixpkgs_fmt" },
    },
  },
}
