$ErrorActionPreference = 'Stop'

$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'exe'
  url           = 'https://image.easyeda.com/files/easyeda-windows-ia32-6.5.20.exe'
  url64bit      = 'https://image.easyeda.com/files/easyeda-windows-x64-6.5.20.exe'

  softwareName  = 'easyeda*'

  checksum      = '7a945721470ef29035da2536b0014f579303dab1315448f8fa17d0aa2c60a34a'
  checksumType  = 'sha256'
  checksum64    = 'da3b83e738677ec77f7c840c4bd122616efe6b7a51bdcfc3df79026705b8c620'
  checksumType64= 'sha256'
  validExitCodes= @(0, 3010, 1641)
  silentArgs    = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
}

Install-ChocolateyPackage @packageArgs
