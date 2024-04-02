---@diagnostic disable: missing-fields
return {
  "neovim/nvim-lspconfig",
  ---@class PluginLspOpts
  opts = {
    ---@type lspconfig.options
    servers = {
      clangd = {},
      rust_analyzer = {},
      taplo = {},
      html = {},
      jsonls = {},
      marksman = {},
      sqlls = {},
      nil_ls = {},
    },
  },
}
