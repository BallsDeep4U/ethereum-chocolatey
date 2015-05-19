$packageName = 'geth-latest'

Write-Host This only removes Geth, not any databases or keys!
Write-Host For more information see https://github.com/ethereum/go-ethereum/wiki/Backup-%26-restore

$shortcutDir = [Environment]::GetFolderPath("Desktop")
$shortcutFile = "$packageName.lnk"

if (Test-Path "$shortcutDir\$shortcutFile") {Remove-Item $shortcutDir\$shortcutFile} 

