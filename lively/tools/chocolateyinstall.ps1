
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
  url            = 'https://github.com/rocksdanister/lively/releases/download/v2.0.4.0/lively_setup_x86_full_v2040.exe'
  softwareName   = 'lively*'
  checksum       = 'f9146eda6fc65629ffb674f0ec11d461ad02617a255e94d9b01ad6b9db368e67'
  checksumType   = 'sha256'
  silentArgs     = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP- /ALLUSERS /NODEPENDENCIES /NOAUTOLAUNCH'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
