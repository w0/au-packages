
$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'exe'
  url           = 'https://github.com/runelite/launcher/releases/download/2.4.4/RuneLiteSetup32.exe'
  url64         = 'https://github.com/runelite/launcher/releases/download/2.4.4/RuneLiteSetup.exe'
  softwareName  = 'runelite*'
  checksum      = '30421702cfadd8454a46d52602068893e9bee2f89221740f13ef7ff1dafe0e90'
  checksumType  = 'sha256'
  checksum64    = 'c0d1015291046198e3ca92e61aaa04ccd426a56e9d73013e8c21fe71729a65d8'
  checksumType64= 'sha256'
  silentArgs    = '/VERYSILENT /SUPPRESSMSGBOXES'
}

Install-ChocolateyPackage @packageArgs
