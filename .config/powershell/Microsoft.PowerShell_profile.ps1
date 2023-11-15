<#
    .SYNOPSIS
    Custom settings to preload into every PowerShell session.

    .DESCRIPTION
    User profile for PowerShell Core on Linux or MacOS, with some capatibility for Windows.

    .NOTES
    @author   : Tyler Dunneback (tylerdback@pm.me)
    @file     : Microsoft.PowerShell_profile.ps1
    @created  : Tue Oct 31 09:44:24 PM EDT 2023

    .LINK
    GitHub Repo: https://github.com/Tdback/dotfiles
#>

# Shortened the name
Set-Alias -Name "vi" -Value "/usr/bin/nvim"

# Use PowerShell's sleep cmdlet instead of Linux's sleep utility for more options
Set-Alias -Name "sleep" -Value Start-Sleep

# Quickly edit and update PowerShell profile
function Edit-Profile { vi ~/.config/powershell/Microsoft.PowerShell_profile.ps1 }

function Update-Profile {
    [CmdletBinding()]
    param ()

    . $profile.CurrentUserCurrentHost
    Write-Verbose "Updated PowerShell profile for user $($env:USER)"
}

Set-Alias -Name "edp" -Value Edit-Profile
Set-Alias -Name "udp" -Value Update-Profile

function Get-CmdletAlias {
    param (
        [string]$CmdletName
    )

    Get-Alias |
        Where-Object -FilterScript { $_.Definition -like "$CmdletName" } |
            Format-Table -Property Definition, Name -AutoSize
}

function Get-IP {
    param ()

    if ($IsWindows) {
        (((ipconfig.exe |
            Select-String -Pattern "^\s+IPv4.*" |
               Out-String -NoNewline).TrimStart() -split ":")[1]).Trim()
        return
    }

    (((ifconfig |
        Select-String -Pattern "^\s+inet\s+1[^2][^7].*" |
            Out-String -NoNewline).TrimStart() -split " ")[1]).Trim()
}

function Get-Count {
    param (
        [string]$Cmd
    )

    # Call me with care...
    (Invoke-Expression $Cmd | Measure-Object).Count
}

