@echo off

cd d:\Tableau\Tableau Server\10.5\bin

tabcmd login -s http://localhost -u Admin -p tableauadmin
tabcmd publish "C:\Users\Administrator\Downloads\Business Health - Brand Data.tdsx" -r "Data Sources - Business Health" -o
tabcmd publish "C:\Users\Administrator\Downloads\Business Health - Channel Activations 17Q4.tdsx" -r "Data Sources - Business Health" -o
tabcmd publish "C:\Users\Administrator\Downloads\Business Health - Hourly 17Q4.tdsx" -r "Data Sources - Business Health" -o
tabcmd publish "C:\Users\Administrator\Downloads\Business Health - Icons.tdsx" -r "Data Sources - Business Health" -o
tabcmd publish "C:\Users\Administrator\Downloads\Business Health - Portfolio 17Q4.tdsx" -r "Data Sources - Business Health" -o
tabcmd publish "C:\Users\Administrator\Downloads\Business Health - RMHM 17Q4.tdsx" -r "Data Sources - Business Health" -o
tabcmd publish "C:\Users\Administrator\Downloads\Business Health - Vehicle Access.tdsx" -r "Data Sources - Business Health" -o
tabcmd publish "C:\Users\Administrator\Downloads\Channel Health - DVR Acquisition.tdsx" -r "Data Sources - Business Health" -o
tabcmd publish "C:\Users\Administrator\Downloads\Channel Health - PAX Acquisition.tdsx" -r "Data Sources - Business Health" -o
tabcmd publish "C:\Users\Administrator\Downloads\Channel Health - PAX Engagement.tdsx" -r "Data Sources - Business Health" -o

tabcmd publish "C:\Users\Administrator\Downloads\Channel Health - DAX Spend.tdsx" -r "Channel Health" -o

@echo Done