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
          New-Item -ItemType Directory -Path $folder | Out-Null
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

    if (Test-Path "$folderPath\$newFileName") {
        Remove-Item "$folderPath\$newFileName" -Force
    }

    # Loop through each split file and append its contents to the new file

        # Loop through each source file
        foreach ($sourceFile in $splitFiles) {
            # Create a FileStream object for the source file in read mode
            Write-Host "Joining file: $($sourceFile.FullName)"
                # Create a new FileStream object for the destination file in write mode
            $destinationStream = New-Object IO.FileStream("$folderPath\$newFileName", [IO.FileMode]::OpenOrCreate, [IO.FileAccess]::Write)  
            $destinationStream.Seek(0, [IO.SeekOrigin]::End) | Out-Null
            $sourceStream = New-Object IO.FileStream($sourceFile.FullName, [IO.FileMode]::Open, [IO.FileAccess]::Read)
    
            try {
                # Copy the contents of the source file to the destination file using a buffer
                $buffer = New-Object byte[] 4096
                while ($true) {
                    $bytesRead = $sourceStream.Read($buffer, 0, $buffer.Length)
                    if ($bytesRead -eq 0) { break }
                    $destinationStream.Write($buffer, 0, $bytesRead)
                }
            } finally {
                # Close the FileStream object for the source file
                $sourceStream.Close()
                $destinationStream.Close()
            }
        }

        if ($removeSplit)
        {
            foreach ($sourceFile in $splitFiles) {
                Remove-Item $sourceFile.FullName
            }
        }
}

function ExpandArch {

    param (
        [Parameter(Mandatory)]
        $sourceFile,
        [Parameter(Mandatory)]
        $destFolder,
        $removeSource = $false
    )
   
    $OriginalPref = $global:ProgressPreference
    $global:ProgressPreference = "SilentlyContinue"
    Write-Host "Expand-Archive: $sourceFile"
    Expand-Archive -Path "$sourceFile" -DestinationPath "$destFolder" -Force
    $global:ProgressPreference = $OriginalPref

    if ($removeSource)
    {
        Remove-Item "$sourceFile"
    }
}

$param1 = $args[0]
Write-Host "Param1 is: $param1"

DownloadFile -url "https://github.com/carsten-riedel/InitializeGit/raw/main/PortableGit-2.39.2-64-bit.7z.zip.001" -folder "$env:LocalAppData\InitializeGit\temp" | Out-Null
DownloadFile -url "https://github.com/carsten-riedel/InitializeGit/raw/main/PortableGit-2.39.2-64-bit.7z.zip.002" -folder "$env:LocalAppData\InitializeGit\temp" | Out-Null
DownloadFile -url "https://github.com/carsten-riedel/InitializeGit/raw/main/PortableGit-2.39.2-64-bit.7z.zip.003" -folder "$env:LocalAppData\InitializeGit\temp" | Out-Null
JoinFiles -folderPath "$env:LocalAppData\InitializeGit\temp" -splitFilePattern "PortableGit-2.39.2-64-bit.7z.zip.*" -newFileName "PortableGit-2.39.2-64-bit.7z.zip" -removeSplit $true
ExpandArch -sourceFile "$env:LocalAppData\InitializeGit\temp\PortableGit-2.39.2-64-bit.7z.zip" -destFolder "$env:LocalAppData\InitializeGit\PortableGit" -removeSource $true

DownloadFile -url "https://raw.githubusercontent.com/carsten-riedel/InitializeGit/main/mock.ps1" -folder "$env:LocalAppData\InitializeGit\temp"
; &"$env:LocalAppData\InitializeGit\temp\mock.ps1"

Write-Host "The main script has finished"

Write-Host "STUB Press any key to continue..."
$null = $Host.UI.RawUI.ReadKey('NoEcho,IncludeKeyDown')


