import-module au
. $PSScriptRoot\..\_scripts\all.ps1

$releases = 'https://api.github.com/repos/rocksdanister/lively/releases/latest'

function global:au_SearchReplace {
   @{
        ".\tools\chocolateyInstall.ps1" = @{
            "(?i)(url\s*=\s*)('.*')"              = "`$1'$($Latest.URL32)'"
            "(?i)(^\s*checksum\s*=\s*)('.*')"     = "`$1'$($Latest.Checksum32)'"
            "(?i)(^\s*fileType\s*=\s*)('.*')"     = "`$1'$($Latest.FileType)'"
        }

        "$($Latest.PackageName).nuspec" = @{
            "(\<releaseNotes\>).*?(\</releaseNotes\>)" = "`${1}$($Latest.ReleaseNotes)`$2"
        }
    }
}

function global:au_GetLatest {
    $download_page = Invoke-RestMethod -Uri $releases

    $re      = '\.exe$'
    $url     = $download_page.assets | ? name -match $re | Select-Object -First 1 -expand browser_download_url
    $version = $url -split '/' | Select-Object -Last 1 -Skip 1

    @{
        Version      = $version.TrimStart('v')
        URL32        = $url
        ReleaseNotes = "https://github.com/rocksdanister/lively/releases/tag/${version}"
    }
}

update
