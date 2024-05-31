return {
  "neovim/nvim-lspconfig",
  opts = {
    diagnostics = {
      virtual_text = false,
    },
    setup = {
      rust_analyzer = function()
        return true
      end,
    },
    servers = {
      tinymist = {
        single_file_support = true,
        root_dir = function()
          return vim.fn.getcwd()
        end,
        settings = {
          exportPdf = "onSave",
        },
      },
      lua_ls = {
        settings = {
          Lua = {
            diagnostics = {
              globals = { "vim", "LazyVim" },
            },
          },
        },
      },
    },
  },
}
