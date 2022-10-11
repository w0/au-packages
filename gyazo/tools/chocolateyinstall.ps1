
$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'exe'
  url           = 'https://files.gyazo.com/setup/Gyazo-4.3.4.exe'
  softwareName  = 'gyazo*'
  checksum      = '88a8d2674ecc837a71cca145bf0e4c6a6f8733a81ad1f31bf8c5661664498fcc'
  checksumType  = 'sha256'
  silentArgs   = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
  validExitCodes= @(0)
}

Install-ChocolateyPackage @packageArgs
