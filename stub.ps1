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


$src = 'https://github.com/carsten-riedel/InitializeGit/raw/main/PortableGit-2.39.2-64-bit.7z.zip.001'; $trg = "$env:LocalAppData\InitializeGit\PortableGit-2.39.2-64-bit.7z.zip.001" ; if (Test-Path $trg) { Remove-Item $trg } ; $dir = [System.IO.Path]::GetDirectoryName($trg);$null = New-Item -Force -ItemType Directory -Path $dir;Write-Output "Download $src";(new-object System.Net.WebClient).DownloadFile($src,$trg);
$src = 'https://github.com/carsten-riedel/InitializeGit/raw/main/PortableGit-2.39.2-64-bit.7z.zip.002'; $trg = "$env:LocalAppData\InitializeGit\PortableGit-2.39.2-64-bit.7z.zip.002" ; if (Test-Path $trg) { Remove-Item $trg } ; $dir = [System.IO.Path]::GetDirectoryName($trg);$null = New-Item -Force -ItemType Directory -Path $dir;Write-Output "Download $src";(new-object System.Net.WebClient).DownloadFile($src,$trg);
$src = 'https://github.com/carsten-riedel/InitializeGit/raw/main/PortableGit-2.39.2-64-bit.7z.zip.003'; $trg = "$env:LocalAppData\InitializeGit\PortableGit-2.39.2-64-bit.7z.zip.003" ; if (Test-Path $trg) { Remove-Item $trg } ; $dir = [System.IO.Path]::GetDirectoryName($trg);$null = New-Item -Force -ItemType Directory -Path $dir;Write-Output "Download $src";(new-object System.Net.WebClient).DownloadFile($src,$trg);


$src = 'https://raw.githubusercontent.com/carsten-riedel/InitializeGit/main/mock.ps1'; $trg = "$env:LocalAppData\InitializeGit\mock.ps1" ; if (Test-Path $trg) { Remove-Item $trg } ; $dir = [System.IO.Path]::GetDirectoryName($trg);$null = New-Item -Force -ItemType Directory -Path $dir;(new-object System.Net.WebClient).DownloadFile($src,$trg);Write-Output "Download and run $src"; &"$trg"




Write-Host "The main script has finished"

Write-Host "STUB Press any key to continue..."
$null = $Host.UI.RawUI.ReadKey('NoEcho,IncludeKeyDown')
