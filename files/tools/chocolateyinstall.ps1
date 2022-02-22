
$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$WindowsVersion=[Environment]::OSVersion.Version

if (($WindowsVersion.Major -ne '10') -and ($WindowsVersion.Build -lt '18362')) {
  Throw 'This Package requires at least Windows 10 Build 18362 or newer.'
}

$packageArgs = @{
  packageName        = $env:ChocolateyPackageName
  url                = 'https://github.com/files-community/Files/releases/download/v2.1.13/Files.Package_2.1.13.0.zip'
  unZipLocation      = $toolsDir
  checksum           = '014de3d5850803ed0934feb6805a5d90e687d237dc8d8923d94d1c4cfab9c94f'
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
