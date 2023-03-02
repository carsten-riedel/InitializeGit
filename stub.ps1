function DownloadFile {
 
    param (
        [Parameter(Mandatory)]
        $url,
        [Parameter(Mandatory)]
        $folder
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

function JoinFiles {
 
    param (
        [Parameter(Mandatory)]
        $folderPath,
        [Parameter(Mandatory)]
        $splitFilePattern,
        [Parameter(Mandatory)]
        $newFileName,
        $removeSplit = $false
    )

    # Get all the split files in the folder and sort them by name
    $splitFiles = Get-ChildItem $folderPath -Filter "$splitFilePattern"  | Sort-Object Name
    $splitFiles = $splitFiles | Where-Object { $_.Name -notcontains "$newFileName" }

    # Loop through each split file and append its contents to the new file
    foreach ($file in $splitFiles) {
        Write-Host "Joining $($file.FullName) to $folderPath\$newFileName"
        $content = Get-Content $file.FullName
        Add-Content "$folderPath\$newFileName" $content
    }

    if ($removeSplit)
    {
        # Remove the split files
        Remove-Item $folderPath\$splitFilePattern
    }

}


DownloadFile -url "https://github.com/carsten-riedel/InitializeGit/raw/main/PortableGit-2.39.2-64-bit.7z.zip.001" -folder "$env:LocalAppData\InitializeGit"
DownloadFile -url "https://github.com/carsten-riedel/InitializeGit/raw/main/PortableGit-2.39.2-64-bit.7z.zip.002" -folder "$env:LocalAppData\InitializeGit"
DownloadFile -url "https://github.com/carsten-riedel/InitializeGit/raw/main/PortableGit-2.39.2-64-bit.7z.zip.003" -folder "$env:LocalAppData\InitializeGit"
JoinFiles -folderPath "$env:LocalAppData\InitializeGit" -splitFilePattern "PortableGit-2.39.2-64-bit.7z.zip.*" -newFileName "PortableGit-2.39.2-64-bit.7z.zip"

#EXTRACT HERE

DownloadFile -url "https://raw.githubusercontent.com/carsten-riedel/InitializeGit/main/mock.ps1" -folder "$env:LocalAppData\InitializeGit"
; &"$env:LocalAppData\InitializeGit\mock.ps1"

Write-Host "The main script has finished"

Write-Host "STUB Press any key to continue..."
$null = $Host.UI.RawUI.ReadKey('NoEcho,IncludeKeyDown')
