$InformationPreference = "Continue"

Import-Module oh-my-posh
Import-Module -Name Terminal-Icons
Import-Module -Name CompletionPredictor

Set-PoshPrompt -Theme $PSScriptRoot/omp/custom-theme.omp.json
Set-PSReadLineOption -PredictionSource HistoryAndPlugin
Set-PSReadLineKeyHandler -Chord "Ctrl+f" -Function ForwardWord

function home { Set-Location "~" }
function elevate { Start-Process -FilePath "pwsh" -Verb RunAs }

Write-Information "Finished loading default profile."

$localProfilePath = "$PSScriptRoot/Microsoft.PowerShell_profile.local.ps1"
if (Test-Path -Path $localProfilePath -PathType Leaf) {
    Invoke-Expression -Command ". $localProfilePath"
    Write-Information "Finished loading local profile."
}
