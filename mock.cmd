echo mock.cmd x

pause
exit


SET CLONEROOT=C:\VCS\git\github.com\carsten-riedel\InitializeGit
mkdir "%CLONEROOT%"
%LOCALAPPDATAPORTABLEGIT%\cmd\git.exe clone --depth=1 "https://github.com/carsten-riedel/InitializeGit.git" "%CLONEROOT%"
rmdir /s /q "%CLONEROOT%\.git"
CLS
Call C:\VCS\git\github.com\carsten-riedel\InitializeGit\mock.cmd

pause