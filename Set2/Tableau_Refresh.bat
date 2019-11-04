@echo off

d:

cd "D:\Tableau Server\2018.1\bin"

tabcmd login -s http://localhost -u Admin -p tableauadmin

tabcmd refreshextracts --project "Server Health Dashboards"  --datasource delete

@echo done