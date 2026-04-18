return {
  "nvim-neo-tree/neo-tree.nvim",
  opts = {
    close_if_last_window = false,
    popup_border_style = "rounded",
    source_selector = {
      winbar = true,
      statusline = false,
      content_layout = "center",
      tabs_layout = "equal",
      sources = {
        { source = "filesystem", display_name = " FILE " },
        { source = "buffers", display_name = " BUFS " },
        { source = "git_status", display_name = " GIT " },
      },
    },
    window = {
      width = 30,
    },
    renderers = {
      directory = {
        { "indent" },
        { "current_filter" },
        {
          "container",
          content = {
            { "name", zindex = 10 },
            {
              "symlink_target",
              zindex = 10,
              highlight = "NeoTreeSymbolicLinkTarget",
            },
            { "clipboard", zindex = 10 },
            { "diagnostics", errors_only = true, zindex = 20, align = "right", hide_when_expanded = true },
            { "git_status", zindex = 10, align = "right", hide_when_expanded = true },
            { "file_size", zindex = 10, align = "right" },
            { "type", zindex = 10, align = "right" },
            { "last_modified", zindex = 10, align = "right" },
            { "created", zindex = 10, align = "right" },
          },
        },
      },
      file = {
        { "indent" },
        {
          "container",
          content = {
            { "name", zindex = 10 },
            {
              "symlink_target",
              zindex = 10,
              highlight = "NeoTreeSymbolicLinkTarget",
            },
            { "clipboard", zindex = 10 },
            { "bufnr", zindex = 10 },
            { "modified", zindex = 20, align = "right" },
            { "diagnostics", zindex = 20, align = "right" },
            { "git_status", zindex = 10, align = "right" },
            { "file_size", zindex = 10, align = "right" },
            { "type", zindex = 10, align = "right" },
            { "last_modified", zindex = 10, align = "right" },
            { "created", zindex = 10, align = "right" },
          },
        },
      },
      terminal = {
        { "indent" },
        { "name" },
        { "bufnr" },
      },
    },
    filesystem = {
      components = {
        name = function(config, node, state)
          local component = require("neo-tree.sources.common.components").name(config, node, state)
          if node:get_depth() == 1 and component.text then component.text = component.text:lower() end
          return component
        end,
        file_size = function(config, node, state)
          local component = require("neo-tree.sources.common.components").file_size(config, node, state)
          if node:get_depth() == 1 and component.text then component.text = component.text:gsub("Size", "SIZE") end
          return component
        end,
        type = function(config, node, state)
          local component = require("neo-tree.sources.common.components").type(config, node, state)
          if node:get_depth() == 1 and component.text then component.text = component.text:gsub("Type", "TYPE") end
          return component
        end,
        last_modified = function(config, node, state)
          local component = require("neo-tree.sources.common.components").last_modified(config, node, state)
          if node:get_depth() == 1 and component.text then
            component.text = component.text:gsub("Last Modified", "LAST MODIFIED")
          end
          return component
        end,
      },
      filtered_items = {
        visible = true,
        hide_dotfiles = false,
        hide_gitignored = false,
        never_show = { ".DS_Store" },
      },
      follow_current_file = {
        enabled = true,
        leave_dirs_open = true,
      },
      use_libuv_file_watcher = true,
    },
    default_component_configs = {
      indent = {
        indent_size = 2,
        padding = 0,
      },
      icon = {
        folder_closed = "",
        folder_open = "",
        folder_empty = "",
        folder_empty_open = "",
        default = "",
        provider = function() end,
      },
      git_status = {
        symbols = {
          added = "",
          deleted = "",
          modified = "",
          renamed = "",
          untracked = "",
          ignored = "",
          unstaged = "󰄱",
          staged = "",
          conflict = "",
        },
      },
    },
  },
}
