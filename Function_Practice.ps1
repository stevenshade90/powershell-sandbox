function Read-File {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory)]
        [ValidateSet('2')]
        [string] $Version,

        [Parameter(Mandatory, ValueFromPipeline)]
        [string] $UserName
        )

        process {
            $path = "C:\Users\steve\OneDrive\Desktop\SoftwareV$Version.txt"

            Write-Host "$UserName : Attempting to load file from => $path"
            $fileStuff = Get-ChildItem -Path $path
            $fileText = Get-Content $fileStuff
            $fileText
            Write-Host "`n"
        }
}

$users = @("Mark Milo", "Tommy Giru", "Matthew Hunts")
$users | Read-File -Version 2