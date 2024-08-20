
$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'exe'
  url           = 'https://github.com/runelite/launcher/releases/download/2.7.2/RuneLiteSetup32.exe'
  url64         = 'https://github.com/runelite/launcher/releases/download/2.7.2/RuneLiteSetup.exe'
  softwareName  = 'runelite*'
  checksum      = 'a59d25303f7a051a82e5791b2d02119ba6bdc012fea63c016595564ddb364ab8'
  checksumType  = 'sha256'
  checksum64    = '9afded10f279f5920773f8c6a209088ba00a10c6fb37a2272d4e2c3cbe93830e'
  checksumType64= 'sha256'
  silentArgs    = '/VERYSILENT /SUPPRESSMSGBOXES'
}

Install-ChocolateyPackage @packageArgs
