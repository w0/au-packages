$ErrorActionPreference = 'Stop'

$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'exe'
  url           = 'https://image.easyeda.com/files/easyeda-windows-ia32-6.5.46.exe'
  url64bit      = 'https://image.easyeda.com/files/easyeda-windows-x64-6.5.46.exe'

  softwareName  = 'easyeda*'

  checksum      = '34d57e18e102971e14f687faa71fde6930dcd8cd36b5467c2309153be2e6c29e'
  checksumType  = 'sha256'
  checksum64    = 'd563c66c899e28ccd31c73fb51593e9a1d514587bfe096309d34848ffa40f2c1'
  checksumType64= 'sha256'
  validExitCodes= @(0, 3010, 1641)
  silentArgs    = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
}

Install-ChocolateyPackage @packageArgs
