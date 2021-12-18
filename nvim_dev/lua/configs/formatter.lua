local M = {}

M.setup = function()
	require("utils").define_augroups({
		autoformat = {
			{
				"BufWritePost",
				"*",
				":silent FormatWrite",
			},
		},
	})
end

local status_ok, formatter = pcall(require, "formatter")
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
