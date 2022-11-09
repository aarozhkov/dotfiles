-- local colorscheme = "tokyonight"
local colorscheme = "everforest"
-- local colorscheme = "gruvbox"

-- Tokyonight configuration
vim.g.tokyonight_style = "night"
vim.g.tokyonight_colors = {
    NvimTreeGitDirty = "green2",
}

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  vim.notify("colorscheme " .. colorscheme .. " not found!")
  return
end
