import-module au
. $PSScriptRoot\..\_scripts\all.ps1

$releases = 'https://github.com/rocksdanister/lively/releases'

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
    $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing

    $re      = '\.exe$'
    $url     = $download_page.links | Where-Object href -match $re | Select-Object -First 1 -expand href
    $url     = 'https://github.com' + $url
    $version = $url -split '/' | Select-Object -Last 1 -Skip 1

    @{
        Version      = $version.TrimStart('v')
        URL32        = $url
        ReleaseNotes = "https://github.com/rocksdanister/lively/releases/tag/${version}"
    }
}

update -force
