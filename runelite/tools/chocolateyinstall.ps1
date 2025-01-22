
$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'exe'
  url           = 'https://github.com/runelite/launcher/releases/download/2.7.3/RuneLiteSetup32.exe'
  url64         = 'https://github.com/runelite/launcher/releases/download/2.7.3/RuneLiteSetup.exe'
  softwareName  = 'runelite*'
  checksum      = '144c67cb4c4db16d9cf9454fa63f309b4873dd9ddb3501a6d31269a03985c961'
  checksumType  = 'sha256'
  checksum64    = '6d1e5bdfe34e2c4028cebbe75e90f59a3f9c160511b6566e60c8183d58b4953a'
  checksumType64= 'sha256'
  silentArgs    = '/VERYSILENT /SUPPRESSMSGBOXES'
}

Install-ChocolateyPackage @packageArgs
