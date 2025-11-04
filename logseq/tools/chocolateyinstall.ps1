
$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$softwareName = 'Logseq'
$version = '0.10.14'
if ($version -eq (Get-UninstallRegistryKey "$softwareName").DisplayVersion) {
  Write-Host "Logseq $version is already installed."
  return
}


$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'exe'
  url           = 'https://github.com/logseq/logseq/releases/download/0.10.14/Logseq-win-x64-0.10.14.exe'
  softwareName  = 'loqseq*'
  checksum      = ''
  checksumType  = 'sha256'
}


Install-ChocolateyInstallPackage @packageArgs
