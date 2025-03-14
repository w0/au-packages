
$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'exe'
  url           = 'https://github.com/runelite/launcher/releases/download/2.7.4/RuneLiteSetup32.exe'
  url64         = 'https://github.com/runelite/launcher/releases/download/2.7.4/RuneLiteSetup.exe'
  softwareName  = 'runelite*'
  checksum      = '7bdd83fbfafca6e7f0f90c10c18de481dfdacbac99ec8d9237b8fab1f2420283'
  checksumType  = 'sha256'
  checksum64    = '8bde0a49f6e185008a78af6769d2ca05dd2f1573408bf89dfb0673261beef394'
  checksumType64= 'sha256'
  silentArgs    = '/VERYSILENT /SUPPRESSMSGBOXES'
}

Install-ChocolateyPackage @packageArgs
