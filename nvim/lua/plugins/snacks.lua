return {
	"folke/snacks.nvim",
	opts = {
		bigfile = { enabled = true },
		notifier = {
			enabled = true,
			timeout = 3000,
		},
		picker = { enabled = true },
		quickfile = { enabled = true },
		styles = {
			notification = {
				-- wo = { wrap = true } -- Wrap notifications
			},
		},
		indent = { enabled = true },
		input = { enabled = true },
		scope = { enabled = true },
		scroll = { enabled = true },
		statuscolumn = { enabled = false }, -- we set this in options.lua
		words = { enabled = true },
		explorer = { enabled = false },
		dashboard = {
			preset = {
				pick = function(cmd, opts)
					return require("lazyvim.util").pick(cmd, opts)()
				end,
				header = [[
        ██╗      █████╗ ███████╗██╗   ██╗██╗   ██╗██╗███╗   ███╗          Z
        ██║     ██╔══██╗╚══███╔╝╚██╗ ██╔╝██║   ██║██║████╗ ████║      Z    
        ██║     ███████║  ███╔╝  ╚████╔╝ ██║   ██║██║██╔████╔██║   z       
        ██║     ██╔══██║ ███╔╝    ╚██╔╝  ╚██╗ ██╔╝██║██║╚██╔╝██║ z         
        ███████╗██║  ██║███████╗   ██║    ╚████╔╝ ██║██║ ╚═╝ ██║           
        ╚══════╝╚═╝  ╚═╝╚══════╝   ╚═╝     ╚═══╝  ╚═╝╚═╝     ╚═╝           
        ]],
        -- stylua: ignore
        ---@type snacks.dashboard.Item[]
        keys = {
          { icon = " ", key = "f", desc = "Find File", action = ":lua Snacks.dashboard.pick('files')" },
          { icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
          { icon = " ", key = "g", desc = "Find Text", action = ":lua Snacks.dashboard.pick('live_grep')" },
          { icon = " ", key = "r", desc = "Recent Files", action = ":lua Snacks.dashboard.pick('oldfiles')" },
          { icon = " ", key = "c", desc = "Config", action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})" },
          { icon = " ", key = "s", desc = "Restore Session", section = "session" },
          { icon = " ", key = "x", desc = "Lazy Extras", action = ":LazyExtras" },
          { icon = "󰒲 ", key = "l", desc = "Lazy", action = ":Lazy" },
          { icon = " ", key = "q", desc = "Quit", action = ":qa" },
        },
			},
		},
	},

	config = function(_, opts)
		local Snacks = require("snacks")
		Snacks.setup(opts)

		-- Optional: define keymap for toggling modules
		vim.keymap.set("n", "<leader>ut", function()
			require("snacks.toggle").ui()
		end, { desc = "Toggle Snacks UI" })

		-- Keymap: Notification History
		vim.keymap.set("n", "<leader>n", function()
			if Snacks.config.picker and Snacks.config.picker.enabled then
				Snacks.picker.notifications()
			else
				Snacks.notifier.show_history()
			end
		end, { desc = "Notification History" })

		-- Keymap: Dismiss All Notifications
		vim.keymap.set("n", "<leader>un", function()
			Snacks.notifier.hide()
		end, { desc = "Dismiss All Notifications" })
	end,
}
