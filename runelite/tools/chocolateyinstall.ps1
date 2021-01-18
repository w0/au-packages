
$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'exe'
  url           = 'https://github.com/runelite/launcher/releases/download/2.1.6/RuneLiteSetup32.exe'
  url64         = 'https://github.com/runelite/launcher/releases/download/2.1.6/RuneLiteSetup.exe'

  softwareName  = 'runelite*'

  checksum      = '9ef5c38f08a38e15e5507cd08103edcd247726f57e8abada77de5850bf189488'
  checksumType  = 'sha256'
  checksum64    = 'fb854119feba42d7d458336c68fb5e957fc519c401de9c9070ee18cf4ea6fd8f'
  checksumType64= 'sha256'

  silentArgs   = '/VERYSILENT /SUPPRESSMSGBOXES'
}

Install-ChocolateyPackage @packageArgs
