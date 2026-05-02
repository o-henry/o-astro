return {
  {
    "folke/which-key.nvim",
    opts = function(_, opts)
      opts.icons = opts.icons or {}
      opts.icons.mappings = false

      opts.replace = opts.replace or {}
      opts.replace.desc = opts.replace.desc or {}
      table.insert(opts.replace.desc, function(desc)
        local trimmed = desc:gsub("^%s+", "")
        local icon = vim.fn.strcharpart(trimmed, 0, 1)
        local rest = vim.fn.strcharpart(trimmed, 1)
        local label = rest:gsub("^%s+", "")

        if icon ~= "" and icon:byte() and icon:byte() > 127 and label:match("^[%w/]") then
          return label
        end

        return desc
      end)
      table.insert(opts.replace.desc, function(desc) return desc:upper() end)
    end,
  },
}
