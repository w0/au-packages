
$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'exe'
  url           = 'https://github.com/open-osrs/launcher/releases/download/2.2.0/OpenOSRSSetup32.exe'
  url64         = 'https://github.com/open-osrs/launcher/releases/download/2.2.0/OpenOSRSSetup64.exe'
  softwareName  = 'openosrs*'
  checksum      = '95077c2e7cfe1c7c3996f8a9a0c7f3f83ba25f8c754996e398351283d2119925'
  checksumType  = 'sha256'
  checksum64    = '78fce3ab441f3df3f23d8986ad5f16c11fba78aafb34af8031a5eed36405146a'
  checksumType64= 'sha256'
  silentArgs    = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
  validExitCodes= @(0)
}

Install-ChocolateyPackage @packageArgs
