# InitializeGit

This batch commandline will download the stub.cmd and exectue it.
The stub.cmd will download,join and extract the PortableGit-2.39.2-64-bit to %LocalAppData%\PortableGit

```
bitsadmin /transfer "RunStub" "https://raw.githubusercontent.com/carsten-riedel/InitializeGit/main/stub.cmd" "%localappdata%\stub.cmd" > nul 2>&1  & Call "%localappdata%\stub.cmd"
```
