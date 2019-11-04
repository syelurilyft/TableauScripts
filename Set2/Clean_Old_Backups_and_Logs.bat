@echo OFF
 
set "BACKUPPATH=E:\Tableau\Backup"
set "LOGPATH=E:\Tableau\Logs"

echo %date% %time%: *** Clean Old Backups and Logs started ***

E:

cd %LOGPATH%

echo %date% %time%: Cleaning out old log files...

forfiles -p %LOGPATH% -s -m *.zip /D -28 /C "cmd /c del @path"

echo %date% %time%: Cleaning out old backup files...

cd %BACKUPPATH%

forfiles -p %BACKUPPATH% -s -m *.tsbak /D -14 /C "cmd /c del @path"

echo %date% %time%: *** Clean Old Backups and Logs completed ***
