
$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'exe'
  url           = 'https://github.com/runelite/launcher/releases/download/2.4.2/RuneLiteSetup32.exe'
  url64         = 'https://github.com/runelite/launcher/releases/download/2.4.2/RuneLiteSetup.exe'
  softwareName  = 'runelite*'
  checksum      = 'c8320a73cda5597edd501427c572be219e4c6d2547a3d0f6773b8bb19370e510'
  checksumType  = 'sha256'
  checksum64    = '33246781b09d41d68655ec930877d55fd913c0def4f6d93dea617f96161328a6'
  checksumType64= 'sha256'
  silentArgs    = '/VERYSILENT /SUPPRESSMSGBOXES'
}

Install-ChocolateyPackage @packageArgs
