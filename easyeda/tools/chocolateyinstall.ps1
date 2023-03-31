$ErrorActionPreference = 'Stop'

$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'exe'
  url           = 'https://image.easyeda.com/files/easyeda-windows-ia32-6.5.23.exe'
  url64bit      = 'https://image.easyeda.com/files/easyeda-windows-x64-6.5.23.exe'

  softwareName  = 'easyeda*'

  checksum      = 'f65bd7614a9b3bb8c3e22fd9688e847310e0a2292a7954347bf1c06085ef380b'
  checksumType  = 'sha256'
  checksum64    = '3407e54a37d2ceee5f0a78cc1c6ab2de96b6b47e9362a916506c8cbe2e15a9e1'
  checksumType64= 'sha256'
  validExitCodes= @(0, 3010, 1641)
  silentArgs    = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
}

Install-ChocolateyPackage @packageArgs
