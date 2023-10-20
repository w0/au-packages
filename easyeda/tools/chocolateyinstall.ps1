$ErrorActionPreference = 'Stop'

$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'exe'
  url           = 'https://image.easyeda.com/files/easyeda-windows-ia32-6.5.36.exe'
  url64bit      = 'https://image.easyeda.com/files/easyeda-windows-x64-6.5.36.exe'

  softwareName  = 'easyeda*'

  checksum      = '19a1ed52a029aedf41575bd06c0a75b355afcda0ef7a07795830348fbac59045'
  checksumType  = 'sha256'
  checksum64    = '1e78d2e748e5c491c2b1f56b82fecfdcd46834cf920fe8e55bfc41f1837daa74'
  checksumType64= 'sha256'
  validExitCodes= @(0, 3010, 1641)
  silentArgs    = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
}

Install-ChocolateyPackage @packageArgs
