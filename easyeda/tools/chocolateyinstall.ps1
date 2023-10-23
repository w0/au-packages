$ErrorActionPreference = 'Stop'

$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'exe'
  url           = 'https://image.easyeda.com/files/easyeda-windows-ia32-6.5.37.exe'
  url64bit      = 'https://image.easyeda.com/files/easyeda-windows-x64-6.5.37.exe'

  softwareName  = 'easyeda*'

  checksum      = '48e6f34f5ee3eecf5e88df7fdb477fe5bff15895374aa6022d9ba100b9103b47'
  checksumType  = 'sha256'
  checksum64    = '9ee1ae2e4965f27eb1bc069c2444d0e4303590ebece9ac575e577c20ff077ce0'
  checksumType64= 'sha256'
  validExitCodes= @(0, 3010, 1641)
  silentArgs    = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
}

Install-ChocolateyPackage @packageArgs
