@echo off

param ($_.Body)
d:

cd "Tableau Server\2018.1\bin"

.\tabcmd login -s http://localhost -u Admin -p tableauadmin

.\tabcmd refreshextracts --project "Data Sources - Business Health"  --datasource $_.Body

@echo done

