@echo off
CLS
REM Delete the old stub because bitsadmin can not overwrite files.
SET initgit=%LocalAppData%\InitializeGit
REM del /Q "%initgit%\stub.cmd"

SET pgit=%LocalAppData%\PortableGit\cmd\git.exe
echo Changes in mock.cmd downloaded from raw.githubusercontent.com take some time since there populated with the content providers. 
echo The git.exe is located here %pgit%
pause




REM SET CLONEROOT=C:\VCS\git\github.com\carsten-riedel\InitializeGit
REM mkdir "%CLONEROOT%"
REM %LOCALAPPDATAPORTABLEGIT%\cmd\git.exe clone --depth=1 "https://github.com/carsten-riedel/InitializeGit.git" "%CLONEROOT%"
REM rmdir /s /q "%CLONEROOT%\.git"
REM CLS
REM Call C:\VCS\git\github.com\carsten-riedel\InitializeGit\mock.cmd

