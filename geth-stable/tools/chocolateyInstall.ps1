$packageName    = 'geth-stable'
$source = "https://github.com/ethereum/go-ethereum/releases/download/0.9.23/Geth-Win64-20150521175528-0.9.23-60--13e662f.7z"

$destination = "$env:chocolateyPackageFolder\tools"
$dlname = "$packageName.7z"
$7za = "$env:chocolateyPackageFolder\..\7zip.commandline\tools\7za.exe"

$shortcutDir = [Environment]::GetFolderPath("Desktop")
$shortcutFile = "$packageName.lnk"

Write-Host Let me get the latest version for you. I am copying it to the folder:
Write-Host $destination\$dlname 
Get-ChocolateyWebFile 'geth' "$destination\$dlname" "$source"

& $7za x -y "-o$destination" $destination\$dlname

Write-Host Cleaning up the downloaded file.
Remove-Item $destination\$dlname

Write-Host All done, you can start Geth from its install folder at
Write-Host ---> $env:chocolateyPackageFolder\tools\geth.exe
Write-Host Or run it from your Desktop

Install-ChocolateyShortcut -shortcutFilePath "$shortcutDir\$shortcutFile" -targetPath "$env:chocolateyPackageFolder\tools\console.bat" -Description "Geth (Stable)"

#"$env:chocolateyPackageFolder\tools\geth.exe console 2> $env:chocolateyPackageFolder\tools\geth.log" | Set-Content "$destination\console.bat" -Encoding ASCII
"$env:chocolateyPackageFolder\tools\geth.exe console" | Set-Content "$destination\console.bat" -Encoding ASCII