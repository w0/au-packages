
$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$softwareName = 'Logseq'
$version = '0.9.19'
if ($version -eq (Get-UninstallRegistryKey "$softwareName").DisplayVersion) {
  Write-Host "Logseq $version is already installed."
  return
}

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'exe'
  file          = Get-Item $toolsDir\*.exe
  softwareName  = 'logseq*'
  validExitCodes= @(0)
}

Install-ChocolateyInstallPackage @packageArgs
