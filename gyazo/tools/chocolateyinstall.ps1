
$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'exe'
  url           = 'https://files.gyazo.com/setup/Gyazo-4.5.exe'
  softwareName  = 'gyazo*'
  checksum      = 'fd60bcebfc6abf4bf30fec14ae2750f81c1ecd59cb85261aa2c674b8c8faaffc'
  checksumType  = 'sha256'
  silentArgs   = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
  validExitCodes= @(0)
}

Install-ChocolateyPackage @packageArgs
