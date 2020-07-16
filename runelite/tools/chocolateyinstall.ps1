
$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"


$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'exe'
  url           = 'https://github.com//runelite/launcher/releases/download/2.1.3/RuneLiteSetup32.exe'
  url64         = 'https://github.com//runelite/launcher/releases/download/2.1.3/RuneLiteSetup.exe'

  softwareName  = 'runelite*'

  checksum      = '3d5592a345c124d6ea4a6e87a110d29e950b3267b4ace424cbfec54a6bc8eab3'
  checksumType  = 'sha256'
  checksum64    = 'e495f9518e8b44bdd16b6bf4ddda6bf43930fbc4bbd0b0b9190d86f6794c10a4'
  checksumType64= 'sha256'

  silentArgs   = '/VERYSILENT /SUPPRESSMSGBOXES'
}

Install-ChocolateyPackage @packageArgs

