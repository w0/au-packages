import-module au

$releases = 'https://api.github.com/repos/files-community/Files/releases/latest'

function global:au_SearchReplace {
    @{
        "$($Latest.PackageName).nuspec" = @{
            "(\<releaseNotes\>).*?(\</releaseNotes\>)" = "`${1}$($Latest.ReleaseNotes)`$2"
        }

        ".\legal\VERIFICATION.txt" = @{
          "(?i)(\s+zip:).*"                            = "`${1} $($Latest.url32)"
          "(?i)(checksumZip:).*"                       = "`${1} $($Latest.Checksum32)"
        }

    }
}

function global:au_BeforeUpdate {
     Get-RemoteFiles -Purge -NoSuffix
}

function global:au_GetLatest {
    $download_page = Invoke-RestMethod -Uri $releases

    $re      = '\.zip$'
    $url     = $download_page.assets | ? name -match $re | select -expand browser_download_url

    @{
        Version      = $download_page.tag_name.trim('v')
        url32        = $url
        ReleaseNotes = $download_page.html_url
    }
}

update -ChecksumFor none
