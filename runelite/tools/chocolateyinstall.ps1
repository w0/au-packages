
$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'exe'
  url           = 'https://github.com/runelite/launcher/releases/download/2.6.7/RuneLiteSetup32.exe'
  url64         = 'https://github.com/runelite/launcher/releases/download/2.6.7/RuneLiteSetup.exe'
  softwareName  = 'runelite*'
  checksum      = '3e79a0aa4d09ff8782e8ca7a30b4948abb935eacdce8b71d6263fb92e1d25e79'
  checksumType  = 'sha256'
  checksum64    = '6e388243311622782deaed24555fdcc89672c6d22b843245d8514fdaeee4586c'
  checksumType64= 'sha256'
  silentArgs    = '/VERYSILENT /SUPPRESSMSGBOXES'
}

Install-ChocolateyPackage @packageArgs
