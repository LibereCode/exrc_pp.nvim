for dir in vim.fs.parents(vim.api.nvim_buf_get_name(0)) do
	print(dir)
	---INFO Adds this repo (ie the plugin-api) and ./.nvim to runtimepath
	local target_root = dir .. "/.git"
	if vim.fn.isdirectory(target_root) == 1 then
		print("break! found:", target_root)
		vim.opt.runtimepath:append({ dir }) ---This repo

		-- vim.opt.runtimepath:append({ ".nvim" }) ---./.nvim
		---INFO See <../.nvim/plugin/init.lua> (simulates user-config `nvim/init.lua`)
		---which replaces the need for above (and is what should be put in user-config):

		break
	end
end

-- vim: readonly
