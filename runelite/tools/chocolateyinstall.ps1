
$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'exe'
  url           = 'https://github.com/runelite/launcher/releases/download/2.8.1/RuneLiteSetup32.exe'
  url64         = 'https://github.com/runelite/launcher/releases/download/2.8.1/RuneLiteSetup.exe'
  softwareName  = 'runelite*'
  checksum      = 'fcf27687487c89b70d681d8074e32381cc5c5a270b92596e34594cd4a3dd2dda'
  checksumType  = 'sha256'
  checksum64    = '9e4444d3588c2409b5dcb45504dce0be149e17e7412f85c318eb7c642f9059ef'
  checksumType64= 'sha256'
  silentArgs    = '/VERYSILENT /SUPPRESSMSGBOXES'
}

Install-ChocolateyPackage @packageArgs
