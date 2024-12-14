$ENV:STARSHIP_CONFIG = "C:\Users\W6\AppData\Roaming\starship\starship.toml"
Invoke-Expression (&starship init powershell)
Import-Module -Name Terminal-Icons
# MOTD Script
$motd = @"
s = search | i = install | u = upgrade | dl/dls = aria2 aliases
"@
fastfetch -c paleofetch -l Afterglow
Set-Alias edit "C:\Users\W6\AppData\Local\ecode\ecode.exe"

Write-Host $motd -ForegroundColor Yellow

# Function to download with multiple threads
function Download-WithThreads {
    param (
        [string]$url,
        [int]$maxThreads = 4  # Default to 4 threads
    )

    # Ensure aria2c is installed and available
    if (-not (Get-Command aria2c -ErrorAction SilentlyContinue)) {
        Write-Host "aria2c is not installed or not in the PATH." -ForegroundColor Red
        return
    }

    # Remove any accidental leading or trailing spaces from the URL
    $url = $url.Trim()

    # Set the download directory
    $downloadDir = "C:\Users\W6\Downloads"

    # Build the aria2c command for multiple threads, specifying the download directory
    $aria2Command = "aria2c --split=$maxThreads --dir=$downloadDir $url"

    # Execute the command
    Write-Host "Downloading from $url using $maxThreads threads to $downloadDir..." -ForegroundColor Green
    Invoke-Expression $aria2Command
}

# Function to download with a speed limit
function Download-WithLimit {
    param (
        [string]$url,
        [string]$speedLimit = "2M"  # Default speed limit of 2MB/s
    )

    # Ensure aria2c is installed and available
    if (-not (Get-Command aria2c -ErrorAction SilentlyContinue)) {
        Write-Host "aria2c is not installed or not in the PATH." -ForegroundColor Red
        return
    }

    # Remove any accidental leading or trailing spaces from the URL
    $url = $url.Trim()

    # Set the download directory
    $downloadDir = "C:\Users\W6\Downloads"

    # Build the aria2c command with a speed limit, specifying the download directory
    $aria2Command = "aria2c --max-download-limit=$speedLimit --dir=$downloadDir $url"

    # Execute the command
    Write-Host "Downloading from $url with a speed limit of $speedLimit to $downloadDir..." -ForegroundColor Green
    Invoke-Expression $aria2Command
}

# Set aliases for easier usage
Set-Alias dl Download-WithThreads
Set-Alias dls Download-WithLimit

function s {
    winget search $args
}
function i {
    winget install $args
}
function u {
    winget upgrade --all $args
}
function neofetchalias {
    fastfetch -c paleofetch -l Afterglow
}
Set-Alias neofetch neofetchalias

$ChocolateyProfile = "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
if (Test-Path($ChocolateyProfile)) {
  Import-Module "$ChocolateyProfile"
}
