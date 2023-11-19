
$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'exe'
  url           = 'https://github.com/runelite/launcher/releases/download/2.6.10/RuneLiteSetup32.exe'
  url64         = 'https://github.com/runelite/launcher/releases/download/2.6.10/RuneLiteSetup.exe'
  softwareName  = 'runelite*'
  checksum      = '4b3293e69c7e82e91be85c71e0d4eab072222aa3e46c01d2a52789aac355c604'
  checksumType  = 'sha256'
  checksum64    = '837370201e436f04cf94972757e18c294b05c30fd9d39aa0dd50513df6355af6'
  checksumType64= 'sha256'
  silentArgs    = '/VERYSILENT /SUPPRESSMSGBOXES'
}

Install-ChocolateyPackage @packageArgs
