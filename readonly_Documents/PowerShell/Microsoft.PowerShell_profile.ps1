Set-PSReadLineOption -EditMode Emacs
Set-PSReadLineOption -BellStyle None

$env:VIRTUAL_ENV_DISABLE_PROMPT=1
$env:MCFLY_INTERFACE_VIEW="BOTTOM"
$env:DOTNET_CLI_TELEMETRY_OPTOUT=1

function CmdExists($cmdName){
  return [bool](Get-Command -Name $cmdName -ErrorAction SilentlyContinue)
}

if (CmdExists("oh-my-posh")) {
  $env:POSH_GIT_ENABLED = $true
  oh-my-posh init pwsh --config "$HOME\.config\omp\tokoyonight.json" | Invoke-Expression
}
if (CmdExists("zoxide")){
  Invoke-Expression (& { (zoxide init powershell | Out-String) })
}
if (CmdExists("carapace")){
  $env:CARAPACE_BRIDGES = 'zsh,fish,bash,inshellisense' # optional
    Set-PSReadLineOption -Colors @{ "Selection" = "`e[7m" }
  Set-PSReadlineKeyHandler -Key Tab -Function MenuComplete
    carapace _carapace | Out-String | Invoke-Expression
}
. C:\Users\theo\Documents\PowerShell\Completions\just.ps1
. C:\Users\theo\Documents\PowerShell\Completions\fd.ps1
. C:\Users\theo\Documents\PowerShell\Completions\rg.ps1
. C:\Users\theo\Documents\PowerShell\Completions\chezmoi.ps1
. C:\Users\theo\Documents\PowerShell\alias.ps1

