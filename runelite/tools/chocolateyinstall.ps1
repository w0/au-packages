
$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'exe'
  url           = 'https://github.com/runelite/launcher/releases/download/2.2.0/RuneLiteSetup32.exe'
  url64         = 'https://github.com/runelite/launcher/releases/download/2.2.0/RuneLiteSetup.exe'
  softwareName  = 'runelite*'
  checksum      = '0d5bcbef45179b905789012d1ee58d267b41e46f121af304cb6e072a74402d63'
  checksumType  = 'sha256'
  checksum64    = 'cb5616f013b2c852a8eb6925db178c958316828f9dd6d20b3f5abefbba456d7f'
  checksumType64= 'sha256'
  silentArgs    = '/VERYSILENT /SUPPRESSMSGBOXES'
}

Install-ChocolateyPackage @packageArgs
