$InformationPreference = "Continue"

Import-Module oh-my-posh
Import-Module -Name Terminal-Icons
Import-Module -Name CompletionPredictor

Set-PoshPrompt -Theme $PSScriptRoot/omp/custom-theme.omp.json

$PSReadLineOptions = @{
    PredictionSource    = "HistoryAndPlugin"
    HistoryNoDuplicates = $true
    Colors              = @{
        Command                = "`e[93m"
        Comment                = "`e[32m"
        ContinuationPrompt     = "`e[37m"
        Emphasis               = "`e[96m"
        Error                  = "`e[91m"
        InlinePrediction       = "`e[38;5;238m"
        Keyword                = "`e[92m"
        ListPrediction         = "`e[33m"
        ListPredictionSelected = "`e[48;5;238m"
        Member                 = "`e[97m"
        Number                 = "`e[97m"
        Operator               = "`e[90m"
        Parameter              = "`e[90m"
        Selection              = "`e[30;47m"
        String                 = "`e[36m"
        Type                   = "`e[37m"
        Variable               = "`e[92m"
        Default                = "`e[37m"
    }
}
Set-PSReadLineOption @PSReadLineOptions
Set-PSReadLineKeyHandler -Chord "Ctrl+<" -Function ForwardWord
Set-PSReadLineKeyHandler -Chord "Tab" -Function TabCompleteNext
Set-PSReadLineKeyHandler -Chord "Ctrl+Spacebar" -Function MenuComplete

function home { Set-Location "~" }
function elevate { Start-Process -FilePath "pwsh" -Verb RunAs }

Write-Information "Finished loading default profile."

$localProfilePath = "$PSScriptRoot/Microsoft.PowerShell_profile.local.ps1"
if (Test-Path -Path $localProfilePath -PathType Leaf) {
    Invoke-Expression -Command ". $localProfilePath"
    Write-Information "Finished loading local profile."
}
