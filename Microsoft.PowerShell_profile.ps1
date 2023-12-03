# Default parameters
$PSDefaultParameterValues = @{
    # Show hidden files by default.
    "Get-ChildItem:Force" = $true
}

$CodePath = Join-Path -Path $env:USERPROFILE -ChildPath 'Documents\Code'

# Theming
Import-Module posh-git
Import-Module -Name Terminal-Icons
oh-my-posh init pwsh --config $env:POSH_THEMES_PATH/emodipt-extend.omp.json | Invoke-Expression

# PSReadLine settings
Set-PSReadLineOption -PredictionSource HistoryAndPlugin
Set-PSReadLineOption -PredictionViewStyle ListView
Set-PSReadLineKeyHandler -Chord "Ctrl+f" -Function ForwardWord

# Add pytest to user PATH
$env:Path += ";$($env:USERPROFILE)\AppData\Roaming\Python\Python312\Scripts"