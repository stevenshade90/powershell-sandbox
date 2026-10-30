function Move-Files {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory)]
        [string] $SourcePath,

        [Parameter(Mandatory)]
        [string] $DestinationPath
    )

    $files = Get-ChildItem -Path $SourcePath

    if ($files.Count -gt 0) {
        foreach ($file in $files) {
            Move-Item -Path $file.FullName -Destination $DestinationPath  
        }
        Write-Host "File(s) moved!"
    }
    else {
        Write-Host "No file(s) to move"
    }
}

$SourcePath = "C:\Users\steve\source\repos\powershell-sandbox\Function_Practice\Move_Item_Function.ps1"
$DestinationPath = "C:\Users\steve\source\repos\powershell-sandbox\Function_Practice\Move_Item_Function"

Move-Files -SourcePath $SourcePath -DestinationPath $DestinationPath