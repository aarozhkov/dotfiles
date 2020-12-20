local api = vim.api


local eval = vim.api.nvim_eval
local Coc = {} 
-- Coc extensions
vim.g.coc_global_extensions = {
	'coc-actions',
	'coc-html',
	'coc-json',
	'coc-markdownlint',
	'coc-spell-checker',
	'coc-tabnine',
}

-- Use tab for trigger completion with characters ahead and navigate
Coc.is_pum_visible = function()
    return  (eval('pumvisible()') > 0)
end

Coc.is_rpc_ready = function()
	return eval('coc#rpc#ready()') > 0
end

--[[
-- Returns boolean
-- IF cursor is on white space charactor, true will be returned
-- IF cursor is on non white space charactor, false will be returned
--
-- @returns boolean
--]]

check_back_space = function()
  -- nvim_win_get_cursor - argument 0 = current buffer, return tables with x,y. Get y.
  local byte_index = api.nvim_win_get_cursor(0)[2]
  local line_char = v.nvim_get_current_line():sub(byte_index, byte_index)
  return string.find(line_char, '%s') ~= nil
end


Coc.go_to_next_completion_item = function(org_input)
	-- go to next item if completion menu visible
	if Coc.is_pum_visible() then
		api.nvim_input('<c-n>')

	-- if current charactor is white space, input the original user input
	elseif check_back_space() then
        a.nvim_input(org_input)

	-- refresh the coc completion menu
	else
		eval('coc#refresh()')
	end
end

Coc.go_to_previous_completion_item = function()
    if Coc.is_pum_visible() then
		api.nvim_input('<c-p>')
    else
        api.nvim_input([[<S-TAB>]])
    end
end

Coc.select_completion_item = function()
    if Coc.is_pum_visible() then
		eval('coc#_select_confirm()')
    else
        api.nvim_input([[<TAB>]])
    end
end

Coc.show_documentation = function()
	local filetype = vim.bo.filetype

	if filetype == 'vim' or filetype == 'help' then
		local cword = e('expand("<cword>")')
		vim.cmd('help ' .. cword)
	elseif Coc.is_rpc_ready() then
		eval("CocActionAsync('doHover')")
	else
		-- following will run "man" in vim
		local keywordprg = vim.o.keywordprg
		local cword = eval('expand("<cword>")')
		vim.cmd(string.format('%s %s', keywordprg, cword))
	end
end

Coc.format_code = function()
	eval('CocAction("format")')
end

-- Keybindings
silent_opt = {}
vim.fn.nvim_set_keymap('i', '<Tab>', [[pumvisible() ? "\<C-n>" : "\<Tab>"]], {noremap = true, expr = true})
vim.fn.nvim_set_keymap('i', '<S-Tab>', [[pumvisible() ? "\<C-p>" : "\<S-Tab>"]], {noremap = true, expr = true})
api.nvim_set_keymap('n', '<leader>j', '<Plug>(coc-diagnostic-next)', silent_opt)
api.nvim_set_keymap('n', '<leader>k', '<Plug>(coc-diagnostic-prev)', silent_opt)

api.nvim_set_keymap('n', 'gd', '<Plug>(coc-definition)<cr>', {noremap = true, silent = true})
api.nvim_set_keymap('n', 'gi', '<Plug>(coc-implementation)<cr>', silent_opt )
api.nvim_set_keymap('n', 'gr', '<Plug>(coc-references)<cr>', silent_opt )
api.nvim_set_keymap('n', 'gt', '<Plug>(coc-type-definition)<cr>', silent_opt )
api.nvim_set_keymap('n', 'K', '<cmd>lua Coc.show_documentation()<cr>', silent_opt )
api.nvim_set_keymap('n', '<leader>rn', '<Plug>(coc-rename)', silent_opt)
api.nvim_set_keymap('n', '<leader>qf', '<Plug>(coc-fix-current)', silent_opt)
api.nvim_set_keymap('n', '<leader>ac', '<Plug>(coc-codeaction)', silent_opt)
api.nvim_set_keymap('n', '<leader>f', '<cmd>lua Coc.format_code()<cr>', silent_opt)

return Coc


