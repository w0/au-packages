$ErrorActionPreference = 'Stop'

$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'exe'
  url           = 'https://image.easyeda.com/files/easyeda-windows-ia32-6.5.29.exe'
  url64bit      = 'https://image.easyeda.com/files/easyeda-windows-x64-6.5.29.exe'

  softwareName  = 'easyeda*'

  checksum      = '6b7fe7a9f7240168cccfc31e9a488b03b2656ae585a738660865e2ccccb1105f'
  checksumType  = 'sha256'
  checksum64    = '99af475da83eefa4f0fe6231a570de6262a57eacc045cb3ee37331606d09a76e'
  checksumType64= 'sha256'
  validExitCodes= @(0, 3010, 1641)
  silentArgs    = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
}

Install-ChocolateyPackage @packageArgs
