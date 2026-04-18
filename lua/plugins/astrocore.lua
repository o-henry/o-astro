return {
  "AstroNvim/astrocore",
  ---@type AstroCoreOpts
  opts = {
    features = {
      diagnostics = {
        virtual_text = false,
        virtual_lines = false,
      },
    },
    diagnostics = {
      virtual_text = false,
      virtual_lines = false,
      underline = true,
      severity_sort = true,
      float = {
        border = "rounded",
        source = true,
      },
    },
    options = {
      opt = {
        number = true,
        relativenumber = false,
        signcolumn = "yes:1",
        cursorline = true,
        showtabline = 2,
        laststatus = 3,
        termguicolors = true,
        scrolloff = 6,
        sidescrolloff = 6,
        wrap = false,
        pumblend = 10,
        winblend = 0,
        cmdheight = 0,
        colorcolumn = "120",
        fillchars = {
          eob = " ",
          foldopen = "",
          foldclose = "",
          foldsep = " ",
        },
      },
    },
    mappings = {
      n = {
        ["<Leader>e"] = { "<cmd>Neotree left toggle filesystem reveal<cr>", desc = "Toggle Explorer" },
      },
    },
  },
}
