@echo off

cd d:\Tableau Server\10.5\bin

tabcmd login -s http://localhost -u Admin -p tableauadmin

tabcmd export "Tableau_Users/Total_Server_Users" --csv -f "C:\Users\Administrator\Desktop\User List Sync\Total_Users.csv"

tabcmd export "Tableau_Users/PMM_Users" --csv -f "C:\Users\Administrator\Desktop\User List Sync\PMM_Users.csv"

tabcmd export "Tableau_Users/Competitive_Users" --csv -f "C:\Users\Administrator\Desktop\User List Sync\Competitive_Users.csv"

tabcmd export "Tableau_Users/Financial_Users" --csv -f "C:\Users\Administrator\Desktop\User List Sync\Financial_Users.csv"

tabcmd export "Tableau_Users/MH_Publishers" --csv -f "C:\Users\Administrator\Desktop\User List Sync\MH_Publishers.csv"

tabcmd export "Tableau_Users/Channel_Health_Users" --csv -f "C:\Users\Administrator\Desktop\User List Sync\Channel_Users.csv"

tabcmd export "Tableau_Users/FPA_Publishers" --csv -f "C:\Users\Administrator\Desktop\User List Sync\FPA_Publishers.csv"

tabcmd export "Tableau_Users/Market_Manager_Users" --csv -f "C:\Users\Administrator\Desktop\User List Sync\Market_Manager_Users.csv"

tabcmd export "Tableau_Users/GM_Users" --csv -f "C:\Users\Administrator\Desktop\User List Sync\GM_Users.csv"

tabcmd export "Tableau_Users/RD_Users" --csv -f "C:\Users\Administrator\Desktop\User List Sync\RD_Users.csv"

@echo Done

