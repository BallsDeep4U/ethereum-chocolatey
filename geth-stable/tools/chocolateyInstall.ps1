$packageName    = 'geth-stable'
$url = 'https://github.com/ethereum/go-ethereum/releases/download/v1.1.3/Geth-Win64-20150910083726-1.1.3-9ebe787.zip'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$shortcutFile = Join-Path $env:userprofile "Desktop\$packageName.bat"

# Download and extract package
Install-ChocolateyZipPackage "$packageName" "$url" "$toolsDir"
# Prevent shim from being created in bin directory
"shimgen ignore" | Set-Content "$(Join-Path $toolsDir 'geth.exe.ignore')" -Encoding ASCII

#$batContent = "$toolsDir\geth.exe console 2> $toolsDir\geth.log"
$batContent = "$toolsDir\geth.exe console"

"$batContent"| Set-Content $shortcutFile -Encoding ASCII

