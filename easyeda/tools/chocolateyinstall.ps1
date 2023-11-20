$ErrorActionPreference = 'Stop'

$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'exe'
  url           = 'https://image.easyeda.com/files/easyeda-windows-ia32-6.5.39.exe'
  url64bit      = 'https://image.easyeda.com/files/easyeda-windows-x64-6.5.39.exe'

  softwareName  = 'easyeda*'

  checksum      = '9658ffe2d04c4f94e1f33c326052816494af014ee9d84f42a52a29a7f3743eff'
  checksumType  = 'sha256'
  checksum64    = '763e709d87eece6704fc43f8f7121f27ee8a661e895af55248db891e5e123036'
  checksumType64= 'sha256'
  validExitCodes= @(0, 3010, 1641)
  silentArgs    = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
}

Install-ChocolateyPackage @packageArgs
