import-module au

$releases = 'https://api.github.com/repos/logseq/logseq/releases/latest'

function global:au_SearchReplace {
    @{
        "$($Latest.PackageName).nuspec" = @{
            "(\<releaseNotes\>).*?(\</releaseNotes\>)" = "`${1}$($Latest.ReleaseNotes)`$2"
        }
        
        "tools\chocolateyInstall.ps1" = @{
            "(?i)(^[$]version\s*=\s*)('.*')"        = "`$1'$($Latest.Version)'"
            "(url64\s*=\s*)('.*')"                  = "`$1'$($Latest.URL64)'"
            "(checksum64\s*=\s*)('.*')"             = "`$1'$($Latest.Checksum64)'"
            "(checksumType64\s*=\s*)('.*')"         = "`$1'$($Latest.ChecksumType64)'"
        }
    }
}

function global:au_GetLatest {
    $download_page = Invoke-RestMethod -Uri $releases

    $re      = '\.exe$'
    $url     = $download_page.assets | ? name -match $re | select -expand browser_download_url

    @{
        Version      = $download_page.tag_name
        URL64        = $url
        ReleaseNotes = $download_page.html_url
    }
}

update -ChecksumFor 64