return {
  "pocco81/auto-save.nvim",
  event = "InsertLeave", -- or "BufWritePre" / "VeryLazy" / any Lazy-compatible event
  config = function()
    require("auto-save").setup {
      -- Optional config overrides here
      enabled = true,
      execution_message = {
        message = function() return "AutoSave: saved at " .. vim.fn.strftime("%H:%M:%S") end,
        dim = 0.18,
        cleaning_interval = 1250,
      },
      debounce_delay = 135,
      -- Add more options as needed (see GitHub README for full list)
    }
  end,
}

