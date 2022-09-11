
$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'exe'
  url           = 'https://github.com/runelite/launcher/releases/download/2.5.0/RuneLiteSetup32.exe'
  url64         = 'https://github.com/runelite/launcher/releases/download/2.5.0/RuneLiteSetup.exe'
  softwareName  = 'runelite*'
  checksum      = '8af26bcae69fe096342d3637625c5960796bc75ab30a431fe28b58891a1df209'
  checksumType  = 'sha256'
  checksum64    = 'ac76a2893fc98a39bd40d08604285bfe861560faf5b40904ac4d085701fd6d1f'
  checksumType64= 'sha256'
  silentArgs    = '/VERYSILENT /SUPPRESSMSGBOXES'
}

Install-ChocolateyPackage @packageArgs
