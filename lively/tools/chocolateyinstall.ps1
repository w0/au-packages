
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
  url            = 'https://github.com/rocksdanister/lively/releases/download/v1.7.0.4/lively_setup_x86_full_v1704.exe'
  softwareName   = 'lively*'
  checksum       = 'd0a2ad431b600072dda90c462bf4cd00786bd3d1522ee1424b2061d6ba144af1'
  checksumType   = 'sha256'
  silentArgs     = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP- /ALLUSERS /NODEPENDENCIES /NOAUTOLAUNCH'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
