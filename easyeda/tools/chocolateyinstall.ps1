$ErrorActionPreference = 'Stop'

$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'exe'
  url           = 'https://image.easyeda.com/files/easyeda-windows-ia32-6.5.15.exe'
  url64bit      = 'https://image.easyeda.com/files/easyeda-windows-x64-6.5.15.exe'

  softwareName  = 'easyeda*'

  checksum      = 'e91093632887ac5b351788cc7f6a79782d1c508676f25bce4e4ce98615c58b0f'
  checksumType  = 'sha256'
  checksum64    = 'c1386126345b21c3d61a4d102346ff14be6daed11e7cfe2ecd464cc40bd57d96'
  checksumType64= 'sha256'
  validExitCodes= @(0, 3010, 1641)
  silentArgs    = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
}

Install-ChocolateyPackage @packageArgs
