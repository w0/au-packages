
$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$softwareName = 'Logseq'
$version = '0.10.14.20251104'
if ($version -eq (Get-UninstallRegistryKey "$softwareName").DisplayVersion) {
  Write-Host "Logseq $version is already installed."
  return
}


$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'exe'
  url64         = 'https://github.com/logseq/logseq/releases/download/0.10.14/Logseq-win-x64-0.10.14.exe'
  softwareName  = 'loqseq*'
  checksum64    = 'b77080300733e3cd693c46883c59a12025b1ec8ccaf76e1eadb016ee1f293299'
  checksumType64= 'sha256'
}

Install-ChocolateyPackage  @packageArgs
