# Set the execution policy to allow script execution
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope Process -Force

# Install Scoop if not already installed
if (-not (Test-Path "$env:USERPROFILE\scoop")) {
    Write-Host "Installing Scoop..."

    # Download and run the Scoop installer
    Invoke-Expression (New-Object System.Net.WebClient).DownloadString('https://get.scoop.sh')
    
    Write-Host "Scoop installed successfully!"
} else {
    Write-Host "Scoop is already installed!"
}

# Add Scoop to the PATH for all future sessions
$envPath = [System.Environment]::GetEnvironmentVariable('Path', [System.EnvironmentVariableTarget]::User)
if ($envPath -notlike "*$env:USERPROFILE\scoop\shims*") {
    [System.Environment]::SetEnvironmentVariable('Path', "$envPath;$env:USERPROFILE\scoop\shims", [System.EnvironmentVariableTarget]::User)
    Write-Host "Scoop has been added to the PATH permanently!"
} else {
    Write-Host "Scoop is already in the PATH!"
}

# Update Scoop to the specified version or latest
$scoop_version = $env:SCOOP_VERSION -or 'latest'

Write-Host "Installing Scoop version: $scoop_version"

# Update or install the desired version
if ($scoop_version -ne 'latest') {
    scoop update scoop
    scoop install scoop
} else {
    scoop update
}

# Add necessary buckets
scoop bucket add main
scoop bucket add extras

Write-Host "Buckets 'main' and 'extras' have been added!"

Write-Host "Scoop installation and setup completed!"
