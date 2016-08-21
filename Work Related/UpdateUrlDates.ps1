# define path to urls.txt - currently urls.txt has to reside in same directory as the script
$pathToUrl = $PSScriptRoot + "\urls.txt"

# read urls.txt content
$urls = Get-Content $pathToUrl

# lines that will be altered
$matches = $urls -match "https://jerg.zimonitor.com/overview/(\d*)/1/(\d*)"

$date = Get-Date -format yyyyMM

$expr1 = 'https://jerg.zimonitor.com/overview/(\d*)/1/(\d*)'
$expr2 = "https://jerg.zimonitor.com/overview/$date" + '/1/$2'

$output = ""

# altering lines
foreach ($line in $urls) {
    if ($line -match $expr1)
    {
        $line = [System.Text.RegularExpressions.Regex]::Replace($line, $expr1, $expr2);
    }
    
    $output += $line + "`r`n"
}

# write altered output back to urls.txt
$output | Out-File $pathToUrl -Force