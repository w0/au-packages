
$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'exe'
  url           = 'https://content.runescape.com/downloads/windows/RuneScape-Setup.exe'
  softwareName  = 'RuneScape Launcher*'
  checksum      = '465d5fa01239de49f6a328738c8cb53a5c1f6927fcc81cc3bf43795380060a65'
  checksumType  = 'sha256'
  silentArgs    = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
  validExitCodes= @(0)
}

Install-ChocolateyPackage @packageArgs
