
$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'exe'
  url           = 'https://github.com/open-osrs/launcher/releases/download/3.0.0/OpenOSRSSetup32.exe'
  url64         = 'https://github.com/open-osrs/launcher/releases/download/3.0.0/OpenOSRSSetup64.exe'
  softwareName  = 'openosrs*'
  checksum      = '1951e1c9dc38816c91f5fddacc9f0b9dfb5b93ff1e7bf232342815fd0c3f3622'
  checksumType  = 'sha256'
  checksum64    = '4507e54e2005e245426bbb7445a759fe629884e7d11187a7a9da522e57f32bb7'
  checksumType64= 'sha256'
  silentArgs    = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
  validExitCodes= @(0)
}

Install-ChocolateyPackage @packageArgs
