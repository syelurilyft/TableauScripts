@echo off

D:

cd d:\Tableau Server\2018.1\bin

tabcmd login -s http://localhost -t Server -u Admin -p tableauadmin 

tabcmd refreshextracts --datasource Enterprise_All

PING -n 301 127.0.0.1>nul

tabcmd export "Enterprise_All/Enterprise_All?:refresh=yes" --csv -f "C:\Users\Administrator\Desktop\User List Sync\Enterprise_All\Enterprise_All.csv"
tabcmd export "Enterprise_All/All_Reg?:refresh=yes" --csv -f "C:\Users\Administrator\Desktop\User List Sync\Enterprise_All\All_Reg.csv"
tabcmd export "Enterprise_All/Central?:refresh=yes" --csv -f "C:\Users\Administrator\Desktop\User List Sync\Enterprise_All\Central.csv"
tabcmd export "Enterprise_All/East?:refresh=yes" --csv -f "C:\Users\Administrator\Desktop\User List Sync\Enterprise_All\East.csv"
tabcmd export "Enterprise_All/Other?:refresh=yes" --csv -f "C:\Users\Administrator\Desktop\User List Sync\Enterprise_All\Other.csv"
tabcmd export "Enterprise_All/West?:refresh=yes" --csv -f "C:\Users\Administrator\Desktop\User List Sync\Enterprise_All\West.csv"

@echo Grabed_Files

@echo Cleaning_Fields

c:

cd C:\Users\Administrator\Desktop\User List Sync

%windir%\system32\windowspowershell\v1.0\powershell.exe -command c:\myreplacetest2.ps1

@Echo Files_Cleaned

@echo Granting_Permissions

d:

cd d:\Tableau Server\2018.1\bin

tabcmd login -s http://localhost -u Admin -p tableauadmin

tabcmd addusers "Enterprise_All" --users "C:\Users\Administrator\Desktop\User List Sync\Enterprise_All\Enterprise_All.csv" --no-complete
tabcmd addusers "Enterprise Lyft Business Top Customers & Partners - All Regions" --users "C:\Users\Administrator\Desktop\User List Sync\Enterprise_All\All_Reg.csv" --no-complete
tabcmd addusers "Enterprise Lyft Business Top Customers & Partners - Central" --users "C:\Users\Administrator\Desktop\User List Sync\Enterprise_All\Central.csv" --no-complete
tabcmd addusers "Enterprise Lyft Business Top Customers & Partners - East" --users "C:\Users\Administrator\Desktop\User List Sync\Enterprise_All\East.csv" --no-complete
tabcmd addusers "Enterprise Lyft Business Top Customers & Partners - Other" --users "C:\Users\Administrator\Desktop\User List Sync\Enterprise_All\Other.csv" --no-complete
tabcmd addusers "Enterprise Lyft Business Top Customers & Partners - West" --users "C:\Users\Administrator\Desktop\User List Sync\Enterprise_All\West.csv" --no-complete

tabcmd logout

tabcmd login -s http://localhost -t Enterprise -u Admin -p tableauadmin

tabcmd addusers "Enterprise_All" --users "C:\Users\Administrator\Desktop\User List Sync\Enterprise_All\Enterprise_All.csv" --no-complete
tabcmd addusers "Enterprise Lyft Business Top Customers & Partners - All Regions" --users "C:\Users\Administrator\Desktop\User List Sync\Enterprise_All\All_Reg.csv" --no-complete
tabcmd addusers "Enterprise Lyft Business Top Customers & Partners - Central" --users "C:\Users\Administrator\Desktop\User List Sync\Enterprise_All\Central.csv" --no-complete
tabcmd addusers "Enterprise Lyft Business Top Customers & Partners - East" --users "C:\Users\Administrator\Desktop\User List Sync\Enterprise_All\East.csv" --no-complete
tabcmd addusers "Enterprise Lyft Business Top Customers & Partners - Other" --users "C:\Users\Administrator\Desktop\User List Sync\Enterprise_All\Other.csv" --no-complete
tabcmd addusers "Enterprise Lyft Business Top Customers & Partners - West" --users "C:\Users\Administrator\Desktop\User List Sync\Enterprise_All\West.csv" --no-complete

tabcmd logout


@echo Permissions_Granted

@echo Permissions_Granted
@echo Complete





