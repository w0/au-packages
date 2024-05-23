
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
  url            = 'https://github.com/rocksdanister/lively/releases/download/v2.1.0.4/lively_setup_x86_full_v2104.exe'
  softwareName   = 'lively*'
  checksum       = 'f928a183652980fa4475e03887ffa1e5e1e229c98806d0737df6a12085ffd951'
  checksumType   = 'sha256'
  silentArgs     = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP- /ALLUSERS /NODEPENDENCIES /NOAUTOLAUNCH'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
