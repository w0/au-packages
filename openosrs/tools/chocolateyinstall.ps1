
$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://github.com/open-osrs/launcher/releases/download/2.2.0/OpenOSRSSetup32.exe'
$url64      = 'https://github.com/open-osrs/launcher/releases/download/2.2.0/OpenOSRSSetup64.exe'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'exe'
  url           = $url
  url64bit      = $url64

  softwareName  = 'openosrs*'

  checksum      = '95077C2E7CFE1C7C3996F8A9A0C7F3F83BA25F8C754996E398351283D2119925'
  checksumType  = 'sha256'
  checksum64    = '78FCE3AB441F3DF3F23D8986AD5F16C11FBA78AAFB34AF8031A5EED36405146A'
  checksumType64= 'sha256'

  silentArgs   = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
  validExitCodes= @(0)
}

Install-ChocolateyPackage @packageArgs
