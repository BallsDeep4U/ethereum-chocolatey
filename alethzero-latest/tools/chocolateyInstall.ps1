$packageName    = 'AlethZero-latest'

$source = "https://build.ethdev.com/builds/Windows C++ develop branch/AlethZero-Win32-20150326084634-0.9.1-59-8-2e92e3f.7z"
$destination = "$env:temp\AlethZero-Win32-latest.7z"

Write-Host Let me get the latest version for you. I am copying it in your temp folder:
Write-Host   $destination 
Invoke-WebRequest $source -OutFile "$destination"

# if (-not (test-path "$env:ProgramFiles\7-Zip\7z.exe")) {throw "$env:ProgramFiles\7-Zip\7z.exe needed"} 
# set-alias sz "$env:ProgramFiles\7-Zip\7z.exe"  

7za x -aoa -y -o"$env:ProgramFiles\$packageName\" "$destination"

Write-Host Cleaning up the downloaded file from the temp folder.
remove-item "$destination"

Write-Host All done, you can start AlethZero from its install folder, I try to send you there!
Write-Host   "$env:ProgramFiles\$packageName\"
cd "$env:ProgramFiles\$packageName\"