Write-Host "STUB Press any key to continue..."
$null = $Host.UI.RawUI.ReadKey('NoEcho,IncludeKeyDown')


$FileName = "$env:LocalAppData\InitializeGit\mock.ps1" ; if (Test-Path $FileName) { Remove-Item $FileName } ;(new-object System.Net.WebClient).DownloadFile("https://raw.githubusercontent.com/carsten-riedel/InitializeGit/main/mock.ps1","$FileName") ; &"$FileName"



Write-Host "The main script has finished"
