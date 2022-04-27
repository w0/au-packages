
$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$MinBuildSupported = '18362'
$CurrentBuild      = [System.Environment]::OSVersion.Version.Build

if ( $CurrentBuild -lt $MinBuildSupported ) {
  Write-Output ('Unsupported build of Windows. Minimum supported build is {0}. Please update to avoid errors.' -f $MinBuildSupported)
}

Get-Process 'Lively*' | % {
  Write-Output ('Closing: {0}' -f $_.ProcessName)
  Stop-Process -InputObject $_ -Force
}

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  unzipLocation  = $toolsDir
  fileType       = 'exe'
  url            = 'https://github.com/rocksdanister/lively/releases/download/v1.7.5.2/lively_setup_x86_full_v1752.exe'
  softwareName   = 'lively*'
  checksum       = '9313ceff2d9aadbcdf55813d0572f09c8e3c01b57739e2361888ea3ea320b347'
  checksumType   = 'sha256'
  silentArgs     = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP- /ALLUSERS /NODEPENDENCIES /NOAUTOLAUNCH'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
