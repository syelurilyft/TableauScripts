@echo Granting_Permissions
d:
cd d:\Tableau Server\2018.1\bin

tabcmd login -s http://localhost -u Admin -p tableauadmin
tabcmd addusers "Enterprise_All" --users "C:\Users\Administrator\Desktop\User List Sync\Enterprise_All.csv" --no-complete

@echo Permissions_Granted
@echo Complete