$packageName    = 'geth-stable'

$source = "https://build.ethdev.com/builds/Windows%20Go%20master%20branch/Geth-Win64-20150508152915-0.9.17-60--c8fc4ce.7z"
$destination = "$env:chocolateyPackageFolder\tools"
$dlname = "Geth-Win64-stable.7z"
$7za = "$env:chocolateyPackageFolder\..\7zip.commandline\tools\7za.exe"

Write-Host Let me get the latest version for you. I am copying it to the folder:
Write-Host $destination\$dlname 
Get-ChocolateyWebFile 'geth' "$destination\$dlname" "$source"

& $7za x -y "-o$destination" $destination\$dlname

Write-Host Cleaning up the downloaded file.
Remove-Item $destination\$dlname

Write-Host All done, you can start Geth from its install folder at
Write-Host ---> $env:chocolateyPackageFolder\tools\geth.exe
