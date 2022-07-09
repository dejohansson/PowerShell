# Setup

## PowerShell

Install and use a [font with glyph support](https://www.nerdfonts.com/font-downloads) in the terminal.

``` powershell
Install-Module "oh-my-posh" -Scope CurrentUser -AllowClobber -Force -Repository PSGallery
```

``` powershell
Install-Module "Terminal-Icons" -Force -Repository PSGallery
```

``` powershell
Install-Module PSReadLine -Force -Repository PSGallery
```

``` powershell
Install-Module CompletionPredictor -Force -Repository PSGallery
```

## .bashrc Contents

``` bash
eval "$(oh-my-posh --init --shell bash --config ~/Documents/PowerShell/omp/custom-theme.omp.json)"
```
