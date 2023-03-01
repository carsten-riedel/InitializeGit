# InitializeGit

This batch commandline will download the stub.cmd and exectue it.
The stub.cmd will download,join and extract the PortableGit-2.39.2-64-bit to %LocalAppData%\PortableGit

```
del /Q "%localappdata%\InitializeGit\stub.cmd" & bitsadmin /transfer "RunStub" "https://raw.githubusercontent.com/carsten-riedel/InitializeGit/main/stub.cmd" "%localappdata%\InitializeGit\stub.cmd" > nul 2>&1  & Call "%localappdata%\InitializeGit\stub.cmd" & exit
```


Powershell
```
$src = "https://raw.githubusercontent.com/carsten-riedel/InitializeGit/main/stub.ps1"; $trg = "$env:LocalAppData\InitializeGit\stub.ps1" ; if (Test-Path $trg) {Remove-Item $trg}; $dir = [System.IO.Path]::GetDirectoryName($trg);$null = New-Item -Force -ItemType Directory -Path $dir;(new-object System.Net.WebClient).DownloadFile($src,$trg); &"$trg"
```