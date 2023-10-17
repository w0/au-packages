
$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'exe'
  url           = 'https://github.com/runelite/launcher/releases/download/2.6.9/RuneLiteSetup32.exe'
  url64         = 'https://github.com/runelite/launcher/releases/download/2.6.9/RuneLiteSetup.exe'
  softwareName  = 'runelite*'
  checksum      = '760fc22eb43880e80157f1deaab82c68d760c17ef4bad5ba897da5070b4375ea'
  checksumType  = 'sha256'
  checksum64    = '6b4991cb83fb8631b89fd0e46b14121e53e7088ec8def7962e1dad3afaa26720'
  checksumType64= 'sha256'
  silentArgs    = '/VERYSILENT /SUPPRESSMSGBOXES'
}

Install-ChocolateyPackage @packageArgs
