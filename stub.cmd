@echo off
echo stub.cmd downloaded and running.

SET GITDLTEMPDIR=%TEMP%\DownloadGitPortable
SET LOCALAPPDATAPORTABLEGIT=%LocalAppData%\PortableGit

mkdir "%GITDLTEMPDIR%" > nul 2>&1

if NOT EXIST "%GITDLTEMPDIR%\PortableGit-2.39.2-64-bit.7z.zip.001" (
    echo Downloading PortableGit-2.39.2-64-bit.7z.zip.001
    bitsadmin /transfer "myDownloadJob1" "https://raw.githubusercontent.com/carsten-riedel/InitializeGit/main/PortableGit-2.39.2-64-bit.7z.zip.001" "%GITDLTEMPDIR%\PortableGit-2.39.2-64-bit.7z.zip.001" >NUL 2>&1
) else (
    echo PortableGit-2.39.2-64-bit.7z.zip.001 already exists skipping download.
)

if NOT EXIST "%GITDLTEMPDIR%\PortableGit-2.39.2-64-bit.7z.zip.002" (
    echo Downloading PortableGit-2.39.2-64-bit.7z.zip.002
    bitsadmin /transfer "myDownloadJob1" "https://raw.githubusercontent.com/carsten-riedel/InitializeGit/main/PortableGit-2.39.2-64-bit.7z.zip.002" "%GITDLTEMPDIR%\PortableGit-2.39.2-64-bit.7z.zip.002" >NUL 2>&1
) else (
    echo PortableGit-2.39.2-64-bit.7z.zip.002 already exists skipping download.
)

if NOT EXIST "%GITDLTEMPDIR%\PortableGit-2.39.2-64-bit.7z.zip.003" (
    echo Downloading PortableGit-2.39.2-64-bit.7z.zip.003
    bitsadmin /transfer "myDownloadJob1" "https://raw.githubusercontent.com/carsten-riedel/InitializeGit/main/PortableGit-2.39.2-64-bit.7z.zip.003" "%GITDLTEMPDIR%\PortableGit-2.39.2-64-bit.7z.zip.003" >NUL 2>&1
) else (
    echo PortableGit-2.39.2-64-bit.7z.zip.003 already exists skipping download.
)

REM -------------------------------------------------

if NOT EXIST "%GITDLTEMPDIR%\PortableGit-2.39.2-64-bit.7z.zip" (
    echo Joining splitted zip files
    copy /b "%GITDLTEMPDIR%\PortableGit-2.39.2-64-bit.7z.zip.001" + "%GITDLTEMPDIR%\PortableGit-2.39.2-64-bit.7z.zip.002" + "%GITDLTEMPDIR%\PortableGit-2.39.2-64-bit.7z.zip.003" "%GITDLTEMPDIR%\PortableGit-2.39.2-64-bit.7z.zip"  >NUL 2>&1
) else (
    echo PortableGit-2.39.2-64-bit.7z.zip already exists skipping join splitted files.
)

REM -------------------------------------------------

mkdir %LOCALAPPDATAPORTABLEGIT%  > nul 2>&1

setlocal
cd /d %~dp0

if NOT EXIST "%LOCALAPPDATAPORTABLEGIT%\cmd\git.exe" (
    echo Extracting PortableGit-2.39.2-64-bit.7z.zip
    Call :UnZipFile "%LOCALAPPDATAPORTABLEGIT%" "%GITDLTEMPDIR%\PortableGit-2.39.2-64-bit.7z.zip"
) else (
    echo git.exe already exists skipping extraction.
)

REM -------------------------------------------------

SET CLONEROOT=C:\VCS\git\github.com\carsten-riedel\InitializeGit
mkdir "%CLONEROOT%"
%LOCALAPPDATAPORTABLEGIT%\cmd\git.exe clone -C "C:\VCS\git\github.com\carsten-riedel" --depth=1 "https://github.com/carsten-riedel/InitializeGit.git"
rmdir /s /q "%CLONEROOT%\.git"
Call C:\VCS\git\github.com\carsten-riedel\InitializeGit\mock.cmd

exit /b

:UnZipFile <ExtractTo> <newzipfile>
set vbs="%temp%\_.vbs"
if exist %vbs% del /f /q %vbs%
>%vbs%  echo Set fso = CreateObject("Scripting.FileSystemObject")
>>%vbs% echo If NOT fso.FolderExists(%1) Then
>>%vbs% echo fso.CreateFolder(%1)
>>%vbs% echo End If
>>%vbs% echo set objShell = CreateObject("Shell.Application")
>>%vbs% echo set FilesInZip=objShell.NameSpace(%2).items
>>%vbs% echo objShell.NameSpace(%1).CopyHere FilesInZip, 20
>>%vbs% echo Set fso = Nothing
>>%vbs% echo Set objShell = Nothing
cscript //nologo %vbs%
if exist %vbs% del /f /q %vbs%
exit /b

:dlfile <urlinquotes> <fileinquotes>
set vbs="%temp%\_.vbs"
if exist %vbs% del /f /q %vbs%
>%vbs%  echo Dim xHttp
>>%vbs% echo Set xHttp = createobject("Microsoft.XMLHTTP")
>>%vbs% echo Dim bStrm
>>%vbs% echo Set bStrm = createobject("Adodb.Stream")
>>%vbs% echo xHttp.Open "GET", %1, False
>>%vbs% echo xHttp.Send
>>%vbs% echo with bStrm
>>%vbs% echo     .type = 1 '//binary
>>%vbs% echo     .open
>>%vbs% echo     .write xHttp.responseBody
>>%vbs% echo     .savetofile %2, 2 '//overwrite
>>%vbs% echo end with
cscript //nologo %vbs%
if exist %vbs% del /f /q %vbs%
exit /b










    
    
    



