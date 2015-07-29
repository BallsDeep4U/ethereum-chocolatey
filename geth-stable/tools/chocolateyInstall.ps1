$packageName    = 'geth-stable'
$url = "https://build.ethdev.com/builds/Windows%20Go%20master%20branch/Geth-Win64-20150728160328-1.0.0-d7211de.zip"

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$shortcutFile = Join-Path $env:userprofile "Desktop\$packageName.bat"

# Download and extract package
Install-ChocolateyZipPackage "$packageName" "$url" "$toolsDir"
# Prevent shim from being created in bin directory
"shimgen ignore" | Set-Content "$(Join-Path $toolsDir 'geth.exe.ignore')" -Encoding ASCII

#$batContent = "$toolsDir\geth.exe console 2> $toolsDir\geth.log"
$batContent = "$toolsDir\geth.exe console"

"$batContent"| Set-Content $shortcutFile -Encoding ASCII
