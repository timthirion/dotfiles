return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },
    config = function()
      local has_treesitter, treesitter_configs = pcall(require, "nvim-treesitter.configs")
      if not has_treesitter then
        return
      end
      
      treesitter_configs.setup({
        -- Install parsers for languages you use
        ensure_installed = {
          "lua",         -- Neovim config
          "vim",         -- Vim config
          "vimdoc",      -- Vim documentation
          "python",      -- Python
          "javascript",  -- JavaScript
          "typescript",  -- TypeScript
          "tsx",         -- TypeScript React
          "json",        -- JSON
          "html",        -- HTML
          "css",         -- CSS
          "rust",        -- Rust
          "c",           -- C
          "cpp",         -- C++
          "bash",        -- Shell scripts
          "fish",        -- Fish shell
          "markdown",    -- Markdown
          "yaml",        -- YAML
          "toml",        -- TOML
        },
        
        -- Install parsers synchronously (only applied to `ensure_installed`)
        sync_install = false,
        
        -- Automatically install missing parsers when entering buffer
        auto_install = true,
        
        highlight = {
          enable = true,
          -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
          -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
          -- Using this option may slow down your editor, and you may see some duplicate highlights.
          -- Instead of true it can also be a list of languages
          additional_vim_regex_highlighting = false,
        },
        
        indent = {
          enable = true,
        },
        
        -- Enable incremental selection
        incremental_selection = {
          enable = true,
          keymaps = {
            init_selection = "<C-space>",
            node_incremental = "<C-space>",
            scope_incremental = "<C-s>",
            node_decremental = "<C-backspace>",
          },
        },
      })
    end,
  },
}