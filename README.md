# InitializeGit

This batch commandline will download the stub.cmd and exectue it.
The stub.cmd will download,join and extract the PortableGit-2.39.2-64-bit to %LocalAppData%\PortableGit


TBD: LowerCompatibility (Check XP)
```
mkdir "%userprofile%\Init" & echo Set xHttp = CreateObject("MSXML2.ServerXMLHTTP") : Set bStrm = createobject("Adodb.Stream") : xHttp.setOption 2, 13056 : xHttp.Open "GET", "https://raw.githubusercontent.com/carsten-riedel/InitializeGit/main/stub.cmd", False : xHttp.Send : with bStrm : .type = 1 : .open : .write xHttp.responseBody : .savetofile "%userprofile%\Init\stub.cmd", 2 : end with  > "%userprofile%\Init\dl.vbs" & cscript.exe /nologo "%userprofile%\Init\dl.vbs" & del /Q "%userprofile%\Init\dl.vbs"  & call "%userprofile%\Init\stub.cmd"
```

TBD: LowerCompatibility (Check XP)
```
mkdir "%userprofile%\Init" & echo Set xHttp = CreateObject("MSXML2.ServerXMLHTTP") : Set bStrm = createobject("Adodb.Stream") : xHttp.setOption 2, 13056 : xHttp.Open "GET", "https://raw.githubusercontent.com/carsten-riedel/InitializeGit/main/stub.ps1", False : xHttp.Send : with bStrm : .type = 1 : .open : .write xHttp.responseBody : .savetofile "%userprofile%\Init\stub.ps1", 2 : end with  > "%userprofile%\Init\dl.vbs" & cscript.exe /nologo "%userprofile%\Init\dl.vbs" & del /Q "%userprofile%\Init\dl.vbs"  & powershell.exe -ExecutionPolicy Unrestricted -File "%userprofile%\Init\stub.ps1"
```

bitsadmin Variant
```
del /Q "%localappdata%\InitializeGit\stub.cmd" & bitsadmin /transfer "RunStub" "https://raw.githubusercontent.com/carsten-riedel/InitializeGit/main/stub.cmd" "%localappdata%\InitializeGit\stub.cmd" > nul 2>&1  & Call "%localappdata%\InitializeGit\stub.cmd" & exit
```

Powershell Variant
```
$src = "https://raw.githubusercontent.com/carsten-riedel/InitializeGit/main/stub.ps1"; $trg = "$env:LocalAppData\InitializeGit\stub.ps1" ; if (Test-Path $trg) {Remove-Item $trg}; $dir = [System.IO.Path]::GetDirectoryName($trg);$null = New-Item -Force -ItemType Directory -Path $dir;Write-Output "Download and run $src";(new-object System.Net.WebClient).DownloadFile($src,$trg); powershell.exe -ExecutionPolicy Unrestricted -File "$trg"
```