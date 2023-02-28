mkdir C:\temp
bitsadmin /transfer myDownloadJob https://raw.githubusercontent.com/carsten-riedel/InitializeGit/main/PortableGit-2.39.2-64-bit.7z.zip.001 C:\temp\PortableGit-2.39.2-64-bit.7z.zip.001
bitsadmin /transfer myDownloadJob https://raw.githubusercontent.com/carsten-riedel/InitializeGit/main/PortableGit-2.39.2-64-bit.7z.zip.002 C:\temp\PortableGit-2.39.2-64-bit.7z.zip.002
bitsadmin /transfer myDownloadJob https://raw.githubusercontent.com/carsten-riedel/InitializeGit/main/PortableGit-2.39.2-64-bit.7z.zip.003 C:\temp\PortableGit-2.39.2-64-bit.7z.zip.003
rundll32 zipfldr.dll,RouteTheCall "myarchive.zip", "C:\Users\Username\Downloads"