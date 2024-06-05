local mapping = require("config.completions")
local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup
local MineGroup = augroup("MineGroup", {})
autocmd("LspAttach", {
  group = augroup("LspKeymapLoader", { clear = true }),
  callback = function(event)
    mapping.lsp(event.buf)
  end,
})
autocmd("BufEnter", {
  group = augroup("NvimTreeClose", { clear = true }),
  pattern = "NvimTree_*",
  callback = function()
    local layout = vim.api.nvim_call_function("winlayout", {})
    if
      layout[1] == "leaf"
      and vim.api.nvim_get_option_value("filetype", { buf = vim.api.nvim_win_get_buf(layout[2]) }) == "NvimTree"
      and layout[3] == nil
    then
      vim.api.nvim_command([[confirm quit]])
    end
  end,
})

autocmd({ "BufWritePre" }, {
  group = MineGroup,
  pattern = "*",
  command = [[%s/\s\+$//e]],
})
autocmd("FileType", {
  group = MineGroup,
  command = "set formatoptions-=cro",
})
vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local bufnr = args.buf
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if vim.tbl_contains({ "null-ls" }, client.name) then -- blacklist lsp
      return
    end
    require("lsp_signature").on_attach({
      -- ... setup options here ...
    }, bufnr)
  end,
})
