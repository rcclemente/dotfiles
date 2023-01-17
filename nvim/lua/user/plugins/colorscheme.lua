-- local colorscheme = "default"
local colorscheme = "Tomorrow-Night-Eighties"
-- local colorscheme = "tokyonight-night"
-- local colorscheme = "melange"

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  vim.notify("colorscheme " .. colorscheme .. " not found!")
  return
end

local cmd = vim.cmd

-- cmd([[highlight LineNr term=bold cterm=NONE ctermfg=DarkGrey ctermbg=Grey gui=NONE guifg=DarkGrey guibg=DarkGre]])
cmd([[highlight LineNr term=bold cterm=NONE ctermfg=DarkGrey ctermbg=Black gui=NONE guifg=DarkGrey guibg=Black]])
-- highlight LineNr term=bold cterm=NONE ctermfg=DarkGrey ctermbg=Black gui=NONE guifg=DarkGrey guibg=Black

