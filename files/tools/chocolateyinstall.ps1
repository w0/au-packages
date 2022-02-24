
$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$WindowsVersion=[Environment]::OSVersion.Version

if (($WindowsVersion.Major -ne '10') -and ($WindowsVersion.Build -lt '18362')) {
  Throw 'This Package requires at least Windows 10 Build 18362 or newer.'
}

$packageArgs = @{
  packageName        = $env:ChocolateyPackageName
  url                = 'https://github.com/files-community/Files/releases/download/v2.1.15/Files.Package_2.1.15.0.zip'
  unZipLocation      = $toolsDir
  checksum           = 'bef0c393da4388a91551a9fc6406aced8c91ff75ab7d55e809bcaf851da0b0b9'
  checksumType       = 'sha256'
  getOriginalFileName= $true

}

Install-ChocolateyZipPackage @packageArgs

$MSIX = Get-ChildItem -Path $toolsDir -Recurse -Filter "*.msixbundle"

if ($MSIX) {
  Add-AppxPackage -Path $MSIX.FullName
} else {
  Throw 'Unable to locate msixbundle. Please notify the maintainer.'
}
