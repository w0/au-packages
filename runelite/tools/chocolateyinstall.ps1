
$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"


$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'exe'
  url           = 'https://github.com//runelite/launcher/releases/download/2.1.5/RuneLiteSetup32.exe'
  url64         = 'https://github.com//runelite/launcher/releases/download/2.1.5/RuneLiteSetup.exe'

  softwareName  = 'runelite*'

  checksum      = 'b9433fe838e1afab3aee8cb76bafd0a40c187788e69c4ac992af3f0b9a6b1005'
  checksumType  = 'sha256'
  checksum64    = '7fd47358c891124ed820fa454ff68162df567fb33f569d8e38987f526635fa4d'
  checksumType64= 'sha256'

  silentArgs   = '/VERYSILENT /SUPPRESSMSGBOXES'
}

Install-ChocolateyPackage @packageArgs

