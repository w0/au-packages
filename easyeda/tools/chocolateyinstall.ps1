$ErrorActionPreference = 'Stop'

$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'exe'
  url           = 'https://image.easyeda.com/files/easyeda-windows-ia32-6.5.61.exe'
  url64bit      = 'https://image.easyeda.com/files/easyeda-windows-x64-6.5.61.exe'

  softwareName  = 'easyeda*'

  checksum      = 'a26b25200820494481b5112d47c9d631bbd7e82846f052b3142709b5cdad8597'
  checksumType  = 'sha256'
  checksum64    = '7783a1d0b2f41d269c1eb88ec8da85ba683711ff374702d84fbb85a6ead0b83d'
  checksumType64= 'sha256'
  validExitCodes= @(0, 3010, 1641)
  silentArgs    = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
}

Install-ChocolateyPackage @packageArgs
