@echo OFF
 
 FOR /f "tokens=1-8 delims=:./ " %%G IN ("%date%_%time%") DO (
SET datetimev=%%H_%%I_%%J_%%K
)
 
set VERSION=2018.1
set "BINPATH=D:\Tableau Server\2018.1\bin"
set "LOGPATH=E:\Tableau\Logs"
set SAVESTAMP=%DATE:/=-%


echo %date% %time%: *** Log Cleanup started ***

cd %BINPATH%

echo %date% %time%: *** Stopping Service ***
tabadmin stop

echo %date% %time%: Backing up log files...
tabadmin ziplogs -l -n -f

echo %date% %time%: Moving Files log files...
move logs.zip %LOGPATH%\logs-%datetimev%.zip

echo %date% %time%: Running cleanup and starting Tableau server...
tabadmin cleanup
tabadmin start

echo %date% %time%: *** Log Cleanup completed ***