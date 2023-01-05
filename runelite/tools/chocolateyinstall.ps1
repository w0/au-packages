
$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'exe'
  url           = 'https://github.com/runelite/launcher/releases/download/2.6.1/RuneLiteSetup32.exe'
  url64         = 'https://github.com/runelite/launcher/releases/download/2.6.1/RuneLiteSetup.exe'
  softwareName  = 'runelite*'
  checksum      = 'e1e80469ffba23013bf44dcedc81bea78b32626f64adb91ae5943146354933ba'
  checksumType  = 'sha256'
  checksum64    = '71273283cceb6b2a22d087264c8dd2dc11d044544190513bd2e4601f21a8264b'
  checksumType64= 'sha256'
  silentArgs    = '/VERYSILENT /SUPPRESSMSGBOXES'
}

Install-ChocolateyPackage @packageArgs
