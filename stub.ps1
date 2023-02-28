Write-Host "STUB Press any key to continue..." -NoNewline
$null = $Host.UI.RawUI.ReadKey('NoEcho,IncludeKeyDown')


Write-Host "The main script is running"
& 'mock.ps1'
Write-Host "The main script has finished"
