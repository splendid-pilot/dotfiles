return {
  "nvim-treesitter/nvim-treesitter",
  dependencies = {
    { "NoahTheDuke/vim-just" },
  },
  opts = function(_, _)
    local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
    ---@diagnostic disable: inject-field
    parser_config.just = {
      install_info = {
        url = "https://github.com/IndianBoy42/tree-sitter-just", -- local path or git repo
        files = { "src/parser.c", "src/scanner.c" },
        branch = "main",
        -- use_makefile = true -- this may be necessary on MacOS (try if you see compiler errors)
      },
      maintainers = { "@IndianBoy42" },
      filetype = "just",
    }
  end,
}
