$InformationPreference = "Continue"

Import-Module oh-my-posh
Import-Module -Name Terminal-Icons
Import-Module -Name CompletionPredictor

Set-PoshPrompt -Theme $PSScriptRoot/omp/custom-theme.omp.json

$PSReadLineOptions = @{
    PredictionSource    = "HistoryAndPlugin"
    HistoryNoDuplicates = $true
    Colors              = @{
        Command            = "`e[93m"
        Number             = "`e[97m"
        Member             = "`e[97m"
        Operator           = "`e[90m"
        Type               = "`e[37m"
        Variable           = "`e[92m"
        Parameter          = "`e[90m"
        ContinuationPrompt = "`e[37m"
        Default            = "`e[37m"
    }
}
Set-PSReadLineOption @PSReadLineOptions
Set-PSReadLineKeyHandler -Chord "Ctrl+f" -Function ForwardWord

function home { Set-Location "~" }
function elevate { Start-Process -FilePath "pwsh" -Verb RunAs }

Write-Information "Finished loading default profile."

$localProfilePath = "$PSScriptRoot/Microsoft.PowerShell_profile.local.ps1"
if (Test-Path -Path $localProfilePath -PathType Leaf) {
    Invoke-Expression -Command ". $localProfilePath"
    Write-Information "Finished loading local profile."
}
