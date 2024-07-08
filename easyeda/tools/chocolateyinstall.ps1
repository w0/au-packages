$ErrorActionPreference = 'Stop'

$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'exe'
  url           = 'https://image.easyeda.com/files/easyeda-windows-ia32-6.5.44.exe'
  url64bit      = 'https://image.easyeda.com/files/easyeda-windows-x64-6.5.44.exe'

  softwareName  = 'easyeda*'

  checksum      = 'b5e6800547a1d4cef39ed80a99284511ba713c181d47ba0d0dd5a901699fa23a'
  checksumType  = 'sha256'
  checksum64    = '56a09223257c6b5d1bf15fe0271bc1137015a950f778cb445dacedc33a15e66b'
  checksumType64= 'sha256'
  validExitCodes= @(0, 3010, 1641)
  silentArgs    = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
}

Install-ChocolateyPackage @packageArgs
