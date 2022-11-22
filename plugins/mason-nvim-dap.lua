require("mason-nvim-dap").setup {
  automatic_installation = true,
  automatic_setup = true,
  ensure_installed = { "bash", "js" },
}
require("mason-nvim-dap").setup_handlers {}
