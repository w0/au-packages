
$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'exe'
  url           = 'https://github.com/runelite/launcher/releases/download/2.4.5/RuneLiteSetup32.exe'
  url64         = 'https://github.com/runelite/launcher/releases/download/2.4.5/RuneLiteSetup.exe'
  softwareName  = 'runelite*'
  checksum      = '22bfaa1a3a7aa865feb69ed8a67a0842f629b08f5c1909c28855379f416fbe59'
  checksumType  = 'sha256'
  checksum64    = 'e59f50cfa21e2efe59cf827a8877f19e270b5c7b7a3ece562bd28ed70a4b657b'
  checksumType64= 'sha256'
  silentArgs    = '/VERYSILENT /SUPPRESSMSGBOXES'
}

Install-ChocolateyPackage @packageArgs
