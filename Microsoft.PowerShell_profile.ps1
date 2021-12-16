Import-Module oh-my-posh
Import-Module -Name Terminal-Icons

#tonybaloney #craver #bubbles #powerline #lambda #powerlevel10k_lean
Set-PoshPrompt -Theme ~/Documents/PowerShell/omp/custom-theme.omp.json

function ws { Set-Location "C:\Workspace\" }
