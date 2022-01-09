Import-Module AU
. $PSScriptRoot\..\_scripts\all.ps1

$releases = 'https://www.runescape.com/download'

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

    $url32 = $download_page.links | ? href -Match '\.exe' | select -ExpandProperty href -First 1

    $temp_file = Join-Path $env:TEMP 'RuneScape.exe'
    Invoke-WebRequest -Uri $url32 -OutFile $temp_file

    $version = Get-Item $temp_file | % { $_.VersionInfo.ProductVersion -as [version] }

    $old_sha = (Select-String -Path '.\tools\chocolateyinstall.ps1' -Pattern "(checksum\s*=\s*)('.*')").Line.Split("'")[1]

    $new_sha = (Get-FileHash -Path $temp_file -Algorithm 'sha256').Hash 

    if ($old_sha -ne $new_sha) { $version = '{0}.{1}' -f $version, (Get-Date -UFormat "%Y%m%d") }

    return @{ 
        Version = $version
        URL32   = $url32
    }

}

update
