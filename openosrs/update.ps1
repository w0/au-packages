Import-Module AU
. $PSScriptRoot\..\_scripts\all.ps1

$releases = 'https://github.com/open-osrs/launcher/releases'
$domain   = 'https://github.com'


function global:au_SearchReplace {
    @{
        "tools\chocolateyInstall.ps1" = @{
            "(url\s*=\s*)('.*')"      = "`$1'$($Latest.URL32)'"           
            "(url64\s*=\s*)('.*')"    = "`$1'$($Latest.URL64)'"           
            "(checksum\s*=\s*)('.*')"     = "`$1'$($Latest.Checksum32)'"      
            "(checksum64\s*=\s*)('.*')"   = "`$1'$($Latest.Checksum64)'"      

        }
    }
}

function global:au_GetLatest {
    $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing #1

    $url64   = $download_page.links | ? href -match '64\.exe$' | select -ExpandProperty href -first 1
    $url32   = $download_page.links | ? href -match '32\.exe$' | select -ExpandProperty href -first 1
    $version = $url32 -split '/' | select -last 1 -skip 1 

    return @{    
        Version = $version;    
        URL32 = $domain + $url32
        URL64 = $domain + $url64

     }
}

update