# InitializeGit

This batch commandline will download the stub.cmd and exectue it.
The stub.cmd will download,join and extract the PortableGit-2.39.2-64-bit to %LocalAppData%\PortableGit

```
bitsadmin /transfer "RunStub" "https://raw.githubusercontent.com/carsten-riedel/InitializeGit/main/stub.cmd" "%localappdata%\InitializeGit\stub.cmd" > nul 2>&1  & Call "%localappdata%\InitializeGit\stub.cmd" & exit
```


$FileName = '$env:LocalAppData\InitializeGit\stub.ps1' ; if (Test-Path $FileName) { Remove-Item $FileName }

```
powershell -command "(new-object System.Net.WebClient).DownloadFile('https://raw.githubusercontent.com/carsten-riedel/InitializeGit/main/stub.ps1','$env:LocalAppData\InitializeGit\stub.ps1') ; &'$env:LocalAppData\InitializeGit\stub.ps1'"
```


powershell.exe -Command "& { $FileName = '$env:LocalAppData\InitializeGit\stub.ps1' ; Write-Host $FileName ; (new-object System.Net.WebClient).DownloadFile('https://raw.githubusercontent.com/carsten-riedel/InitializeGit/main/stub.ps1','$FileName') ;  }"


powershell.exe -Command "& { $FileName = '$env:LocalAppData\InitializeGit\stub.ps1' ; Write-Host $FileName ; }"


$FileName = "$env:LocalAppData\InitializeGit\stub.ps1" ; if (Test-Path $FileName) { Remove-Item $FileName } ;(new-object System.Net.WebClient).DownloadFile("https://raw.githubusercontent.com/carsten-riedel/InitializeGit/main/stub.ps1","$env:LocalAppData\InitializeGit\stub.ps1") ; &"$FileName"