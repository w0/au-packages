$ErrorActionPreference = 'Stop'

$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'exe'
  url           = 'https://image.easyeda.com/files/easyeda-windows-ia32-6.5.51.exe'
  url64bit      = 'https://image.easyeda.com/files/easyeda-windows-x64-6.5.51.exe'

  softwareName  = 'easyeda*'

  checksum      = 'd815039ed571c811c104b9505612980c3a31fdf56d8ec280c0fea24b82db7b76'
  checksumType  = 'sha256'
  checksum64    = 'bbd1f09d9f015e6388b0270d90ed18555244d92fdd3289e9392b9d7265d1817f'
  checksumType64= 'sha256'
  validExitCodes= @(0, 3010, 1641)
  silentArgs    = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
}

Install-ChocolateyPackage @packageArgs
