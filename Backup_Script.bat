
@echo OFF
for /f "tokens=2-4 delims=/ "  %%a in ("%date%") do (set MM=%%a& set DD=%%b& set YYYY=%%c)
set Version="2018.1"
set Binpath="D:\Tableau Server\%version%\bin"
set Backuppath="E:\Tableau\Backup"
set DateTimeNow=%YYYY%-%MM%-%DD%
set Backupfile=%Backuppath%\ts_prod_backup_-%DateTimeNow%.tsbak

echo %date% %time%: *** Housekeeping started ***
echo %date% %time%: *** Changing Directory ***
cd %Binpath%

echo %date% %time%: *** Backup Starting ***
echo %date% %time%: *** Backup Starting ***
tabadmin backup %Backupfile%
timeout 5

echo %date% %time%: *** Uploading file %Backupfile% to S3 ***
aws s3 cp "%Backupfile%"  s3://tableau-backup-transfer/
timeout 10

echo %date% %time%: *** Housekeeping completed ***