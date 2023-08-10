
$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'exe'
  url           = 'https://github.com/runelite/launcher/releases/download/2.6.8/RuneLiteSetup32.exe'
  url64         = 'https://github.com/runelite/launcher/releases/download/2.6.8/RuneLiteSetup.exe'
  softwareName  = 'runelite*'
  checksum      = '1d889b01eb4e93b3fd427316769014fc2483ebd8bd3eb2a2624ff02aa46b55de'
  checksumType  = 'sha256'
  checksum64    = 'c964d9400e616b5b61069c6a27573c93a83d9de8cbbb5094d69f2ee2dd3a56ab'
  checksumType64= 'sha256'
  silentArgs    = '/VERYSILENT /SUPPRESSMSGBOXES'
}

Install-ChocolateyPackage @packageArgs
