function DownloadFile {
 
    param (
        [Parameter(Mandatory)]
        $folder,
        [Parameter(Mandatory)]
        $url
    )

    $file = [System.IO.Path]::GetFileName($url)
    $location = [System.IO.Path]::Combine($folder,$file)

    If(!(test-path -PathType container $folder))
    {
          New-Item -ItemType Directory -Path $folder
    }

    try {
        $wc = new-object System.Net.WebClient
        Write-Host "Downloading $url to $location"
        $wc.DownloadFile("$url","$location")
    }
    catch [System.Net.WebException] {
        $exMessage = $PSItem.Exception.Message
        Write-Host "Requested file may not be present, or you can not connect to the target from this device"
        Write-Host "$exMessage"
    }
    catch [System.IO.IOException] {
        $exMessage = $PSItem.Exception.Message
        Write-Host "Please ensure that you can create folders an files at $localPath"
        Write-Host "$exMessage"
    }
    catch {
        $exMessage = $PSItem.Exception.Message
        Write-Host "Unknown error."
        Write-Host "$exMessage"
    }

    return $location
}




Write-Host "STUB Press any key to continue..."
$null = $Host.UI.RawUI.ReadKey('NoEcho,IncludeKeyDown')




$FileName = "$env:LocalAppData\InitializeGit\mock.ps1" ; if (Test-Path $FileName) { Remove-Item $FileName } ; $dir = [System.IO.Path]::GetDirectoryName($FileName);$null = New-Item -Force -ItemType Directory -Path $dir;(new-object System.Net.WebClient).DownloadFile('https://raw.githubusercontent.com/carsten-riedel/InitializeGit/main/mock.ps1',"$FileName")

$src = 'https://raw.githubusercontent.com/carsten-riedel/InitializeGit/main/mock.ps1'; $trg = "$env:LocalAppData\InitializeGit\mock.ps1" ; if (Test-Path $trg) { Remove-Item $trg } ; $dir = [System.IO.Path]::GetDirectoryName($trg);$null = New-Item -Force -ItemType Directory -Path $dir;(new-object System.Net.WebClient).DownloadFile($src,$trg); &"$trg"

Write-Host ".$FileName."

(New-Object System.Net.WebClient).DownloadFile("https://raw.githubusercontent.com/carsten-riedel/InitializeGit/main/mock.ps1", "C:\Temp\archive.zip")

Write-Host "The main script has finished2"
&"$FileName"

DownloadFile "C:\Temp" "https://raw.githubusercontent.com/carsten-riedel/InitializeGit/main/stub.cmd"

Write-Host "The main script has finished"

Write-Host "STUB Press any key to continue..."
$null = $Host.UI.RawUI.ReadKey('NoEcho,IncludeKeyDown')
