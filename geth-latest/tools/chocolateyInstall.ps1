$packageName    = 'Geth-latest'

$source = "https://build.ethdev.com/builds/Windows%20Go%20develop%20branch/Geth-Win64-20150424070411-0.9.11-60--b6ec1c7.7z"
$destination = "$env:temp\Geth-Win64-latest.7z"

Write-Host Let me get the latest version for you. I am copying it in your temp folder:
Write-Host   $destination 
Invoke-WebRequest $source -OutFile "$destination"

# if (-not (test-path "$env:ProgramFiles\7-Zip\7z.exe")) {throw "$env:ProgramFiles\7-Zip\7z.exe needed"} 
# set-alias sz "$env:ProgramFiles\7-Zip\7z.exe"  

7za x -aoa -y -o"$env:ProgramFiles\$packageName\" "$destination"

Write-Host Cleaning up the downloaded file from the temp folder.
remove-item "$destination"

Write-Host All done, you can start Geth from its install folder, I try to send you there!
Write-Host   "$env:ProgramFiles\$packageName\"
cd "$env:ProgramFiles\$packageName\"
