-- Set leader keys (must come before plugins and keymaps)
vim.g.mapleader = " "          -- Leader is <Space>
vim.g.maplocalleader = "\\"    -- Local leader is \

-- Editor options
vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.cmd("set number")
vim.bo.modifiable = true

-- Load plugin configuration
require("config.lazy")

