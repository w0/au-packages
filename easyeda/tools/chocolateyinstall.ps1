$ErrorActionPreference = 'Stop'

$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'exe'
  url           = 'https://image.easyeda.com/files/easyeda-windows-ia32-6.5.40.exe'
  url64bit      = 'https://image.easyeda.com/files/easyeda-windows-x64-6.5.40.exe'

  softwareName  = 'easyeda*'

  checksum      = '428c0c07eee4636d7d81c6e0d6017570e0409c3b70ea44e0ff81dfe222b92e56'
  checksumType  = 'sha256'
  checksum64    = '5315a5e4bc76aee2a5918281e84bee79ae502a58eca83e1611042d8d51c3fbaf'
  checksumType64= 'sha256'
  validExitCodes= @(0, 3010, 1641)
  silentArgs    = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
}

Install-ChocolateyPackage @packageArgs
