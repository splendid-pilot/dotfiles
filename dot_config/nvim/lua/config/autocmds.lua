local mapping = require("config.completions")

vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("LspKeymapLoader", { clear = true }),
  callback = function(event)
    if not _G._debugging then
      mapping.lsp(event.buf)
    end
  end,
})
vim.api.nvim_create_autocmd("BufEnter", {
  group = vim.api.nvim_create_augroup("NvimTreeClose", { clear = true }),
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
vim.api.nvim_create_autocmd({
  "BufNewFile",
  "BufRead",
}, {
  pattern = "*.typ",
  callback = function()
    local buf = vim.api.nvim_get_current_buf()
    vim.api.nvim_buf_set_option(buf, "filetype", "typst")
  end,
})
vim.api.nvim_create_autocmd("FileType", {
  command = "set formatoptions-=cro",
})
