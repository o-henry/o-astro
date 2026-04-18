return {
  {
    "AstroNvim/astroui",
    ---@type AstroUIOpts
    opts = {
      colorscheme = "vscode",
      status = {
        components = {
          git_branch = {
            git_branch = { icon = false },
          },
        },
      },
    },
  },
  {
    "Mofiqul/vscode.nvim",
    priority = 1000,
    opts = function()
      local colors = require("vscode.colors").get_colors()
      return {
        transparent = true,
        italic_comments = true,
        italic_inlayhints = true,
        underline_links = true,
        disable_nvimtree_bg = true,
        terminal_colors = true,
        group_overrides = {
          TabLine = { fg = "#8b949e", bg = "NONE" },
          TabLineFill = { bg = "NONE" },
          TabLineSel = { fg = colors.vscFront, bg = "NONE", underline = true, sp = colors.vscBlue },
          CursorLineNr = { fg = colors.vscFront, bold = true },
          LineNr = { fg = "#5b6470" },
          WinSeparator = { fg = "#2f353d", bg = "NONE" },
          NeoTreeCursorLine = { bg = "#20252b", bold = true },
          NeoTreeIndentMarker = { fg = "#313844" },
        },
      }
    end,
  },
}
