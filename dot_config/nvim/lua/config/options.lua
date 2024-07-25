local os_name = vim.loop.os_uname().sysname
-- settings
vim.g.lazyvim_python_lsp = "basedpyright"
vim.g.lazyvim_python_ruff = "ruff"
vim.g.sessionoptoins = "buffers,curdir,folds,help,tabpages,winpos,winsize"
vim.g.commentstring = "# %s"
vim.g.is_linux = os_name == "Linux"
vim.g.is_wsl = vim.fn.has("wsl") == 1
vim.g.is_windows = os_name == "Windows_NT"
vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25
vim.g.maplocalleader = ","
-- options
vim.opt.shortmess:append({ s = true, c = true })
vim.opt.swapfile = false
vim.opt.wildignore =
  ".git,.hg,.svn,*.pyc,*.o,*.out,*.jpg,*.jpeg,*.png,*.gif,*.zip,**/tmp/**,*.DS_Store,**/node_modules/**,**/bower_modules/**,*.7z,*.tar.gz, __pycache__"
vim.opt.wildignorecase = true
vim.opt.spelllang = "en_us,cjk"
vim.diagnostic.config({
  virtual_text = false,
})
-- wsl specific settings
if vim.g.is_wsl then
  vim.g.clipboard = {
    name = "win32yank-wsl",
    copy = {
      ["+"] = "win32yank.exe -i --crlf",
      ["*"] = "win32yank.exe -i --crlf",
    },
    paste = {
      ["+"] = "win32yank.exe -o --lf",
      ["*"] = "win32yank.exe -o --lf",
    },
    cache_enabled = 0,
  }
end

-- neovide settings
if vim.g.neovide then
  local settings = require("config.neovide")
  local neovide_config = function()
    for name, config in pairs(settings.neovide_config) do
      vim.g["neovide_" .. name] = config
    end
  end
  neovide_config()
  -- vim.api.nvim_set_option_value("guifont", "FiraCode Nerd Font Mono:h15", {})
end

-- windows specific settings
if vim.g.is_windows then
  local shell_config = function()
    local basecmd = "-NoLogo -MTA -ExecutionPolicy RemoteSigned"
    local ctrlcmd = "-Command [console]::InputEncoding = [console]::OutputEncoding = [System.Text.Encoding]::UTF8"
    vim.api.nvim_set_option_value("shell", vim.fn.executable("pwsh") == 1 and "pwsh" or "powershell", {})
    vim.api.nvim_set_option_value("shellcmdflag", string.format("%s %s;", basecmd, ctrlcmd), {})
    vim.api.nvim_set_option_value("shellredir", "-RedirectStandardOutput %s -NoNewWindow -Wait", {})
    vim.api.nvim_set_option_value("shellpipe", "2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode", {})
    vim.api.nvim_set_option_value("shellquote", nil, {})
    vim.api.nvim_set_option_value("shellxquote", nil, {})
  end
  shell_config()
end
