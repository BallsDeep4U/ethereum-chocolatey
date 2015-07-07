$packageName    = 'geth-stable'
$url = "https://github.com/ethereum/go-ethereum/releases/download/v0.9.36/Geth-Win64-20150707133857-0.9.36-423c2f4.zip"

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$shortcutFile = Join-Path $env:userprofile "Desktop\$packageName.bat"

# Download and extract package
Install-ChocolateyZipPackage "$packageName" "$url" "$toolsDir"
# Prevent shim from being created in bin directory
"shimgen ignore" | Set-Content "$(Join-Path $toolsDir 'geth.exe.ignore')" -Encoding ASCII

#$batContent = "$toolsDir\geth.exe console 2> $toolsDir\geth.log"
$batContent = "$toolsDir\geth.exe console"

"$batContent"| Set-Content $shortcutFile -Encoding ASCII
