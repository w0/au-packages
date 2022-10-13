$ErrorActionPreference = 'Stop'

$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'exe'
  url           = 'https://image.easyeda.com/files/easyeda-windows-ia32-6.5.19.exe'
  url64bit      = 'https://image.easyeda.com/files/easyeda-windows-x64-6.5.19.exe'

  softwareName  = 'easyeda*'

  checksum      = '5e3d53ab9ec3aaf213e651389af75cc99bc201e3544e5134e3c8bd9d8c0683ab'
  checksumType  = 'sha256'
  checksum64    = 'cdf6d8d1554bd9c3ae8e7f7feaff28649d95a33814b7cc30c983a726f93e7317'
  checksumType64= 'sha256'
  validExitCodes= @(0, 3010, 1641)
  silentArgs    = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
}

Install-ChocolateyPackage @packageArgs
