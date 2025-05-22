
$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'exe'
  url           = 'https://github.com/runelite/launcher/releases/download/2.7.5/RuneLiteSetup32.exe'
  url64         = 'https://github.com/runelite/launcher/releases/download/2.7.5/RuneLiteSetup.exe'
  softwareName  = 'runelite*'
  checksum      = 'd3a64baef9186570eb7138eb8cf0278d45daac594c90e64c370bd4304f4efe1b'
  checksumType  = 'sha256'
  checksum64    = 'e2c0266da99e2c5adebaab31b946763f795e01841a6eeda66879fb9cbecd33f7'
  checksumType64= 'sha256'
  silentArgs    = '/VERYSILENT /SUPPRESSMSGBOXES'
}

Install-ChocolateyPackage @packageArgs
