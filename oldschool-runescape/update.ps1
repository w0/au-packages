
Import-Module AU
. $PSScriptRoot\..\_scripts\all.ps1

$releases = 'https://www.runescape.com/oldschool/download'

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
    $url32 = $download_page.links | ? href -Match '\.msi' | select -ExpandProperty href -First 1

    
    return @{
        Version = '1.2.7'
        URL32   = $url32
    }
}

update
