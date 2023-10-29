import-module au

$releases = 'https://api.github.com/repos/logseq/logseq/releases/latest'

function global:au_SearchReplace {
    @{
        "$($Latest.PackageName).nuspec" = @{
            "(\<releaseNotes\>).*?(\</releaseNotes\>)" = "`${1}$($Latest.ReleaseNotes)`$2"
        }

        ".\legal\VERIFICATION.txt" = @{
          "(?i)(\s+x32:).*"            = "`${1} $($Latest.URL32)"
          "(?i)(checksum32:).*"        = "`${1} $($Latest.Checksum32)"
        }
        
        "tools\chocolateyInstall.ps1" = @{
            "(?i)(^[$]version\s*=\s*)('.*')" = "`$1'$($Latest.Version)'"
        }
    }
}

function global:au_BeforeUpdate {
     Get-RemoteFiles -Purge -NoSuffix
}

function global:au_GetLatest {
    $download_page = Invoke-RestMethod -Uri $releases

    $re      = '\.exe$'
    $url     = $download_page.assets | ? name -match $re | select -expand browser_download_url

    @{
        Version      = $download_page.tag_name
        URL32        = $url
        ReleaseNotes = $download_page.html_url
    }
}

update -ChecksumFor none 
