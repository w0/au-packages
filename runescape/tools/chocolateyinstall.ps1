
$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'exe'
  url           = 'https://content.runescape.com/downloads/windows/RuneScape-Setup.exe'
  softwareName  = 'RuneScape Launcher*'
  checksum      = 'cce369aeea0021acc6cc383f7df68c4bd1b60d6087020115de9b1dcdb06a00c2'
  checksumType  = 'sha256'
  silentArgs    = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
  validExitCodes= @(0)
}

Install-ChocolateyPackage @packageArgs
