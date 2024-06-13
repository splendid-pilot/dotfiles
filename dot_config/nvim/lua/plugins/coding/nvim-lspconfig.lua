return {
  "neovim/nvim-lspconfig",
  opts = function(_, opts)
    local util = require("lspconfig").util

    opts.diagnostics = {
      virtual_text = false,
    }
    opts.setup = {
      rust_analyzer = function()
        return true
      end,
    }
    opts.servers = {
      lua_ls = {
        settings = {
          Lua = {
            diagnostics = {
              globals = { "vim", "LazyVim", "require" },
            },
          },
        },
      },
      taplo = {
        default_config = {

          cmd = { "taplo", "lsp", "tcp", "--address", "0.0.0.0:0" },
          filetypes = { "toml" },
          root_dir = function(fname)
            return util.root_pattern("*.toml")(fname) or util.find_git_ancestor(fname)
          end,
          single_file_support = true,
        },
      },
    }
  end,
}
