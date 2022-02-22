import-module au

$releases = 'https://api.github.com/repos/files-community/Files/releases/latest'

function global:au_SearchReplace {
    @{
        "$($Latest.PackageName).nuspec" = @{
            "(\<releaseNotes\>).*?(\</releaseNotes\>)" = "`${1}$($Latest.ReleaseNotes)`$2"
        }

        "tools\chocolateyInstall.ps1" = @{
            "(url\s*=\s*)('.*')"          = "`$1'$($Latest.URL)'"
            "(checksum\s*=\s*)('.*')"     = "`$1'$($Latest.Checksum32)'"
        }

    }
}

function global:au_GetLatest {
    $download_page = Invoke-RestMethod -Uri $releases

    $re      = '\.zip$'
    $zip     = $download_page.assets | ? name -match $re | select -expand browser_download_url

    @{
        Version      = $download_page.tag_name.trim('v')
        URL          = $zip
        ReleaseNotes = $download_page.html_url
    }
}

update
