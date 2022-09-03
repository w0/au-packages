import-module au
. $PSScriptRoot\..\_scripts\all.ps1

$releases = 'https://easyeda.com/page/download'

function global:au_SearchReplace {
   @{
        "tools\chocolateyInstall.ps1" = @{
            "(url\s*=\s*)('.*')"          = "`$1'$($Latest.URL32)'"
            "(url64bit\s*=\s*)('.*')"        = "`$1'$($Latest.URL64)'"
            "(checksum\s*=\s*)('.*')"     = "`$1'$($Latest.Checksum32)'"
            "(checksum64\s*=\s*)('.*')"   = "`$1'$($Latest.Checksum64)'"
        }

        "$($Latest.PackageName).nuspec" = @{
            "(\<releaseNotes\>).*?(\</releaseNotes\>)" = "`${1}$($Latest.ReleaseNotes)`$2"
        }
    }
}

function global:au_GetLatest {
    $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing

    $url64   = $download_page.links | ? href -match 'easyeda-windows-x64.*\.exe$'  | select -ExpandProperty href -First 1
    $url32   = $download_page.links | ? href -match 'easyeda-windows-ia32.*\.exe$' | select -ExpandProperty href -First 1
    $version = ($url32 -split '-' | select -Last 1).trim('.exe')  

    return @{    
        Version = $version    
        URL32   = $domain + $url32
        URL64   = $domain + $url64
     }
}

update -NoCheckChocoVersion