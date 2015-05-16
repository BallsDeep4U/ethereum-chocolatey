$packageName = 'Geth-latest'    

remove-item "$env:ProgramFiles\$packageName\"  -recurse -force -confirm:$false
remove-Item -Path HKCU:\Software\ethereum\geth
