return {
  "NStefan002/screenkey.nvim",
  lazy = false,
  version = "*",
  config = function()
    require("screenkey").setup({
      win_opts = {
        row = vim.o.lines - 3, -- position above statusline
        col = vim.o.columns / 2 - 15,
        relative = "editor",
        anchor = "SW",
        width = 30,
        height = 1,
        border = "rounded",
        title = "",
      },
      compress_after = 3,  -- compress repeated keys after 3
      clear_after = 3,     -- disappear after 3 seconds
      disable = {
        filetypes = { "toggleterm" },
        buftypes = { "terminal" },
      },
      show_leader = true,
      group_mappings = true,
    })

    -- Light blue background for the screenkey window
    vim.api.nvim_set_hl(0, "ScreenKey", { bg = "#5fafd7", fg = "#1c1c1c", bold = true })
    vim.api.nvim_set_hl(0, "ScreenKeyBorder", { fg = "#5fafd7" })
  end,
  keys = {
    { "<leader>sk", "<cmd>Screenkey<cr>", desc = "Toggle Screenkey" },
  },
}
