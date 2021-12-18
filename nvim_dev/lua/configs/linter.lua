local M = {}

M.setup = function()
	require("utils").define_augroups({
		autolint = {
			{
				"BufWritePost",
				"<buffer>",
				":silent lua require('lint').try_lint()",
			},
			{
				"BufEnter",
				"<buffer>",
				":silent lua require('lint').try_lint()",
			},
		},
	})
end

local status_ok, linter = pcall(require, "lint")
if not status_ok then
	return
end

-- TODO: implement bihavior switchers
-- if not O.lint_on_save then
--   vim.cmd [[if exists('#autolint#BufWritePost')
-- 	:autocmd! autolint
-- 	endif]]
-- end

return M
