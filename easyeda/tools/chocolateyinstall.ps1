$ErrorActionPreference = 'Stop'

$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'exe'
  url           = 'https://image.easyeda.com/files/easyeda-windows-ia32-6.5.43.exe'
  url64bit      = 'https://image.easyeda.com/files/easyeda-windows-x64-6.5.43.exe'

  softwareName  = 'easyeda*'

  checksum      = '3a683e8576880b650e2e5e730de946f885af8505d52d146904da77793550dccd'
  checksumType  = 'sha256'
  checksum64    = '18d53db8487effaaf9f71dc0680f5b389060a877bc686797b1ebc2136c8bf74a'
  checksumType64= 'sha256'
  validExitCodes= @(0, 3010, 1641)
  silentArgs    = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
}

Install-ChocolateyPackage @packageArgs
