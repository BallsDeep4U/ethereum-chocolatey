$packageName = 'geth-stable'

Write-Host This only removes Geth, not any databases or keys!
Write-Host For more information see https://github.com/ethereum/go-ethereum/wiki/Backup-%26-restore

$shortcutFile = Join-Path $env:userprofile "Desktop\$packageName.bat"


if (Test-Path "$shortcutFile") {Remove-Item $shortcutFile} 

