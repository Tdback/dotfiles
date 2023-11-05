<#
    .SYNOPSIS
    A collection of aliases and functions to preload into any PowerShell
    session.

    .DESCRIPTION
    User profile for using PowerShell on Linux.

    .NOTES
    @author   : Tyler Dunneback (tylerdback@pm.me)
    @file     : Microsoft.PowerShell_profile.ps1
    @created  : Tue Oct 31 09:44:24 PM EDT 2023
    @modified : Wed Nov  1 05:52:18 PM EDT 2023

    .LINK
    GitHub Repo: https://github.com/Tdback/dotfiles
#>

function prompt {
    "`n$env:USER @ $([System.Net.Dns]::GetHostName()) in $env:PWD`n$('>' * ($NestedPromptLevel + 1)) "
}

# Helpful functions
function Get-CmdletAlias {
    param (
        [String]$CmdletName
    )

    Get-Alias |
        Where-Object -FilterScript { $_.Definition -like "$CmdletName" } |
            Format-Table -Property Definition, Name -AutoSize
}

function Get-IP {
    param ()

    if ($IsLinux -or $IsMacOS) {
        (((ifconfig |
            Select-String -Pattern "^\s+inet\s+1[^2][^7].*" |
                Out-String -NoNewline).TrimStart() -split " ")[1]).Trim()
        return
    }

    (((ipconfig.exe |
        Select-String -Pattern "^\s+IPv4.*" |
            Out-String -NoNewline).TrimStart() -split ":")[1]).Trim()
}

function Set-PreviousLocation {
    param ()

    Set-Location -Path $env:OLDPWD
}

# Aliases
Set-Alias -Name "vi" -Value "/usr/bin/nvim"

Set-Alias -Name "bd" -Value Set-PreviousLocation
