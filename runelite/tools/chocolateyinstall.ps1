
$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'exe'
  url           = 'https://github.com/runelite/launcher/releases/download/2.7.1/RuneLiteSetup32.exe'
  url64         = 'https://github.com/runelite/launcher/releases/download/2.7.1/RuneLiteSetup.exe'
  softwareName  = 'runelite*'
  checksum      = 'cc25b5ff6a11a5f89cbfddc8deda848285e6a8bc7332ab8c45a1f84c980f2884'
  checksumType  = 'sha256'
  checksum64    = '5cf7a2ae793ac3ea1cd33f5952575f7ac7cf6c548d1011ba08116e518472645b'
  checksumType64= 'sha256'
  silentArgs    = '/VERYSILENT /SUPPRESSMSGBOXES'
}

Install-ChocolateyPackage @packageArgs
