
$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'exe'
  url           = 'https://files.gyazo.com/setup/Gyazo-5.9.exe'
  softwareName  = 'gyazo*'
  checksum      = '39f10448dd3d602e206f3a84aaf7e9df3a820ef16e12cdafaafd8f85e6d3d453'
  checksumType  = 'sha256'
  silentArgs   = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
  validExitCodes= @(0)
}

Install-ChocolateyPackage @packageArgs
