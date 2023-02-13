
$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'exe'
  url           = 'https://github.com/runelite/launcher/releases/download/2.6.2/RuneLiteSetup32.exe'
  url64         = 'https://github.com/runelite/launcher/releases/download/2.6.2/RuneLiteSetup.exe'
  softwareName  = 'runelite*'
  checksum      = '156472f6da6f485546dfe5f62e1d1117eacb0eff84fcaaa6da432d7726232c75'
  checksumType  = 'sha256'
  checksum64    = 'a3981acd59824e7bed17f0ea6ab2977b0c6b359f963cee308fb29a4214a3528e'
  checksumType64= 'sha256'
  silentArgs    = '/VERYSILENT /SUPPRESSMSGBOXES'
}

Install-ChocolateyPackage @packageArgs
