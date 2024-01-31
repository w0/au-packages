
$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'exe'
  url           = 'https://github.com/runelite/launcher/releases/download/2.6.13/RuneLiteSetup32.exe'
  url64         = 'https://github.com/runelite/launcher/releases/download/2.6.13/RuneLiteSetup.exe'
  softwareName  = 'runelite*'
  checksum      = 'ee9b11461b5aac6c134dcd468708bf488245fe89f8fdf72682c97179938b7abb'
  checksumType  = 'sha256'
  checksum64    = '63a5a642080d78f063e6a7fecf2ec972227c7308fc6864c87bc106bde2cc7edb'
  checksumType64= 'sha256'
  silentArgs    = '/VERYSILENT /SUPPRESSMSGBOXES'
}

Install-ChocolateyPackage @packageArgs
