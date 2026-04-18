---@type LazySpec
return {
  {
    "folke/snacks.nvim",
    opts = {
      dashboard = {
        width = 72,
        row = nil,
        col = nil,
        formats = {
          file = function(item, ctx)
            local width = ctx.width or 999
            local fname = vim.fn.fnamemodify(item.file, ":~")
            fname = ctx.width and #fname > ctx.width and vim.fn.pathshorten(fname) or fname
            if #fname > width then
              local dir = vim.fn.fnamemodify(fname, ":h")
              local file = vim.fn.fnamemodify(fname, ":t")
              if dir and file then
                file = file:sub(-(width - #dir - 2))
                fname = dir .. "/…" .. file
              end
            end
            local dir, file = fname:match("^(.*)/(.+)$")
            if dir and file then
              return {
                { dir:lower() .. "/", hl = "SnacksDashboardDir" },
                { file, hl = "SnacksDashboardFile" },
              }
            end
            return { { fname, hl = "SnacksDashboardFile" } }
          end,
        },
        preset = {
          header = table.concat({
            "┌──────────────────────────────┐",
            "│          ASTRO NVIM          │",
            "└──────────────────────────────┘",
          }, "\n"),
          keys = {
            {
              key = "n",
              action = ":ene | startinsert",
              align = "center",
              text = {
                { "NEW FILE", hl = "SnacksDashboardDesc", width = 18 },
                { "[N]", hl = "SnacksDashboardKey" },
              },
            },
            {
              key = "f",
              action = ":lua Snacks.dashboard.pick('files')",
              align = "center",
              text = {
                { "FIND FILE", hl = "SnacksDashboardDesc", width = 18 },
                { "[F]", hl = "SnacksDashboardKey" },
              },
            },
            {
              key = "g",
              action = ":lua Snacks.dashboard.pick('live_grep')",
              align = "center",
              text = {
                { "FIND TEXT", hl = "SnacksDashboardDesc", width = 18 },
                { "[G]", hl = "SnacksDashboardKey" },
              },
            },
            {
              key = "r",
              action = ":lua Snacks.dashboard.pick('oldfiles')",
              align = "center",
              text = {
                { "RECENT FILES", hl = "SnacksDashboardDesc", width = 18 },
                { "[R]", hl = "SnacksDashboardKey" },
              },
            },
            {
              key = "c",
              action = ":lua Snacks.dashboard.pick('files', { cwd = vim.fn.stdpath('config') })",
              align = "center",
              text = {
                { "CONFIG", hl = "SnacksDashboardDesc", width = 18 },
                { "[C]", hl = "SnacksDashboardKey" },
              },
            },
            {
              key = "s",
              section = "session",
              align = "center",
              text = {
                { "RESTORE SESSION", hl = "SnacksDashboardDesc", width = 18 },
                { "[S]", hl = "SnacksDashboardKey" },
              },
            },
            {
              key = "l",
              action = ":Lazy",
              enabled = package.loaded.lazy ~= nil,
              align = "center",
              text = {
                { "PLUGIN MANAGER", hl = "SnacksDashboardDesc", width = 18 },
                { "[L]", hl = "SnacksDashboardKey" },
              },
            },
            {
              key = "q",
              action = ":qa",
              align = "center",
              text = {
                { "QUIT", hl = "SnacksDashboardDesc", width = 18 },
                { "[Q]", hl = "SnacksDashboardKey" },
              },
            },
          },
        },
        sections = {
          { section = "header", padding = { 1, 1 } },
          {
            align = "center",
            text = {
              { "UNITY / CSHARP / LUA", hl = "SnacksDashboardFooter" },
            },
            padding = 0,
          },
          { section = "keys", gap = 0, padding = 0 },
          {
            title = "RECENT",
            section = "recent_files",
            limit = 5,
            padding = { 1, 0 },
          },
          function()
            local stats = require("lazy.stats").stats()
            local ms = math.floor(stats.startuptime * 100 + 0.5) / 100
            return {
              align = "center",
              padding = { 1, 0 },
              text = {
                { "NVIM LOADED ", hl = "SnacksDashboardFooter" },
                { ("%d/%d"):format(stats.loaded, stats.count), hl = "SnacksDashboardKey" },
                { " PLUGINS IN ", hl = "SnacksDashboardFooter" },
                { (ms .. "MS"):upper(), hl = "SnacksDashboardKey" },
              },
            }
          end,
        },
      },
    },
  },
}
