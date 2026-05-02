return {
  {
    "folke/which-key.nvim",
    opts = function(_, opts)
      opts.icons = opts.icons or {}
      opts.icons.mappings = false

      opts.replace = opts.replace or {}
      opts.replace.desc = opts.replace.desc or {}
      table.insert(opts.replace.desc, function(desc) return desc:upper() end)
    end,
  },
}
