@echo off

cd d:\Tableau\Tableau Server\10.5\bin

tabcmd publish "C:\Users\Administrator\Downloads\Business Health 17Q4-test.twb"  -s http://localhost:9417 -U eroberts -p lyftslalomtest

@echo Done

