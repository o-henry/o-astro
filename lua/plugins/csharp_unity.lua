---@type LazySpec
return {
  {
    "AstroNvim/astrolsp",
    opts = {
      config = {
        omnisharp = {
          root_dir = function(bufnr, on_dir)
            local util = require "lspconfig.util"
            local fname = vim.api.nvim_buf_get_name(bufnr)

            local root = util.root_pattern "*.slnx"(fname)
              or util.root_pattern "*.sln"(fname)
              or util.root_pattern "*.csproj"(fname)
              or util.root_pattern "omnisharp.json"(fname)
              or util.root_pattern "function.json"(fname)

            if not root then
              local unity_root = util.root_pattern("Assets", "ProjectSettings", "Packages/manifest.json")(fname)
              if unity_root then
                local generated = vim.fs.find(function(name)
                  return name:match "%.slnx?$" or name:match "%.csproj$"
                end, { path = unity_root, upward = false, limit = 1 })
                if #generated > 0 then root = unity_root end
              end
            end

            on_dir(root)
          end,
          settings = {
            FormattingOptions = {
              EnableEditorConfigSupport = true,
              OrganizeImports = true,
            },
            MsBuild = {
              LoadProjectsOnDemand = false,
            },
            RoslynExtensionsOptions = {
              EnableAnalyzersSupport = true,
              EnableImportCompletion = true,
              EnableDecompilationSupport = true,
            },
            Sdk = {
              IncludePrereleases = true,
            },
          },
        },
      },
    },
  },
  {
    "L3MON4D3/LuaSnip",
    config = function(plugin, opts)
      require("astronvim.plugins.configs.luasnip")(plugin, opts)
      require("luasnip.loaders.from_lua").lazy_load { paths = { vim.fn.stdpath "config" .. "/lua/snippets" } }
    end,
  },
}
