
$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$WindowsVersion=[Environment]::OSVersion.Version

if (($WindowsVersion.Major -ne '10') -and ($WindowsVersion.Build -lt '18362')) {
  Throw 'This Package requires at least Windows 10 Build 18362 or newer.'
}

$AppInstaller = Get-ChildItem -Path $toolsDir -Recurse -Filter "*.appinstaller"

if ($AppInstaller) {
  Add-AppxPackage -AppInstallerFile $AppInstaller.FullName
} else {
  Throw 'Unable to locate appinstaller. Please notify the maintainer.'
}
