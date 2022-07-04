
$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'exe'
  url           = 'https://content.runescape.com/downloads/windows/RuneScape-Setup.exe'
  softwareName  = 'RuneScape Launcher*'
  checksum      = '04614f67d4559eb25c94687458fda8c0ae532f05fe097e16a68bc6425a28d6bd'
  checksumType  = 'sha256'
  silentArgs    = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
  validExitCodes= @(0)
}

Install-ChocolateyPackage @packageArgs
