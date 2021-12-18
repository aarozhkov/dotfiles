local utils = {}

function utils.reload_lv_config()
  vim.cmd "source ~/.config/nvim/lv-config.lua"
  vim.cmd "source ~/.config/nvim/lua/plugins.lua"
  vim.cmd "source ~/.config/nvim/lua/settings.lua"
  vim.cmd "source ~/.config/nvim/lua/core/formatter.lua"
  vim.cmd ":PackerCompile"
  vim.cmd ":PackerInstall"
  -- vim.cmd ":PackerClean"
end

function utils.check_lsp_client_active(name)
  local clients = vim.lsp.get_active_clients()
  for _, client in pairs(clients) do
    if client.name == name then
      return true
    end
  end
  return false
end

function utils.define_augroups(definitions) -- {{{1
  -- Create autocommand groups based on the passed definitions
  --
  -- The key will be the name of the group, and each definition
  -- within the group should have:
  --    1. Trigger
  --    2. Pattern
  --    3. Text
  -- just like how they would normally be defined from Vim itself
  for group_name, definition in pairs(definitions) do
    vim.cmd("augroup " .. group_name)
    vim.cmd "autocmd!"

    for _, def in pairs(definition) do
      local command = table.concat(vim.tbl_flatten { "autocmd", def }, " ")
      vim.cmd(command)
    end

    vim.cmd "augroup END"
  end
end

function utils.test(name)
    print(name)
end

return utils
