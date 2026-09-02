local M = {}
M._log = { iterating = {}, setup_ran = false, times_setup_ran = 0 }
M.state = { setup_ran = false }

-- =============================================================================

---@class exrc_pp.Setup.opts TODO
---@field TODO any

---TODO
---@param opts? exrc_pp.Setup.opts Cool opts idk. See help or something? TODO
function M.setup(opts)
	if not M.state.setup_ran then
		M._log.setup_ran = true
		for dir in vim.fs.parents(vim.api.nvim_buf_get_name(0)) do
			table.insert(M._log.iterating, dir)
			local target_nvim = dir .. "/.nvim"
			local stat, _, _ = vim.uv.fs_stat(target_nvim)
			if stat and stat.type == "directory" then
				if vim.secure.read(target_nvim) then
					table.insert(M._log, "Added to runtime: " .. target_nvim)
					vim.opt.runtimepath:append({ target_nvim })
				end
			end

			local target_root = dir .. "/.git"
			if vim.fn.isdirectory(target_root) == 1 then
				table.insert(M._log, "break! found: " .. target_root)
				vim.opt.runtimepath:append({ dir })
				break
			end
		end
		M.state.setup_ran = true
	end
	M._log.times_setup_ran = M._log.times_setup_ran + 1
end

---NOTE test
-- vim.uv.fs_stat("./lua", function(err, stat)
-- 	assert(not err, err)
-- 	vim.print(assert(stat).type)
-- end)

-- =============================================================================

---TEST
M._test_works_btw = true

return M
