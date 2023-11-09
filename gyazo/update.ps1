Import-Module AU
. $PSScriptRoot\..\_scripts\all.ps1

$releases = 'https://gyazo.com/api/internal/download'

function global:au_SearchReplace {
    @{
        "tools\chocolateyInstall.ps1" = @{
            "(url\s*=\s*)('.*')"          = "`$1'$($Latest.URL32)'"
            "(checksum\s*=\s*)('.*')"     = "`$1'$($Latest.Checksum32)'"
        }
    }
}

function global:au_GetLatest {
    $download_page = Invoke-RestMethod -Uri $releases

    $url32   = $download_page.download_url
    $version = (($url32 -split '/')[-1]) -replace ('(?i)(?:[gyazo]+)\-|\.exe', '')

    return @{    
        Version = $version    
        URL32   = $url32
     }
}

update