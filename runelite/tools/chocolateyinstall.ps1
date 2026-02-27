
$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'exe'
  url           = 'https://github.com/runelite/launcher/releases/download/2.7.7/RuneLiteSetup32.exe'
  url64         = 'https://github.com/runelite/launcher/releases/download/2.7.7/RuneLiteSetup.exe'
  softwareName  = 'runelite*'
  checksum      = '3661ab520eadc9880adce5f359db5d46580298893fb00cae0380c75b9647d773'
  checksumType  = 'sha256'
  checksum64    = '33fe6fd3ab19b9a16872214bedc914b44be78d15c0f78d8f440d7b1cbe9fad03'
  checksumType64= 'sha256'
  silentArgs    = '/VERYSILENT /SUPPRESSMSGBOXES'
}

Install-ChocolateyPackage @packageArgs
