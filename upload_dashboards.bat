d:

cd D:\Tableau Server\2018.1\bin
tabcmd login  -s http://localhost -u Admin -p tableauadmin

tabcmd publish "D:\Tableau_Workbooks\Channel Health Dashboards.twbx" -n "Channel Health Dashboards " -r "Channel Health" -o

//tabcmd publish "D:\Tableau_Workbooks\Q3 2018 GM Dashboard.twbx" -r "FP&A Analytics" -o