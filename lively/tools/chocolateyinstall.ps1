
$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://github.com/rocksdanister/lively/releases/download/v1.1.8.0/lively_setup_x86_full_v1180.exe'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'exe'
  url           = $url

  softwareName  = 'lively*'

  checksum      = 'b9faf8638e178e98cdec421c869203255b832f1f17c5d6402db7ed69bb00d1fe'
  checksumType  = 'sha256'

  silentArgs   = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP- /NODEPENDENCIES /NOAUTOLAUNCH'
  validExitCodes= @(0)
}

Install-ChocolateyPackage @packageArgs
