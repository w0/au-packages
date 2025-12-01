
$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$softwareName = 'Logseq'
$version = '0.10.15'
if ($version -eq (Get-UninstallRegistryKey "$softwareName").DisplayVersion) {
  Write-Host "Logseq $version is already installed."
  return
}


$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'exe'
  url64         = 'https://github.com/logseq/logseq/releases/download/0.10.15/Logseq-win-x64-0.10.15.exe'
  softwareName  = 'loqseq*'
  checksum64    = 'b9335b55d4449a22628bdd4cea856183b2512aa9f2b07ddc17c5b36452802a21'
  checksumType64= 'sha256'
}

Install-ChocolateyPackage  @packageArgs
