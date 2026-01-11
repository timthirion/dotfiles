return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "mason.nvim",
      "mason-lspconfig.nvim",
    },
    init = function()
      -- Suppress nvim-lspconfig deprecation warning for Nvim 0.10
      local orig_deprecate = vim.deprecate
      vim.deprecate = function(name, alternative, version, plugin, backtrace)
        if plugin ~= "nvim-lspconfig" then
          orig_deprecate(name, alternative, version, plugin, backtrace)
        end
      end
    end,
    config = function()
      -- Global LSP settings
      local on_attach = function(client, bufnr)
        local opts = { buffer = bufnr, silent = true }

        -- Key mappings
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
        vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
        vim.keymap.set("n", "gI", vim.lsp.buf.implementation, opts)
        vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, opts)
        vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
        vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
        vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
        vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
        vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
        vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, opts)
        vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, opts)
      end

      -- Configure diagnostics (disabled by default)
      vim.diagnostic.config({
        virtual_text = false,
        signs = false,
        underline = false,
        update_in_insert = false,
        severity_sort = true,
        float = {
          border = "rounded",
          source = "always",
          header = "",
          prefix = "",
        },
      })

      -- LSP server configurations (only for installed tools)
      local servers = {
        lua_ls = {
          settings = {
            Lua = {
              runtime = { version = "LuaJIT" },
              diagnostics = { globals = { "vim" } },
              workspace = {
                library = vim.api.nvim_get_runtime_file("", true),
                checkThirdParty = false,
              },
              telemetry = { enable = false },
            },
          },
        },
        pyright = {},
        ts_ls = {},
        clangd = {},
        rust_analyzer = {
          settings = {
            ["rust-analyzer"] = {
              cargo = { allFeatures = true },
              checkOnSave = { command = "clippy" },
            },
          },
        },
      }

      -- Get completion capabilities from nvim-cmp
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      local has_cmp, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
      if has_cmp then
        capabilities = cmp_nvim_lsp.default_capabilities(capabilities)
      end

      -- Setup each server using lspconfig (compatible with Nvim 0.10)
      local lspconfig = require("lspconfig")
      for server, config in pairs(servers) do
        lspconfig[server].setup({
          settings = config.settings,
          on_attach = on_attach,
          capabilities = capabilities,
        })
      end
    end,
  },
}
