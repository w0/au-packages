$ErrorActionPreference = 'Stop'

$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'exe'
  url           = 'https://image.easyeda.com/files/easyeda-windows-ia32-6.5.32.exe'
  url64bit      = 'https://image.easyeda.com/files/easyeda-windows-x64-6.5.32.exe'

  softwareName  = 'easyeda*'

  checksum      = 'b0593c32427f66e715b3b990ef467fbd795986c4b7cee603694dbf0fd2dd0242'
  checksumType  = 'sha256'
  checksum64    = '4bbaa254b6b6b74912cedb398f200edb2733de5bfad2be86bb63b3a3af1d0ecc'
  checksumType64= 'sha256'
  validExitCodes= @(0, 3010, 1641)
  silentArgs    = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
}

Install-ChocolateyPackage @packageArgs
