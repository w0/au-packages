
$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'exe'
  url           = 'https://github.com/runelite/launcher/releases/download/2.3.0/RuneLiteSetup32.exe'
  url64         = 'https://github.com/runelite/launcher/releases/download/2.3.0/RuneLiteSetup.exe'
  softwareName  = 'runelite*'
  checksum      = 'b3db5ebab93e8eb383eb742ec7fdbbaa1f464856760cf558bf7058b9b958e3f8'
  checksumType  = 'sha256'
  checksum64    = 'ac42fca09ec124763af89f810277c139de819300351d74dd6c4ccfeec6b0611e'
  checksumType64= 'sha256'
  silentArgs    = '/VERYSILENT /SUPPRESSMSGBOXES'
}

Install-ChocolateyPackage @packageArgs
