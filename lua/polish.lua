local augroup = vim.api.nvim_create_augroup("vscode_glass_finish", { clear = true })

local function set_hl(group, value) vim.api.nvim_set_hl(0, group, value) end

local function apply_glass_highlights()
  local transparent = {
    "Normal",
    "NormalNC",
    "SignColumn",
    "EndOfBuffer",
    "FoldColumn",
    "StatusLine",
    "StatusLineNC",
    "TabLineFill",
    "WinBar",
    "WinBarNC",
    "NeoTreeNormal",
    "NeoTreeNormalNC",
    "NeoTreeEndOfBuffer",
  }

  for _, group in ipairs(transparent) do
    set_hl(group, { bg = "NONE" })
  end

  set_hl("WinSeparator", { fg = "#2f353d", bg = "NONE" })
  set_hl("CursorLine", { bg = "#1b1f24", blend = 30 })
  set_hl("CursorLineNr", { fg = "#d7dae0", bold = true })
  set_hl("LineNr", { fg = "#5b6470" })
  set_hl("ColorColumn", { bg = "#1b1f24", blend = 45 })
  set_hl("NeoTreeCursorLine", { bg = "#20252b", bold = true })
  set_hl("NeoTreeWinSeparator", { fg = "#2f353d", bg = "NONE" })
  set_hl("FloatBorder", { fg = "#3b4350", bg = "#11151a" })
  set_hl("NormalFloat", { bg = "#11151a" })
  set_hl("Pmenu", { bg = "#151a20" })
  set_hl("PmenuSel", { bg = "#263042" })
  set_hl("Visual", { bg = "#2a3342" })
  set_hl("SnacksDashboardNormal", { bg = "NONE" })
  set_hl("SnacksDashboardHeader", { fg = "#d7dae0", bg = "NONE", bold = true })
  set_hl("SnacksDashboardDesc", { fg = "#b9c2cf", bg = "NONE" })
  set_hl("SnacksDashboardKey", { fg = "#7aa2f7", bg = "NONE", bold = true })
  set_hl("SnacksDashboardFooter", { fg = "#8e97a4", bg = "NONE", italic = true })
  set_hl("SnacksDashboardTitle", { fg = "#c9d3e0", bg = "NONE", bold = true })
  set_hl("SnacksDashboardFile", { fg = "#b9c2cf", bg = "NONE" })
  set_hl("SnacksDashboardDir", { fg = "#7f8792", bg = "NONE" })
  set_hl("BufferLineFill", { bg = "#2b353d" })
  set_hl("BufferLineBackground", { fg = "#92a0ac", bg = "#2b353d" })
  set_hl("BufferLineBufferVisible", { fg = "#a8b4be", bg = "#2b353d" })
  set_hl("BufferLineBufferSelected", { fg = "#f3f7fa", bg = "#5b9fc9", bold = false, italic = false })
  set_hl("BufferLineIndicatorSelected", { fg = "#5b9fc9", bg = "#5b9fc9" })
  set_hl("BufferLineSeparator", { fg = "#2b353d", bg = "#2b353d" })
  set_hl("BufferLineSeparatorVisible", { fg = "#2b353d", bg = "#2b353d" })
  set_hl("BufferLineSeparatorSelected", { fg = "#2b353d", bg = "#2b353d" })
  set_hl("BufferLineCloseButton", { fg = "#d8eef8", bg = "#2b353d" })
  set_hl("BufferLineCloseButtonVisible", { fg = "#d8eef8", bg = "#2b353d" })
  set_hl("BufferLineCloseButtonSelected", { fg = "#f3f7fa", bg = "#5b9fc9" })
  set_hl("BufferLineModified", { fg = "#dcb36c", bg = "#2b353d" })
  set_hl("BufferLineModifiedVisible", { fg = "#dcb36c", bg = "#2b353d" })
  set_hl("BufferLineModifiedSelected", { fg = "#ffe39d", bg = "#5b9fc9" })
  set_hl("IblIndent", { fg = "#2a3038", nocombine = true })
  set_hl("IblScope", { fg = "#3a4554", nocombine = true })
end

vim.api.nvim_create_autocmd({ "ColorScheme", "UIEnter" }, {
  group = augroup,
  callback = apply_glass_highlights,
})

vim.schedule(apply_glass_highlights)
