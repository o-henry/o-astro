return {
  "lukas-reineke/indent-blankline.nvim",
  main = "ibl",
  event = { "BufReadPost", "BufNewFile" },
  opts = {
    indent = {
      char = "│",
      tab_char = "│",
      highlight = "IblIndent",
    },
    scope = {
      enabled = true,
      show_start = false,
      show_end = false,
      highlight = "IblScope",
    },
    whitespace = {
      remove_blankline_trail = false,
    },
    exclude = {
      filetypes = {
        "alpha",
        "dashboard",
        "help",
        "lazy",
        "mason",
        "neo-tree",
        "notify",
        "snacks_dashboard",
        "Trouble",
      },
      buftypes = { "terminal", "nofile", "quickfix", "prompt" },
    },
  },
}
