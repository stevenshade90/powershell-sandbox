$allNumbers = [System.Collections.ArrayList]@(5, 6, 7, 8, 4, -3)

ForEach-Object -InputObject $allNumbers -Process {
    "Numbers: $_"
}

$allNumbers.foreach({ ($_ + 5) })

Write-Host "Beforehand: $allNumbers"
for ($i = 0; $i -lt $allNumbers.Count; $i++) {
    $allNumbers[$i] = $allNumbers[$i] * 2
}
Write-Host "After: $allNumbers"

foreach ($num1 in $allNumbers) {
    foreach ($num2 in $allNumbers) {
        Write-Host "$num1 equals $num2 =>"
        
        switch ($num1 -eq $num2) {
        $true { 
            Write-Host "They're equal!" 
            break 
        }
        $false { 
            Write-Host "Theyre NOT equal!" 
            break 
        }
        default { 
            Write-Host "I dont know" 
        }
        }
    }
}

$counter = 1
while ($counter -le 10)
{
    Write-Host "Current Num => $counter"
    $counter++
}

do {
    $choice = Read-Host -Prompt "What is the best programming language"
    } until ($choice -eq "C#")
Write-Host "You got it!"
