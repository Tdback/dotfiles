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

# Helpful functions
function Get-CmdletAlias {
    param (
        [String]$CmdletName
    )

    Get-Alias |
        Where-Object -FilterScript { $_.Definition -like "$CmdletName" } |
            Format-Table -Property Definition, Name -AutoSize
}

# Aliases
Set-Alias -Name "vi" -Value "/usr/bin/nvim"

