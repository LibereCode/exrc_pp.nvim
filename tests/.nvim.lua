-- vim.opt.runtimepath:append({ ".." }) ---Root of this repo
--
-- ---INFO This simulates $XDG_CONFIG_HOME/nvim/init.lua (replaces need for above)
-- local exrc_pp = require("exrc_pp")
-- exrc_pp.setup()

-- ------------

---Instead just add the _repo-root_ to runtime (otherwise, you'll get duplicated effect by {root}/.nvim.lua)

for dir in vim.fs.parents(vim.api.nvim_buf_get_name(0)) do
	local target_root = dir .. "/.git"
	if vim.fn.isdirectory(target_root) == 1 then
		print("Will add to runtime:", dir)
		vim.opt.runtimepath:append({ dir })
		break
	end
end

-- -----------

-- vim: readonly
