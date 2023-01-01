
$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'exe'
  url           = 'https://github.com/runelite/launcher/releases/download/2.6.0/RuneLiteSetup32.exe'
  url64         = 'https://github.com/runelite/launcher/releases/download/2.6.0/RuneLiteSetup.exe'
  softwareName  = 'runelite*'
  checksum      = '968062b1137b1877d2879ecff96e7489ca07d87115c5f12a344a098b7e4f4d90'
  checksumType  = 'sha256'
  checksum64    = '54b0ab10924c848bbc028fab6de607d7d49f58e954490f2688426df9e2fbe9f9'
  checksumType64= 'sha256'
  silentArgs    = '/VERYSILENT /SUPPRESSMSGBOXES'
}

Install-ChocolateyPackage @packageArgs
