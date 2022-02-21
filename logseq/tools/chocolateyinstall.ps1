
$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'exe'
  file          = Get-Item $toolsDir\*.exe
  softwareName  = 'logseq*'
  validExitCodes= @(0)
}

Install-ChocolateyInstallPackage @packageArgs
