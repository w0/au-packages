
$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url      = 'https://github.com/rocksdanister/lively/releases/download/v1.2.0.4/lively_setup_x86_full_v1204.exe'

$MinBuildSupported = '18362'
$CurrentBuild      = [System.Environment]::OSVersion.Version.Build

if ( $CurrentBuild -lt $MinBuildSupported ) {
  
  Write-Output 'Unsupported build of Windows. Minimum supported build is {0}. Please update to avoid errors.' -f $MinBuildSupported

}

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  unzipLocation  = $toolsDir
  fileType       = 'exe'
  url            = $url

  softwareName   = 'lively*'

  checksum       = 'd69df66a3435437a4f48ee3da2dbb2792228d5f0df93e140749a5e282c3eaa68'
  checksumType   = 'sha256'

  silentArgs     = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP- /ALLUSERS /NODEPENDENCIES /NOAUTOLAUNCH'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
