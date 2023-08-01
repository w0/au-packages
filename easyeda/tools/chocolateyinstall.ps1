$ErrorActionPreference = 'Stop'

$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'exe'
  url           = 'https://image.easyeda.com/files/easyeda-windows-ia32-6.5.34.exe'
  url64bit      = 'https://image.easyeda.com/files/easyeda-windows-x64-6.5.34.exe'

  softwareName  = 'easyeda*'

  checksum      = 'a9080d4b20977c240a439ccb81487622749a213f3c22a6b09e58b041e2921662'
  checksumType  = 'sha256'
  checksum64    = 'b6879a2b576ca6767ef71fa62adb86a7150df8d81f0cfa6d3b36be61e67456f5'
  checksumType64= 'sha256'
  validExitCodes= @(0, 3010, 1641)
  silentArgs    = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
}

Install-ChocolateyPackage @packageArgs
