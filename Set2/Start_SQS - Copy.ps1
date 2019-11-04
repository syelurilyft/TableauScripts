Import-Module AWSPowerShell
. "$env:d:\Scripts\SQS_Polling.ps1"
Start-Transcript -Path "$env:d:\Scripts\OurSQSPollingLog.txt" -NoClobber -Append
Start-SQSQueuePolling -QueueUrl 	https://sqs.us-east-1.amazonaws.com/770664903276/Tableau-Web