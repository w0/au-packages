import-module au

$releases = 'https://api.github.com/repos/files-community/Files/releases/latest'

function global:au_SearchReplace {
    @{
        "$($Latest.PackageName).nuspec" = @{
            "(\<releaseNotes\>).*?(\</releaseNotes\>)" = "`${1}$($Latest.ReleaseNotes)`$2"
        }

        ".\legal\VERIFICATION.txt" = @{
            "(?i)(\s+x32:).*"     = "`${1} $($Latest.URL32)"
            "(?i)(checksum32:).*" = "`${1} $($Latest.Checksum32)"
        }

    }
}

function global:au_BeforeUpdate {
    Get-RemoteFiles -Purge -NoSuffix
}

function global:au_GetLatest {
    $latest_release = Invoke-RestMethod -Uri $releases

    @{
        Version      = $latest_release.tag_name.trim('v')
        URL32          = 'https://files.community/appinstallers/Files.stable.appinstaller'
        ReleaseNotes = $latest_release.html_url
    }
}

update -ChecksumFor none
