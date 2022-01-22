# Setup

## PowerShell

``` powershell
Install-Module 'oh-my-posh' -Scope CurrentUser -Force -AllowClobber
```

``` powershell
Install-Module -Name 'Terminal-Icons' -Repository PSGallery
```

## .bashrc Contents

``` bash
eval "$(oh-my-posh --init --shell bash --config ~/Documents/PowerShell/omp/custom-theme.omp.json)"
```
