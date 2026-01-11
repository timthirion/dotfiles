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
        -- Only install language servers for tools you have installed
        ensure_installed = {
          "lua_ls",        -- Lua (always available in Neovim)
          "pyright",       -- Python (you have Python via pyenv)
          "ts_ls",         -- TypeScript/JavaScript (you have Node.js)
          "clangd",        -- C/C++ (system compiler available)
          "rust_analyzer", -- Rust
        },
        automatic_installation = false, -- Don't auto-install to avoid errors
        automatic_enable = false, -- Disable for Nvim 0.10 compatibility (uses vim.lsp.enable which requires 0.11+)
      })
    end,
  },
}