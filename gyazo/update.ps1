Import-Module AU
. $PSScriptRoot\..\_scripts\all.ps1

$releases = 'https://gyazo.com/download?dl=now'

function global:au_SearchReplace {
    @{
        "tools\chocolateyInstall.ps1" = @{
            "(url\s*=\s*)('.*')"          = "`$1'$($Latest.URL32)'"
            "(checksum\s*=\s*)('.*')"     = "`$1'$($Latest.Checksum32)'"
        }
    }
}

function global:au_GetLatest {
    $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing

    $url32   = $download_page.links | ? href -match '\.exe$' | select -ExpandProperty href -First 1
    $version = (($url32 -split '/')[-1]) -replace ('(?i)(?:[gyazo]+)\-|\.exe', '')

    return @{    
        Version = $version    
        URL32   = $url32
     }
}

update