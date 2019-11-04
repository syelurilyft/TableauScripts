@echo off

D:

cd d:\Tableau Server\2018.1\bin

tabcmd login -s http://localhost -t Server -u Admin -p tableauadmin 

tabcmd export "Enterprise_Users/Enterprise_Users?:refresh=yes" --csv -f "C:\Users\Administrator\Desktop\User List Sync\Enterprise_Users\Enterprise_Users.csv"
tabcmd export "Enterprise_Users/Enterprise_Developers?:refresh=yes" --csv -f "C:\Users\Administrator\Desktop\User List Sync\Enterprise_Users\Enterprise_Developers.csv"


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

tabcmd removeusers "Enterprise_Viewers" --users "C:\Users\Administrator\Desktop\User List Sync\Enterprise_Users\Current_Users\Enterprise_Users.csv" --no-complete
tabcmd addusers "Enterprise_Viewers" --users "C:\Users\Administrator\Desktop\User List Sync\Enterprise_Users\Enterprise_Users.csv" --no-complete

tabcmd removeusers "Enterpise_Developers" --users "C:\Users\Administrator\Desktop\User List Sync\Enterprise_Users\Current_Users\Enterprise_Developers.csv" --no-complete
tabcmd addusers "Enterpise_Developers" --users "C:\Users\Administrator\Desktop\User List Sync\Enterprise_Users\Enterprise_Developers.csv" --no-complete

tabcmd logout


tabcmd login -s http://localhost -t Enterprise -u Admin -p tableauadmin

tabcmd removeusers "Enterprise_Viewers" --users "C:\Users\Administrator\Desktop\User List Sync\Enterprise_Users\Current_Users\Enterprise_Users.csv" --no-complete
tabcmd addusers "Enterprise_Viewers" --users "C:\Users\Administrator\Desktop\User List Sync\Enterprise_Users\Enterprise_Users.csv" --no-complete

tabcmd removeusers "Enterpise_Developers" --users "C:\Users\Administrator\Desktop\User List Sync\Enterprise_Users\Current_Users\Enterprise_Developers.csv" --no-complete
tabcmd addusers "Enterpise_Developers" --users "C:\Users\Administrator\Desktop\User List Sync\Enterprise_Users\Enterprise_Developers.csv" --no-complete

tabcmd logout


@echo Permissions_Granted

@echo Moving Files

C:
cd C:\
move "C:\Users\Administrator\Desktop\User List Sync\FP&A_Users\*.csv" "C:\Users\Administrator\Desktop\User List Sync\Enterprise_Users\Current_Users\"

@echo Permissions_Granted
@echo Complete
EXIT





