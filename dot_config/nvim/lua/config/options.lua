local os_name = vim.loop.os_uname().sysname
-- settings
vim.g.lazyvim_python_lsp = "basedpyright"
vim.g.lazyvim_python_ruff = "ruff"
vim.g.sessionoptoins = "buffers,curdir,folds,help,tabpages,winpos,winsize"
vim.g.commentstring = "# %s"
vim.g.is_linux = os_name == "Linux"
vim.g.is_wsl = vim.fn.has("wsl") == 1
vim.g.is_windows = os_name == "Windows_NT"
vim.g.is_ssh_session = os.getenv("SSH_TTY") ~= nil
vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25
vim.g.maplocalleader = ","
-- options
vim.opt.shortmess:append({ s = true, c = true })
vim.opt.rtp:append(",/home/linuxbrew/.linuxbrew/opt/fzf/")
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
  if vim.g.is_ssh_session then
    local function paste()
      return function(lins)
        local content = vim.fn.getreg('"')
        return vim.split(content, "\n")
      end
    end

    vim.g.clipboard = {
      name = "OSC 52",
      copy = {
        ["+"] = require("vim.ui.clipboard.osc52").copy("+"),
        ["*"] = require("vim.ui.clipboard.osc52").copy("*"),
      },
      paste = {
        ["+"] = paste,
        ["*"] = paste,
      },
    }
  else
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
  vim.opt.shell = "nu"
  -- local shell_config = function()
  -- 	local basecmd = "-NoLogo -MTA -ExecutionPolicy RemoteSigned"
  -- 	local ctrlcmd =
  -- 		"-Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.UTF8Encoding]::new();$PSDefaultParameterValues['Out-File:Encoding']='utf8';"
  -- 	vim.api.nvim_set_option_value("shell", vim.fn.executable("pwsh") == 1 and "pwsh" or "powershell", {})
  -- 	vim.api.nvim_set_option_value("shellcmdflag", string.format("%s %s;", basecmd, ctrlcmd), {})
  -- 	vim.api.nvim_set_option_value("shellredir", '2>&1 | %%{ "$_" } | Out-File %s; exit $LastExitCode', {})
  -- 	vim.api.nvim_set_option_value("shellpipe", '2>&1 | %%{ "$_" } | Tee-Object %s; exit $LastExitCode', {})
  -- 	vim.api.nvim_set_option_value("shellquote", "", {})
  -- 	vim.api.nvim_set_option_value("shellxquote", "", {})
  -- end
  -- shell_config()
end

if vim.g.is_windows or (vim.g.is_wsl and not vim.g.is_ssh_session) then
  local hour = os.date("*t", os.time()).hour
  vim.schedule(function()
    if hour < 18 then
      vim.o.background = "light"
    else
      vim.o.background = "dark"
    end
  end)
end
