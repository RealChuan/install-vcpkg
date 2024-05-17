################################################################################
##  File:  Install-Vcpkg.ps1
##  Desc:  Install vcpkg
################################################################################

param(
    [Parameter(Mandatory = $true)]
    [string]$RepoUrl,
    [Parameter(Mandatory = $true)]
    [string]$Branch
)

$InstallDir = 'C:\vcpkg'
$VcpkgExecPath = 'vcpkg.exe'

if (Test-Path -Path $InstallDir) {
    Write-Host "Removing existing VCPKG installation at $InstallDir"
    Remove-Item -Path $InstallDir -Recurse -Force
}

git clone -b $Branch --single-branch $RepoUrl $InstallDir -q

# Build and integrate vcpkg
Invoke-Expression "$InstallDir\bootstrap-vcpkg.bat"
if ($LASTEXITCODE -ne 0) {
    throw "vcpkg bootstrap failed with exit code $LASTEXITCODE"
}
Invoke-Expression "$InstallDir\$VcpkgExecPath integrate install"
if ($LASTEXITCODE -ne 0) {
    throw "vcpkg integration failed with exit code $LASTEXITCODE"
}

# Add vcpkg to system environment
Add-MachinePathItem $InstallDir
[Environment]::SetEnvironmentVariable("VCPKG_INSTALLATION_ROOT", $InstallDir, "Machine")
Update-Environment
