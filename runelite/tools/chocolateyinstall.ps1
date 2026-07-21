
$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'exe'
  url           = 'https://github.com/runelite/launcher/releases/download/2.8.0/RuneLiteSetup32.exe'
  url64         = 'https://github.com/runelite/launcher/releases/download/2.8.0/RuneLiteSetup.exe'
  softwareName  = 'runelite*'
  checksum      = '67ed1d024d25af8c6932bca54317beda0f93be9b6218f84a328635219a832d6c'
  checksumType  = 'sha256'
  checksum64    = 'aa2ca8b463105e14e40d64c893e6417dbcc2362a8c7be2163245688713aae16a'
  checksumType64= 'sha256'
  silentArgs    = '/VERYSILENT /SUPPRESSMSGBOXES'
}

Install-ChocolateyPackage @packageArgs
