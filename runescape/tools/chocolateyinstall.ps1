
$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'exe'
  url           = 'https://content.runescape.com/downloads/windows/RuneScape-Setup.exe'
  softwareName  = 'RuneScape Launcher*'
  checksum      = '91c388123a472d229640dbd6e7418924b8f04ccfed04284846c0deffbd0ef5ed'
  checksumType  = 'sha256'
  silentArgs    = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
  validExitCodes= @(0)
}

Install-ChocolateyPackage @packageArgs
