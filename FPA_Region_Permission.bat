@echo off

D:

cd d:\Tableau Server\2018.1\bin

tabcmd login -s http://localhost -t Server -u Admin -p tableauadmin 

tabcmd export "FPAGroupMembership/FPA_00?:refresh=yes" --csv -f "C:\Users\Administrator\Desktop\User List Sync\FP&A_Users\FP&A_00.csv"
tabcmd export "FPAGroupMembership/FPA_01?:refresh=yes" --csv -f "C:\Users\Administrator\Desktop\User List Sync\FP&A_Users\FP&A_01.csv"
tabcmd export "FPAGroupMembership/FPA_02?:refresh=yes" --csv -f "C:\Users\Administrator\Desktop\User List Sync\FP&A_Users\FP&A_02.csv"
tabcmd export "FPAGroupMembership/FPA_03?:refresh=yes" --csv -f "C:\Users\Administrator\Desktop\User List Sync\FP&A_Users\FP&A_03.csv"
tabcmd export "FPAGroupMembership/FPA_04?:refresh=yes" --csv -f "C:\Users\Administrator\Desktop\User List Sync\FP&A_Users\FP&A_04.csv"
tabcmd export "FPAGroupMembership/FPA_05?:refresh=yes" --csv -f "C:\Users\Administrator\Desktop\User List Sync\FP&A_Users\FP&A_05.csv"
tabcmd export "FPAGroupMembership/FPA_06?:refresh=yes" --csv -f "C:\Users\Administrator\Desktop\User List Sync\FP&A_Users\FP&A_06.csv"
tabcmd export "FPAGroupMembership/FPA_07?:refresh=yes" --csv -f "C:\Users\Administrator\Desktop\User List Sync\FP&A_Users\FP&A_07.csv"
tabcmd export "FPAGroupMembership/FPA_08?:refresh=yes" --csv -f "C:\Users\Administrator\Desktop\User List Sync\FP&A_Users\FP&A_08.csv"
tabcmd export "FPAGroupMembership/FPA_09?:refresh=yes" --csv -f "C:\Users\Administrator\Desktop\User List Sync\FP&A_Users\FP&A_09.csv"
tabcmd export "FPAGroupMembership/FPA_10?:refresh=yes" --csv -f "C:\Users\Administrator\Desktop\User List Sync\FP&A_Users\FP&A_10.csv"
tabcmd export "FPAGroupMembership/FPA_11?:refresh=yes" --csv -f "C:\Users\Administrator\Desktop\User List Sync\FP&A_Users\FP&A_11.csv"
tabcmd export "FPAGroupMembership/FPA_12?:refresh=yes" --csv -f "C:\Users\Administrator\Desktop\User List Sync\FP&A_Users\FP&A_12.csv"
tabcmd export "FPAGroupMembership/FPA_13?:refresh=yes" --csv -f "C:\Users\Administrator\Desktop\User List Sync\FP&A_Users\FP&A_13.csv"
tabcmd export "FPAGroupMembership/FPA_14?:refresh=yes" --csv -f "C:\Users\Administrator\Desktop\User List Sync\FP&A_Users\FP&A_14.csv"
tabcmd export "FPAGroupMembership/FPA_15?:refresh=yes" --csv -f "C:\Users\Administrator\Desktop\User List Sync\FP&A_Users\FP&A_15.csv"
tabcmd export "FPAGroupMembership/FPA_16?:refresh=yes" --csv -f "C:\Users\Administrator\Desktop\User List Sync\FP&A_Users\FP&A_16.csv"
tabcmd export "FPAGroupMembership/FPA_17?:refresh=yes" --csv -f "C:\Users\Administrator\Desktop\User List Sync\FP&A_Users\FP&A_17.csv"
tabcmd export "FPAGroupMembership/FPA_18?:refresh=yes" --csv -f "C:\Users\Administrator\Desktop\User List Sync\FP&A_Users\FP&A_18.csv"
tabcmd export "FPAGroupMembership/FPA_19?:refresh=yes" --csv -f "C:\Users\Administrator\Desktop\User List Sync\FP&A_Users\FP&A_19.csv"

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

tabcmd removeusers "FP&A_Region_Group_00" --users "C:\Users\Administrator\Desktop\User List Sync\FP&A_Users\Current_Users\FP&A_00.csv" --no-complete
tabcmd addusers "FP&A_Region_Group_00" --users "C:\Users\Administrator\Desktop\User List Sync\FP&A_Users\FP&A_00.csv" --no-complete

tabcmd removeusers "FP&A_Region_Group_01" --users "C:\Users\Administrator\Desktop\User List Sync\FP&A_Users\Current_Users\FP&A_01.csv" --no-complete
tabcmd addusers "FP&A_Region_Group_01" --users "C:\Users\Administrator\Desktop\User List Sync\FP&A_Users\FP&A_01.csv" --no-complete

tabcmd removeusers "FP&A_Region_Group_02" --users "C:\Users\Administrator\Desktop\User List Sync\FP&A_Users\Current_Users\FP&A_02.csv" --no-complete
tabcmd addusers "FP&A_Region_Group_02" --users "C:\Users\Administrator\Desktop\User List Sync\FP&A_Users\FP&A_02.csv" --no-complete

tabcmd removeusers "FP&A_Region_Group_03" --users "C:\Users\Administrator\Desktop\User List Sync\FP&A_Users\Current_Users\FP&A_03.csv" --no-complete
tabcmd addusers "FP&A_Region_Group_03" --users "C:\Users\Administrator\Desktop\User List Sync\FP&A_Users\FP&A_03.csv" --no-complete

tabcmd removeusers "FP&A_Region_Group_04" --users "C:\Users\Administrator\Desktop\User List Sync\FP&A_Users\Current_Users\FP&A_04.csv" --no-complete
tabcmd addusers "FP&A_Region_Group_04" --users "C:\Users\Administrator\Desktop\User List Sync\FP&A_Users\FP&A_04.csv" --no-complete

tabcmd removeusers "FP&A_Region_Group_05" --users "C:\Users\Administrator\Desktop\User List Sync\FP&A_Users\Current_Users\FP&A_05.csv" --no-complete
tabcmd addusers "FP&A_Region_Group_05" --users "C:\Users\Administrator\Desktop\User List Sync\FP&A_Users\FP&A_05.csv" --no-complete

tabcmd removeusers "FP&A_Region_Group_06" --users "C:\Users\Administrator\Desktop\User List Sync\FP&A_Users\Current_Users\FP&A_06.csv" --no-complete
tabcmd addusers "FP&A_Region_Group_06" --users "C:\Users\Administrator\Desktop\User List Sync\FP&A_Users\FP&A_06.csv" --no-complete

tabcmd removeusers "FP&A_Region_Group_07" --users "C:\Users\Administrator\Desktop\User List Sync\FP&A_Users\Current_Users\FP&A_07.csv" --no-complete
tabcmd addusers "FP&A_Region_Group_07" --users "C:\Users\Administrator\Desktop\User List Sync\FP&A_Users\FP&A_07.csv" --no-complete

tabcmd removeusers "FP&A_Region_Group_08" --users "C:\Users\Administrator\Desktop\User List Sync\FP&A_Users\Current_Users\FP&A_08.csv" --no-complete
tabcmd addusers "FP&A_Region_Group_08" --users "C:\Users\Administrator\Desktop\User List Sync\FP&A_Users\FP&A_08.csv" --no-complete

tabcmd removeusers "FP&A_Region_Group_09" --users "C:\Users\Administrator\Desktop\User List Sync\FP&A_Users\Current_Users\FP&A_09.csv" --no-complete
tabcmd addusers "FP&A_Region_Group_09" --users "C:\Users\Administrator\Desktop\User List Sync\FP&A_Users\FP&A_09.csv" --no-complete

tabcmd removeusers "FP&A_Region_Group_10" --users "C:\Users\Administrator\Desktop\User List Sync\FP&A_Users\Current_Users\FP&A_10.csv" --no-complete
tabcmd addusers "FP&A_Region_Group_10" --users "C:\Users\Administrator\Desktop\User List Sync\FP&A_Users\FP&A_10.csv" --no-complete

tabcmd removeusers "FP&A_Region_Group_11" --users "C:\Users\Administrator\Desktop\User List Sync\FP&A_Users\Current_Users\FP&A_11.csv" --no-complete
tabcmd addusers "FP&A_Region_Group_11" --users "C:\Users\Administrator\Desktop\User List Sync\FP&A_Users\FP&A_11.csv" --no-complete

tabcmd removeusers "FP&A_Region_Group_12" --users "C:\Users\Administrator\Desktop\User List Sync\FP&A_Users\Current_Users\FP&A_12.csv" --no-complete
tabcmd addusers "FP&A_Region_Group_12" --users "C:\Users\Administrator\Desktop\User List Sync\FP&A_Users\FP&A_12.csv" --no-complete

tabcmd removeusers "FP&A_Region_Group_13" --users "C:\Users\Administrator\Desktop\User List Sync\FP&A_Users\Current_Users\FP&A_13.csv" --no-complete
tabcmd addusers "FP&A_Region_Group_13" --users "C:\Users\Administrator\Desktop\User List Sync\FP&A_Users\FP&A_13.csv" --no-complete

tabcmd removeusers "FP&A_Region_Group_14" --users "C:\Users\Administrator\Desktop\User List Sync\FP&A_Users\Current_Users\FP&A_14.csv" --no-complete
tabcmd addusers "FP&A_Region_Group_14" --users "C:\Users\Administrator\Desktop\User List Sync\FP&A_Users\FP&A_14.csv" --no-complete

tabcmd removeusers "FP&A_Region_Group_15" --users "C:\Users\Administrator\Desktop\User List Sync\FP&A_Users\Current_Users\FP&A_15.csv" --no-complete
tabcmd addusers "FP&A_Region_Group_15" --users "C:\Users\Administrator\Desktop\User List Sync\FP&A_Users\FP&A_15.csv" --no-complete

tabcmd removeusers "FP&A_Region_Group_16" --users "C:\Users\Administrator\Desktop\User List Sync\FP&A_Users\Current_Users\FP&A_16.csv" --no-complete
tabcmd addusers "FP&A_Region_Group_16" --users "C:\Users\Administrator\Desktop\User List Sync\FP&A_Users\FP&A_16.csv" --no-complete

tabcmd removeusers "FP&A_Region_Group_17" --users "C:\Users\Administrator\Desktop\User List Sync\FP&A_Users\Current_Users\FP&A_17.csv" --no-complete
tabcmd addusers "FP&A_Region_Group_17" --users "C:\Users\Administrator\Desktop\User List Sync\FP&A_Users\FP&A_17.csv" --no-complete

tabcmd removeusers "FP&A_Region_Group_18" --users "C:\Users\Administrator\Desktop\User List Sync\FP&A_Users\Current_Users\FP&A_18.csv" --no-complete
tabcmd addusers "FP&A_Region_Group_18" --users "C:\Users\Administrator\Desktop\User List Sync\FP&A_Users\FP&A_18.csv" --no-complete

tabcmd removeusers "FP&A_Region_Group_19" --users "C:\Users\Administrator\Desktop\User List Sync\FP&A_Users\Current_Users\FP&A_19.csv" --no-complete
tabcmd addusers "FP&A_Region_Group_19" --users "C:\Users\Administrator\Desktop\User List Sync\FP&A_Users\FP&A_19.csv" --no-complete


@echo Permissions_Granted

@echo Moving Files

C:
cd C:\
move "C:\Users\Administrator\Desktop\User List Sync\FP&A_Users\*.csv" "C:\Users\Administrator\Desktop\User List Sync\FP&A_Users\Current_Users\"

@echo Permissions_Granted
@echo Complete
EXIT





