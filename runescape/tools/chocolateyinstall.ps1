
$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://content.runescape.com/downloads/windows/RuneScape-Setup.exe'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'exe'
  url           = $url

  softwareName  = 'RuneScape Launcher*'

  checksum      = '77BF24BAB5BF932E95644D7FE7BA6A56F293E941D20D7FD1620125CC97DB62E2'
  checksumType  = 'sha256'

  silentArgs   = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
  validExitCodes= @(0)
}

Install-ChocolateyPackage @packageArgs
