
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
  url            = 'https://github.com/rocksdanister/lively/releases/download/v2.0.6.0/lively_setup_x86_full_v2060.exe'
  softwareName   = 'lively*'
  checksum       = '17851ab868ce7c0e27636851f2e200b63fe2cae4490dfa6143042c6ed8635338'
  checksumType   = 'sha256'
  silentArgs     = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP- /ALLUSERS /NODEPENDENCIES /NOAUTOLAUNCH'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
