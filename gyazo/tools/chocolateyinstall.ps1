
$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'exe'
  url           = 'https://files.gyazo.com/setup/Gyazo-5.8.7.exe'
  softwareName  = 'gyazo*'
  checksum      = '3b6f99e9f7820301c3a47203ab19b16dd4e282768c28010abcdcb77b3f8de7fa'
  checksumType  = 'sha256'
  silentArgs   = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
  validExitCodes= @(0)
}

Install-ChocolateyPackage @packageArgs
