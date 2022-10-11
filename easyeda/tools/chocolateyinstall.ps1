$ErrorActionPreference = 'Stop'

$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'exe'
  url           = 'https://image.easyeda.com/files/easyeda-windows-ia32-6.5.17.exe'
  url64bit      = 'https://image.easyeda.com/files/easyeda-windows-x64-6.5.17.exe'

  softwareName  = 'easyeda*'

  checksum      = 'a17d9e65f8d8211f4293437cb44b7472a00b896915f869d79edb63ddefb4e508'
  checksumType  = 'sha256'
  checksum64    = '272a69102727297dc6cf51120a97d68073a1fd14be6c84c6a8dcbfb2d5809419'
  checksumType64= 'sha256'
  validExitCodes= @(0, 3010, 1641)
  silentArgs    = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
}

Install-ChocolateyPackage @packageArgs
