
$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'exe'
  url           = 'https://github.com/runelite/launcher/releases/download/2.6.3/RuneLiteSetup32.exe'
  url64         = 'https://github.com/runelite/launcher/releases/download/2.6.3/RuneLiteSetup.exe'
  softwareName  = 'runelite*'
  checksum      = '79365f76cd2db4cdcbb7afbdc0a722722bf098fbe1f5f2e92fa760b05f4a4807'
  checksumType  = 'sha256'
  checksum64    = '558515fbd1ea11585a5cb0f5aae7e8559399fd18ea28a22899035ba4a0b7e33b'
  checksumType64= 'sha256'
  silentArgs    = '/VERYSILENT /SUPPRESSMSGBOXES'
}

Install-ChocolateyPackage @packageArgs
