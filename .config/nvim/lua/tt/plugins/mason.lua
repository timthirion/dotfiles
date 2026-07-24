return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup({
        ui = {
          border = "rounded",
          icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
          }
        }
      })
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "mason.nvim" },
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "lua_ls",        -- Lua
          "clangd",        -- C/C++
          "rust_analyzer", -- Rust
          -- pyright and ts_ls disabled (require npm which uses work VPN)
        },
        automatic_installation = false,
        automatic_enable = true,
      })
    end,
  },
}