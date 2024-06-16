return {
  "neovim/nvim-lspconfig",
  opts = function(_, opts)
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
      dartls = {},
    }
  end,
}
