
@echo OFF
for /f "tokens=2-4 delims=/ "  %%a in ("%date%") do (set MM=%%a& set DD=%%b& set YYYY=%%c)
set Version="2018.1"
set Binpath="D:\Tableau Server\%version%\bin"
set Uploadpath="E:\Tableau\Backup"
set DateTimeNow=%YYYY%-%MM%-%DD%
set Backupfile=ts_prod_backup_-%DateTimeNow%.tsbak


echo %date% %time%: *** Downloading file %Backupfile% to S3 ***
aws s3 cp s3://tableau-backup-transfer/%Backupfile% %Uploadpath%
timeout 10

echo %date% %time%: *** Starting Restore of %Backupfile% ***
cd %Binpath%
tabadmin restore %Uploadpath%\%Backupfile% --no-config --restart --parallel-pg-restore

echo %date% %time%: *** Restore Complete ***
