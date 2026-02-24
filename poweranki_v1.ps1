$path = "balkan_v1.csv"
$csv = Import-Csv $path -Delimiter ";"
$randomRow = $csv | Sort-Object { [int]$_.Points }| Select-Object -First 1
$randomRowClone = $randomRow
$balkan= $randomRowClone | Select-Object "balkan"
$balkan | Format-Table -AutoSize

$blank = Read-Host

$russian = $randomRowClone | Select-Object "russian"
$russian | Format-Table -AutoSize




$rating = Read-Host "Input [0/1] "

if ($rating -eq "1")
{
  $randomRow.Points = [int]$randomRow.Points + 1
} else
{
  $randomRow.Points = [int]$randomRow.Points - 1
}

foreach ($row in $csv) {
  if ($row.balkan -eq $randomRow.balkan -and $row.russian -eq $randomRow.russian ) {
    $row.Points = $randomRow.Points
  }
}

$csv | Export-csv $Path -Delimiter ";" -Encoding UTF8 -NoTypeInformation
cls






