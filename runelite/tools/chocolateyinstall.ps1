
$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'exe'
  url           = 'https://github.com/runelite/launcher/releases/download/2.6.4/RuneLiteSetup32.exe'
  url64         = 'https://github.com/runelite/launcher/releases/download/2.6.4/RuneLiteSetup.exe'
  softwareName  = 'runelite*'
  checksum      = '6655c149fa86d0750b0e66b575560f97e6e5b04f734c8d0e899457f694e3ff50'
  checksumType  = 'sha256'
  checksum64    = 'ae1ef12e6a820c5a94c1b834246def883515e9669175a6a94e47aae35e2ca7ab'
  checksumType64= 'sha256'
  silentArgs    = '/VERYSILENT /SUPPRESSMSGBOXES'
}

Install-ChocolateyPackage @packageArgs
