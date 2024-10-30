function ls-Alias
{
  lsd --hyperlink always @Args
}
Set-Alias -Name ls -Value ls-Alias

function ll-Alias
{
  lsd -lh --hyperlink always @Args
}
Set-Alias -Name ll -Value ll-Alias

function la-Alias
{
  lsd -A --hyperlink always @Args
}
Set-Alias -Name la -Value la-Alias

function cst-Alias
{
  chezmoi status @Args
}
Set-Alias -Name cst -Value cst-Alias

function cadd-Alias
{
  chezmoi add @Args
}
Set-Alias -Name cadd -Value cadd-Alias

function ccd-Alias
{
  chezmoi cd @Args
}
Set-Alias -Name ccd -Value ccd-Alias

function can-Alias
{
  chezmoi apply -nv @Args
}
Set-Alias -Name can -Value can-Alias

function capply-Alias
{
  chezmoi apply -v @Args
}
Set-Alias -Name capply -Value capply-Alias

function cdiff-Alias
{
  chezmoi diff @Args
}
Set-Alias -Name cdiff -Value cdiff-Alias

function creadd-Alias
{
  chezmoi status | cut -f2 -d ' ' | chezmoi re-add @Args
}
Set-Alias -Name creadd -Value creadd-Alias

function cforget-Alias
{
  chezmoi forget @Args
}
Set-Alias -Name cforget -Value cforget-Alias

function cgp-Alias
{
  chezmoi git push @Args
}
Set-Alias -Name cgp -Value cgp-Alias

function cgl-Alias
{
  chezmoi git pull @Args
}
Set-Alias -Name cgl -Value cgl-Alias

function cfind-Alias
{
  chezmoi find @Args
}
Set-Alias -Name cfind -Value cfind-Alias

function cgf-Alias
{
  chezmoi git fetch @Args
}
Set-Alias -Name cgf -Value cgf-Alias

function cgst-Alias
{
  chezmoi git status @Args
}
Set-Alias -Name cgst -Value cgst-Alias

function cedit-Alias
{
  chezmoi edit @Args
}
Set-Alias -Name cedit -Value cedit-Alias

function v-Alias
{
  nvim @Args
}
Set-Alias -Name v -Value v-Alias

function gst-Alias
{
  git status @Args
}
Set-Alias -Name gst -Value gst-Alias

function belp
{
  param (
    [Parameter(Mandatory, Position = 0)]
    [string]$Command,
    [Parameter(Position = 1, ValueFromRemainingArguments)]
    [string[]]$Remaining
  )
  $remaing_arg = $Remaining  -join " "
  if ($Command.Trim() -eq "go")
  {
    $cmd = $Command, "help", $remaing_arg,  -join " "
  } else
  {
    $cmd = $Command, $remaing_arg, "--help" -join " "
  }
  Invoke-Expression "$cmd | bat -plhelp"
}


function yy
{
  $tmp = [System.IO.Path]::GetTempFileName()
  yazi $args --cwd-file="$tmp"
  $cwd = Get-Content -Path $tmp
  if (-not [String]::IsNullOrEmpty($cwd) -and $cwd -ne $PWD.Path)
  {
    Set-Location -Path $cwd
  }
  Remove-Item -Path $tmp
}

function mkcd {
    param(
        [Parameter(Mandatory=$true, Position=0)]
        [string]$Path
    )

    try {
        # Expand environment variables and convert to absolute path
        $expandedPath = [System.Environment]::ExpandEnvironmentVariables($Path)
        $absolutePath = $ExecutionContext.SessionState.Path.GetUnresolvedProviderPathFromPSPath($expandedPath)

        # Check if path exists and is a file
        if (Test-Path -Path $absolutePath -PathType Leaf) {
            throw "Path exists but is a file: $absolutePath"
        }

        # Create directory if it doesn't exist
        $null = New-Item -ItemType Directory -Path $absolutePath -Force

        # Change to the new directory
        Set-Location -Path $absolutePath
    }
    catch {
        Write-Error $_
        return $false
    }
}

#function trash-put {
#    param (
#        [Parameter(Mandatory=$true, ValueFromPipeline=$true)]
#        [string[]]$Path
#    )
#
#    process {
#        foreach ($item in $Path) {
#            try {
#                $fullPath = Resolve-Path $item -ErrorAction Stop
#
#                # Get appropriate trash directories
#                $drive = Split-Path -Path $fullPath -Qualifier
#                $trashDir = if ($drive -and $drive -ne "${HOME}:") {
#                    "${drive}\.local\Trash"
#                } else {
#                    "$HOME\.local\share\Trash"
#                }
#
#                $trashFilesDir = Join-Path $trashDir "files"
#                $trashInfoDir = Join-Path $trashDir "info"
#
#                # Create directories if they don't exist
#                @($trashDir, $trashFilesDir, $trashInfoDir) | ForEach-Object {
#                    if (!(Test-Path $_)) {
#                        $null = New-Item -ItemType Directory -Path $_ -Force
#                        if ($drive) {
#                            (Get-Item -Path $trashDir -Force).Attributes = 'Hidden'
#                        }
#                    }
#                }
#
#                # Generate unique name
#                $fileName = Split-Path $fullPath -Leaf
#                $baseNameWithoutExt = [System.IO.Path]::GetFileNameWithoutExtension($fileName)
#                $extension = [System.IO.Path]::GetExtension($fileName)
#                $timestamp = Get-Date -Format "yyyyMMdd-HHmmss"
#                $uniqueName = "${baseNameWithoutExt}_${timestamp}${extension}"
#
#                # Create info file
#                $infoContent = @"
#[Trash Info]
#Path=$fullPath
#DeletionDate=$(Get-Date -Format "yyyy-MM-dd HH:mm:ss")
#"@
#                $infoPath = Join-Path $trashInfoDir "$uniqueName.trashinfo"
#                $infoContent | Out-File -FilePath $infoPath -Encoding utf8 -NoNewline
#
#                # Move file to trash
#                $destination = Join-Path $trashFilesDir $uniqueName
#                Move-Item -Path $fullPath -Destination $destination -Force
#                Write-Host "Moved to trash: $fullPath"
#            }
#            catch {
#                Write-Error "Failed to move to trash: $_"
#            }
#        }
#    }
#}
#
#function trash-list {
#    param (
#        [switch]$ShowFullPath
#    )
#
#    # Get all trash directories
#    $trashDirs = @("$HOME\.local\share\Trash")
#    Get-PSDrive -PSProvider FileSystem | ForEach-Object {
#        $driveTrash = "${_}:\.local\Trash"
#        if (Test-Path $driveTrash) {
#            $trashDirs += $driveTrash
#        }
#    }
#
#    $results = foreach ($trashDir in $trashDirs) {
#        $infoDir = Join-Path $trashDir "info"
#        $filesDir = Join-Path $trashDir "files"
#
#        if (!(Test-Path $infoDir)) { continue }
#
#        Get-ChildItem $infoDir -Filter "*.trashinfo" -ErrorAction SilentlyContinue | ForEach-Object {
#            try {
#                $infoContent = Get-Content $_.FullName -Raw
#                if ($infoContent -match "Path=(.*)\r?\nDeletionDate=(.*)") {
#                    $originalPath = $matches[1]
#                    $deletionDate = $matches[2]
#
#                    $trashFile = Join-Path $filesDir $_.BaseName
#                    if (Test-Path $trashFile) {
#                        $size = (Get-Item $trashFile).Length
#                        $displayPath = if ($ShowFullPath) { $originalPath } else { Split-Path $originalPath -Leaf }
#
#                        [PSCustomObject]@{
#                            Name = $displayPath
#                            Size = $size
#                            DeletionDate = $deletionDate
#                            TrashLocation = $filesDir
#                            OriginalPath = $originalPath
#                        }
#                    }
#                }
#            }
#            catch {
#                Write-Warning "Error processing $($_.FullName): $_"
#            }
#        }
#    }
#
#    $results | Format-Table -AutoSize
#}
#
#function trash-restore {
#    param (
#        [Parameter(Mandatory=$true)]
#        [string]$FileName
#    )
#
#    $trashDirs = @("$HOME\.local\share\Trash")
#    Get-PSDrive -PSProvider FileSystem | ForEach-Object {
#        $driveTrash = "${_}:\.local\Trash"
#        if (Test-Path $driveTrash) {
#            $trashDirs += $driveTrash
#        }
#    }
#
#    $found = $false
#    foreach ($trashDir in $trashDirs) {
#        $infoDir = Join-Path $trashDir "info"
#        $filesDir = Join-Path $trashDir "files"
#
#        if (!(Test-Path $infoDir)) { continue }
#
#        Get-ChildItem $infoDir -Filter "*.trashinfo" -ErrorAction SilentlyContinue | ForEach-Object {
#            try {
#                $infoContent = Get-Content $_.FullName -Raw
#                if ($infoContent -match "Path=(.*)\r?\nDeletionDate=(.*)") {
#                    $originalPath = $matches[1]
#                    if ((Split-Path $originalPath -Leaf) -eq $FileName) {
#                        $trashFile = Join-Path $filesDir $_.BaseName
#                        if (Test-Path $trashFile) {
#                            # Create directory if it doesn't exist
#                            $targetDir = Split-Path $originalPath -Parent
#                            if (!(Test-Path $targetDir)) {
#                                $null = New-Item -ItemType Directory -Path $targetDir -Force
#                            }
#
#                            # Restore file
#                            Move-Item -Path $trashFile -Destination $originalPath -Force
#                            Remove-Item $_.FullName
#                            Write-Host "Restored: $FileName to $originalPath"
#                            $found = $true
#                            return
#                        }
#                    }
#                }
#            }
#            catch {
#                Write-Warning "Error processing $($_.FullName): $_"
#            }
#        }
#    }
#
#    if (!$found) {
#        Write-Error "File not found in trash: $FileName"
#    }
#}
#
#function trash-empty {
#    param (
#        [switch]$Force
#    )
#
#    if (!$Force) {
#        $response = Read-Host "Are you sure you want to permanently delete all trashed files? (y/N)"
#        if ($response -ne "y") {
#            Write-Host "Operation cancelled"
#            return
#        }
#    }
#
#    $trashDirs = @("$HOME\.local\share\Trash")
#    Get-PSDrive -PSProvider FileSystem | ForEach-Object {
#        $driveTrash = "${_}:\.local\Trash"
#        if (Test-Path $driveTrash) {
#            $trashDirs += $driveTrash
#        }
#    }
#
#    foreach ($trashDir in $trashDirs) {
#        $filesDir = Join-Path $trashDir "files"
#        $infoDir = Join-Path $trashDir "info"
#
#        if (Test-Path $filesDir) {
#            Remove-Item -Path (Join-Path $filesDir "*") -Recurse -Force -ErrorAction SilentlyContinue
#        }
#        if (Test-Path $infoDir) {
#            Remove-Item -Path (Join-Path $infoDir "*") -Recurse -Force -ErrorAction SilentlyContinue
#        }
#    }
#
#    Write-Host "Trash emptied"
#}
#Remove-Alias -Name rm -Force
## Alias for better Linux compatibility
#Set-Alias -Name rm -Value trash-put
