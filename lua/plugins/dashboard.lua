---@type LazySpec
return {
  {
    "folke/snacks.nvim",
    init = function()
      local function set_dashboard_highlights()
        local desc = vim.api.nvim_get_hl(0, { name = "SnacksDashboardDesc", link = false })
        local key = vim.api.nvim_get_hl(0, { name = "SnacksDashboardKey", link = false })

        desc.underline = true
        key.underline = true

        vim.api.nvim_set_hl(0, "AstroDashboardAction", desc)
        vim.api.nvim_set_hl(0, "AstroDashboardActionKey", key)
      end

      vim.schedule(set_dashboard_highlights)
      vim.api.nvim_create_autocmd("ColorScheme", {
        callback = function() vim.schedule(set_dashboard_highlights) end,
      })
    end,
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
          header = "ASTRO",
          keys = {
            {
              key = "n",
              action = ":ene | startinsert",
              align = "center",
              text = {
                { "NEW FILE", hl = "AstroDashboardAction", width = 18 },
                { "[N]", hl = "AstroDashboardActionKey" },
              },
            },
            {
              key = "f",
              action = ":lua Snacks.dashboard.pick('files')",
              align = "center",
              text = {
                { "FIND FILE", hl = "AstroDashboardAction", width = 18 },
                { "[F]", hl = "AstroDashboardActionKey" },
              },
            },
            {
              key = "g",
              action = ":lua Snacks.dashboard.pick('live_grep')",
              align = "center",
              text = {
                { "FIND TEXT", hl = "AstroDashboardAction", width = 18 },
                { "[G]", hl = "AstroDashboardActionKey" },
              },
            },
            {
              key = "r",
              action = ":lua Snacks.dashboard.pick('oldfiles')",
              align = "center",
              text = {
                { "RECENT FILES", hl = "AstroDashboardAction", width = 18 },
                { "[R]", hl = "AstroDashboardActionKey" },
              },
            },
            {
              key = "c",
              action = ":lua Snacks.dashboard.pick('files', { cwd = vim.fn.stdpath('config') })",
              align = "center",
              text = {
                { "CONFIG", hl = "AstroDashboardAction", width = 18 },
                { "[C]", hl = "AstroDashboardActionKey" },
              },
            },
            {
              key = "s",
              section = "session",
              align = "center",
              text = {
                { "RESTORE SESSION", hl = "AstroDashboardAction", width = 18 },
                { "[S]", hl = "AstroDashboardActionKey" },
              },
            },
            {
              key = "l",
              action = ":Lazy",
              enabled = package.loaded.lazy ~= nil,
              align = "center",
              text = {
                { "PLUGIN MANAGER", hl = "AstroDashboardAction", width = 18 },
                { "[L]", hl = "AstroDashboardActionKey" },
              },
            },
            {
              key = "q",
              action = ":qa",
              align = "center",
              text = {
                { "QUIT", hl = "AstroDashboardAction", width = 18 },
                { "[Q]", hl = "AstroDashboardActionKey" },
              },
            },
          },
        },
        sections = {
          { section = "header", padding = { 1, 1 } },
          { section = "keys", gap = 0, padding = 0 },
          function()
            local items = Snacks.dashboard.sections.recent_files({ limit = 5 })()

            for _, item in ipairs(items) do
              item.icon = nil
            end

            table.insert(items, 1, { title = "RECENT" })
            items.padding = { 1, 0 }

            return items
          end,
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
      picker = {
        icons = {
          files = {
            enabled = false,
          },
          ui = {
            live = "",
          },
        },
        layout = {
          config = function(layout)
            local function square_borders(box)
              if type(box) ~= "table" then
                return
              end

              if box.border == true or box.border == "rounded" then
                box.border = "single"
              end

              for _, child in ipairs(box) do
                square_borders(child)
              end
            end

            square_borders(layout.layout)
            return layout
          end,
        },
      },
    },
  },
}
