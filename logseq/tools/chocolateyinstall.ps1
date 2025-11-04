
$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$softwareName = 'Logseq'
$version = '0.10.13'
if ($version -eq (Get-UninstallRegistryKey "$softwareName").DisplayVersion) {
  Write-Host "Logseq $version is already installed."
  return
}


$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'exe'
  url           = ''
  softwareName  = 'loqseq*'
  checksum      = ''
  checksumType  = 'sha256'
}


Install-ChocolateyInstallPackage @packageArgs
