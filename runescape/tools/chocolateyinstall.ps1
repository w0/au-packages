
$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'exe'
  url           = 'https://content.runescape.com/downloads/windows/RuneScape-Setup.exe'
  softwareName  = 'RuneScape Launcher*'
  checksum      = '34d2d7100822e122eeec5200b58dc8d8a0b01b3d46e46e0ddf6de854e04fa01d'
  checksumType  = 'sha256'
  silentArgs    = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
  validExitCodes= @(0)
}

Install-ChocolateyPackage @packageArgs
