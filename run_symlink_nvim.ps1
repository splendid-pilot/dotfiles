$sourcePath = "$HOME\.config\nvim"
$destinationPath = "$env:LOCALAPPDATA\nvim"

# Check if the destination already exists as a symlink or a directory
if (!(Test-Path -Path $destinationPath)) {
    # Create a symlink to the nvim configuration in AppData\Local\nvim
    New-Item -ItemType SymbolicLink -Path $destinationPath -Target $sourcePath -Force
    Write-Output "Symlink created: $destinationPath -> $sourcePath"
} else {
    Write-Output "Symlink or directory already exists at $destinationPath. No action taken."
}
