
$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"


$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'exe'
  url           = 'https://github.com//runelite/launcher/releases/download/2.1.0/RuneLiteSetup32.exe'
  url64         = 'https://github.com//runelite/launcher/releases/download/2.1.0/RuneLiteSetup.exe'

  softwareName  = 'runelite*'

  checksum      = '0789dc5e30ed98ae58a913ac5e7bc6f092e4d058720b7d222772c5dee3f8fabd'
  checksumType  = 'sha256'
  checksum64    = 'b5ef3eb51b0c98c98c2b9252f1945d453dba974c6946a1296c7fcc60b2739cfa'
  checksumType64= 'sha256'

  silentArgs   = '/VERYSILENT /SUPPRESSMSGBOXES'
}

Install-ChocolateyPackage @packageArgs

