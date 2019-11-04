@echo off

cd d:\Tableau\Tableau Server\10.5\bin

tabcmd login -s http://localhost -u Admin -p tableauadmin

tabcmd refreshextracts --synchronous --project "Data Sources - Business Health" --datasource Business Health - Icons

@echo Done

