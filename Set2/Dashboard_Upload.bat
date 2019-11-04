@echo off

cd d:\Tableau\Tableau Server\10.5\bin

tabcmd login  -s http://localhost -u Admin -p tableauadmin
tabcmd publish "C:\Users\Administrator\Downloads\DAX Spend Report - Q4.twbx" r- Channel Health -o

@echo Done

