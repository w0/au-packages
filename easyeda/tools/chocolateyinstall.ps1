$ErrorActionPreference = 'Stop'

$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'exe'
  url           = 'https://image.easyeda.com/files/easyeda-windows-ia32-6.5.22.exe'
  url64bit      = 'https://image.easyeda.com/files/easyeda-windows-x64-6.5.22.exe'

  softwareName  = 'easyeda*'

  checksum      = 'b7705c9a3477feb5680e148f61ea793887a51f6560a63f420335afc2432b7f99'
  checksumType  = 'sha256'
  checksum64    = '48c1938dff4512a1fb70bfbfbe895d721b28e47c845549aa74416ee0dc31d075'
  checksumType64= 'sha256'
  validExitCodes= @(0, 3010, 1641)
  silentArgs    = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
}

Install-ChocolateyPackage @packageArgs
