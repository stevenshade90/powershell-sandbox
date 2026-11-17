function Read-File {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory)]
        [ValidateSet('2')]
        [string] $Version,

        [Parameter(Mandatory, ValueFromPipeline)]
        [System.Collections.DictionaryEntry] $UserInfo
        )

        process {
            try {
                $UserName = $_.Key
                $UserPath = $_.Value

                Write-Host "$UserName : Attempting to load file from => $UserPath"

                $FileObject = Get-ChildItem -Path $UserPath -ErrorAction Stop
                Write-Host "File found!"
            }
            catch {
                Write-Host "`t=> Couldn't load file ($($_.Exception.Message))`n"
                return
            }

            $i = 1
            foreach ($item in $FileObject) {
                $supplemental = "SoftwareV$Version.txt"
                Write-Host "$i - " $item.Name
                $i++

                if ($item.Name -eq $supplemental) {
                    $FullPath = $UserPath + "\$supplemental"
                    $FullText = Get-Content $FullPath
                    $FullText
                }   
                else {
                    Write-Host "`tWrong file!`n"
                }
            }
            Write-Host `n  
        }
}

$ErrorActionPreference = 'SilentlyContinue'
$users = @{
    "Mark Milo" = "C:\Users\steve\source\repos\powershell-sandbox\Function_Practice\Read_File_Function"; 
    "Tommy Giru" = "C:\Users\steve\source\repos\powershell-sandbox\Function_Practice\Read_ile_Function"; 
    "Matthew Hunts" = "C:\Users\steve\source\repos\powershell-sandbox\Function_Practice\Read_le_Function"
}
$users.GetEnumerator() | Read-File -Version 2