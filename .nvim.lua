---NOTE: ../nuv.nvim has a better
---"plugin.nvim development w NIX" method

vim.opt.runtimepath:append({ "." }) ---Root of this repo

---INFO This simulates $XDG_CONFIG_HOME/nvim/init.lua (replaces need for above)
local exrc_pp = require("exrc_pp")
exrc_pp.setup()

-- vim: readonly
