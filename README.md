# InitializeGit

This batch commandline will download the stub.cmd and exectue it.
The stub.cmd will download,join and extract the PortableGit-2.39.2-64-bit to %LocalAppData%\PortableGit



WinXP
```
setlocal EnableDelayedExpansion & mkdir "%localappdata%\Init" & set script=Dim xHttp: Set xHttp = CreateObject("Microsoft.XMLHTTP"):Dim bStrm: Set bStrm = createobject("Adodb.Stream"): xHttp.Open "GET", "https://raw.githubusercontent.com/carsten-riedel/InitializeGit/main/stub.cmd", False : xHttp.Send : with bStrm : .type = 1 : .open : .write xHttp.responseBody : .savetofile "%localappdata%\Init\stub.cmd", 2 : end with  & cmd /v /c "echo !script!" > "%localappdata%\Init\dl.vbs" & cscript.exe /nologo "%localappdata%\Init\dl.vbs" & del /Q "%localappdata%\Init\dl.vbs"  & call "%localappdata%\Init\stub.cmd"
```

Win7
```
del /Q "%localappdata%\InitializeGit\stub.cmd" & bitsadmin /transfer "RunStub" "https://raw.githubusercontent.com/carsten-riedel/InitializeGit/main/stub.cmd" "%localappdata%\InitializeGit\stub.cmd" > nul 2>&1  & Call "%localappdata%\InitializeGit\stub.cmd" & exit
```

Win10
Powershell
```
$src = "https://raw.githubusercontent.com/carsten-riedel/InitializeGit/main/stub.ps1"; $trg = "$env:LocalAppData\InitializeGit\stub.ps1" ; if (Test-Path $trg) {Remove-Item $trg}; $dir = [System.IO.Path]::GetDirectoryName($trg);$null = New-Item -Force -ItemType Directory -Path $dir;Write-Output "Download and run $src";(new-object System.Net.WebClient).DownloadFile($src,$trg); powershell.exe -ExecutionPolicy Unrestricted -File "$trg"
```