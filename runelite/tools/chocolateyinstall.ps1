
$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'exe'
  url           = 'https://github.com/runelite/launcher/releases/download/2.4.0/RuneLiteSetup32.exe'
  url64         = 'https://github.com/runelite/launcher/releases/download/2.4.0/RuneLiteSetup.exe'
  softwareName  = 'runelite*'
  checksum      = '64b494a1efc1d5c32d93450a309234248a8f8af297263b431f3150e94a55597d'
  checksumType  = 'sha256'
  checksum64    = '9f34837c4155660564d05d9e085534480ccc551ff5d31e9f9b8ca205ae083a38'
  checksumType64= 'sha256'
  silentArgs    = '/VERYSILENT /SUPPRESSMSGBOXES'
}

Install-ChocolateyPackage @packageArgs
