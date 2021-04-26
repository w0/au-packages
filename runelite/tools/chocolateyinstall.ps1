
$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'exe'
  url           = 'https://github.com/runelite/launcher/releases/download/2.1.7/RuneLiteSetup32.exe'
  url64         = 'https://github.com/runelite/launcher/releases/download/2.1.7/RuneLiteSetup.exe'

  softwareName  = 'runelite*'

  checksum      = '514ab6a26f0f575ecaad66e9db42a9dee4a939e544feb3746c6eb5a9970f7738'
  checksumType  = 'sha256'
  checksum64    = '5e3d005b3ee96fd45a28f911b0e34db8fdaf39f9bf3070dfc8fc854d7659e779'
  checksumType64= 'sha256'

  silentArgs   = '/VERYSILENT /SUPPRESSMSGBOXES'
}

Install-ChocolateyPackage @packageArgs
