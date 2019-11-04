@echo off

D:

cd d:\Tableau Server\2018.1\bin

tabcmd login -s http://localhost -t Server -u Admin -p tableauadmin 

tabcmd export "Tableau_Users_2018/Total_Server_Users?:refresh=y" --csv -f "C:\Users\Administrator\Desktop\User List Sync\Total_Users.csv"

tabcmd export "Tableau_Users_2018/PMM_Users?:refresh=y" --csv -f "C:\Users\Administrator\Desktop\User List Sync\PMM_Users.csv"

tabcmd export "Tableau_Users_2018/Competitive_Users?:refresh=y" --csv -f "C:\Users\Administrator\Desktop\User List Sync\Competitive_Users.csv"

tabcmd export "Tableau_Users_2018/Financial_Users?:refresh=y" --csv -f "C:\Users\Administrator\Desktop\User List Sync\Financial_Users.csv"

tabcmd export "Tableau_Users_2018/MH_Publishers?:refresh=y" --csv -f "C:\Users\Administrator\Desktop\User List Sync\MH_Publishers.csv"

tabcmd export "Tableau_Users_2018/Channel_Health_Users?:refresh=y" --csv -f "C:\Users\Administrator\Desktop\User List Sync\Channel_Users.csv"

tabcmd export "Tableau_Users_2018/FPA_Publishers?:refresh=y" --csv -f "C:\Users\Administrator\Desktop\User List Sync\FPA_Publishers.csv"

tabcmd export "Tableau_Users_2018/Market_Manager_Users?:refresh=y" --csv -f "C:\Users\Administrator\Desktop\User List Sync\Market_Manager_Users.csv"

tabcmd export "Tableau_Users_2018/GM_Users?:refresh=y" --csv -f "C:\Users\Administrator\Desktop\User List Sync\GM_Users.csv"

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

tabcmd createsiteusers "C:\Users\Administrator\Desktop\User List Sync\Total_Users.csv" --no-complete

tabcmd addusers "PMM Users" --users "C:\Users\Administrator\Desktop\User List Sync\PMM_Users.csv" --no-complete

tabcmd addusers "Financials Users" --users "C:\Users\Administrator\Desktop\User List Sync\Financial_Users.csv" --no-complete

tabcmd addusers "Competitive Users" --users "C:\Users\Administrator\Desktop\User List Sync\Competitive_Users.csv" --no-complete

tabcmd addusers "Market Health Analytics Pubishers" --users "C:\Users\Administrator\Desktop\User List Sync\MH_Publishers.csv" --no-complete

tabcmd addusers "Financial Publishers" --users "C:\Users\Administrator\Desktop\User List Sync\FPA_Publishers.csv" --no-complete

tabcmd addusers "Market Manager Users" --users "C:\Users\Administrator\Desktop\User List Sync\Market_Manager_Users.csv" --no-complete

tabcmd addusers "GM Users" --users "C:\Users\Administrator\Desktop\User List Sync\GM_Users.csv" --no-complete

//tabcmd createusers "C:\Users\Administrator\Desktop\User List Sync\HR_Users.csv" --site "People Analytics" --no-complete


@echo Permissions_Granted
@echo Complete








