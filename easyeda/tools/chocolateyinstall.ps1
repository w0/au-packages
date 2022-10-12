$ErrorActionPreference = 'Stop'

$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'exe'
  url           = 'https://image.easyeda.com/files/easyeda-windows-ia32-6.5.18.exe'
  url64bit      = 'https://image.easyeda.com/files/easyeda-windows-x64-6.5.18.exe'

  softwareName  = 'easyeda*'

  checksum      = '5c402b590befadc2a427752d8148d00c7f4bc051e497aaaef50adb71eea0e747'
  checksumType  = 'sha256'
  checksum64    = 'a4733bfa3d488490cdc73e62deff6f452cde08f297d20542dda5e8bd00135b8d'
  checksumType64= 'sha256'
  validExitCodes= @(0, 3010, 1641)
  silentArgs    = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
}

Install-ChocolateyPackage @packageArgs
