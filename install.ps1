Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope Process -Force
Invoke-Expression (New-Object System.Net.WebClient).DownloadString('https://get.scoop.sh')
scoop bucket add main
scoop bucket add extras
Write-Host "Scoop installation completed!"
