param([string]$file)
Get-Content $file | ForEach-Object { $_ -replace '"', "" } | Set-Content ($file+".out")
Remove-Item $file
Rename-Item ($file+".out") $file