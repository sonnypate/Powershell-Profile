# Default parameters
$PSDefaultParameterValues = @{
    # Show hidden files by default.
    "Get-ChildItem:Force" = $true
}

$CodePath = Join-Path -Path $env:USERPROFILE -ChildPath 'Documents\Code'

# Theming
Import-Module posh-git
Import-Module -Name Terminal-Icons
oh-my-posh init pwsh --config $CodePath/oh-my-posh/negligible-sp.omp.json | Invoke-Expression


# PSReadLine settings
Set-PSReadLineOption -PredictionSource HistoryAndPlugin
Set-PSReadLineOption -PredictionViewStyle ListView
Set-PSReadLineKeyHandler -Chord "Ctrl+f" -Function ForwardWord

# Tab Completion
# PowerShell parameter completion shim for the dotnet CLI
Register-ArgumentCompleter -Native -CommandName dotnet -ScriptBlock {
    param($wordToComplete, $commandAst, $cursorPosition)
        dotnet complete --position $cursorPosition "$commandAst" | ForEach-Object {
            [System.Management.Automation.CompletionResult]::new($_, $_, 'ParameterValue', $_)
        }
}

# Add pytest to user PATH
#$env:Path += ";$($env:USERPROFILE)\AppData\Roaming\Python\Python312\Scripts"