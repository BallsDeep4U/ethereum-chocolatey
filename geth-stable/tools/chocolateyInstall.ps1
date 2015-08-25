$packageName    = 'geth-stable'
$url = 'https://github.com/ethereum/go-ethereum/releases/download/v1.1.0/Geth-Win64-20150825140940-1.1.0-fd512fa.zip'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$shortcutFile = Join-Path $env:userprofile "Desktop\$packageName.bat"

# Download and extract package
Install-ChocolateyZipPackage "$packageName" "$url" "$toolsDir"
# Prevent shim from being created in bin directory
"shimgen ignore" | Set-Content "$(Join-Path $toolsDir 'geth.exe.ignore')" -Encoding ASCII

#$batContent = "$toolsDir\geth.exe console 2> $toolsDir\geth.log"
$batContent = "$toolsDir\geth.exe console"

"$batContent"| Set-Content $shortcutFile -Encoding ASCII

Write-Host "`n`n`n"
Write-Host "###########################################################################"
Write-Host "Please note that you need to manually import the Genesis block on first run"
Write-Host "You can do this by editing the batfile on your desktop named geth-stable"
Write-Host "And adding --genesis c:\path\to\genesis\file before 'console'"
Write-Host "###########################################################################"
