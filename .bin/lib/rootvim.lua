-- Make sure the config directory is in the runtimepath
local config_dir = "/home/sonny/.config/nvim"
vim.opt.runtimepath:append(config_dir)
package.path = config_dir .. "/?.lua;" .. package.path
require("init")
