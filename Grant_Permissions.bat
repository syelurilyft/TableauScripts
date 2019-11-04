@echo off

cd d:\Tableau Server\10.5\bin

tabcmd login -s http://localhost -u Admin -p tableauadmin

tabcmd createusers "C:\Users\Administrator\Desktop\User List Sync\Total_Users.csv" --no-complete

tabcmd createsiteusers "C:\Users\Administrator\Desktop\User List Sync\Total_Users.csv" --no-complete

tabcmd addusers "PMM Users" --users "C:\Users\Administrator\Desktop\User List Sync\PMM_Users.csv" --no-complete

tabcmd addusers "Financials Users" --users "C:\Users\Administrator\Desktop\User List Sync\Financial_Users.csv" --no-complete

tabcmd addusers "Competitive Users" --users "C:\Users\Administrator\Desktop\User List Sync\Competitive_Users.csv" --no-complete

tabcmd addusers "Market Health Analytics Pubishers" --users "C:\Users\Administrator\Desktop\User List Sync\MH_Publishers.csv" --no-complete

tabcmd addusers "Financial Publishers" --users "C:\Users\Administrator\Desktop\User List Sync\FPA_Publishers.csv" --no-complete

@echo Done