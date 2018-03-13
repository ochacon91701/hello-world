

$Path = "C:\SQLExports\arsqlcs\DST17000SanBernardinoTraining\2018-03-12_0804\StoredProcedures"
$Text = "edulink"
$PathArray = @()
$Results = "C:\temp\test.txt"
$count = 0
$ext = "*.sql"
clear


Get-ChildItem $Path -Filter $ext |
Where-Object { $_.Attributes -ne "Directory"} |
ForEach-Object {
    If (Get-Content $_.FullName | Select-String -Pattern $Text) {
        $PathArray += $_.FullName

    }
}
Write-Host "Searching filepath: $Path\$ext "
Write-Host "Pattern: $Text "


Write-Host "Matches:"
    $PathArray | ForEach-Object {
    $count++
    $count.tostring() + ") " + $_
}



