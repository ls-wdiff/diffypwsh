Prerequisites:

```
winget install Microsoft.PowerShell
winget install Starship.Starship
winget install Fastfetch-cli.Fastfetch
```
Open PowerShell 7
```
Install-Module -Name Terminal-Icons -Repository PSGallery
```
Run the `install-aria2.ps1` script

Open wt.exe and edit your `settings.json`

Edit all declared paths to reflect your own in $PROFILE ($HOME\Documents\Powershell\Microsoft.Powershell_profile.ps1)
Also modify line #9 `Set-Alias edit "C:\Users\W6\AppData\Local\ecode\ecode.exe"` to reflect your text editor

Download and install this font - https://github.com/ryanoasis/nerd-fonts/releases/download/v3.3.0/ShareTechMono.zip
