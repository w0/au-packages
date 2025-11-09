
$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'exe'
  url           = 'https://github.com/runelite/launcher/releases/download/2.7.6/RuneLiteSetup32.exe'
  url64         = 'https://github.com/runelite/launcher/releases/download/2.7.6/RuneLiteSetup.exe'
  softwareName  = 'runelite*'
  checksum      = '8ba4a39acb657d82040ffcde78b865a079ae713c8099b1ecc8ffccfd62fe40f5'
  checksumType  = 'sha256'
  checksum64    = 'dfe5d64e4a5a0a743889675ede5964f9fea35bcab2168b26c3b046011cf30e38'
  checksumType64= 'sha256'
  silentArgs    = '/VERYSILENT /SUPPRESSMSGBOXES'
}

Install-ChocolateyPackage @packageArgs
