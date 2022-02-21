
$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$WindowsVersion=[Environment]::OSVersion.Version

if (($WindowsVersion.Major -ne '10') -and ($WindowsVersion.Build -lt '18362')) {
  Throw 'This Package requires at least Windows 10 Build 18362 or newer.'
}

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName
  FileFullPath = Get-Item $toolsDir\*.zip
  Destination  = $toolsDir

}

Get-ChocolateyUnzip @packageArgs

Remove-Item $toolsDir\*.zip -ea 0

$MSIX = Get-ChildItem -Path $toolsDir -Recurse -Filter "*.msixbundle"

if ($MSIX) {
  Add-AppxPackage -Path $MSIX.FullName
} else {
  Throw 'Unable to locate msixbundle. Please notify the maintainer.'
}