Function Start-SQSQueuePolling{
    Param
    (
        [Parameter(Mandatory=$true,
                   ValueFromPipelineByPropertyName=$true,
                   Position=0)]
        [String]$QueueUrl
    )
 
$numofmsg = Get-SQSQueueAttribute -QueueUrl $QueueUrl -AttributeName ApproximateNumberOfMessages
 
    if ($numofmsg.ApproximateNumberOfMessages -gt 0){
 
            Write-Output "Number of messages in the queue to process is approximately $($numofmsg.ApproximateNumberOfMessages)"
 
            While ($numofmsg.ApproximateNumberOfMessages -gt 0) {
            Start-SQSQueueProccessing -SQSQueueUrl $QueueUrl -Verbose
            Start-Sleep -Seconds 5
            $numofmsg = Get-SQSQueueAttribute -QueueUrl $QueueUrl -AttributeName ApproximateNumberOfMessages
            Write-Output "Number of messages is $($numofmsg.ApproximateNumberOfMessages)"
            }
        }else{
            Write-Output "No messages found in the queue to process"
        }
    Write-Output "Done processing SQS Messages in the Queue"
}

function Start-SQSQueueProccessing
{
    [CmdletBinding()]
    [Alias()]
    [OutputType([int])]
    Param
    (
        [Parameter(Mandatory=$true,
                   ValueFromPipelineByPropertyName=$true,
                   Position=0)]
        [String]$SQSQueueUrl
    )
 
    Process
    {
        try
        {
        Write-Verbose "$(Get-Date -Format u) Polling for $SQSQueueUrl messages"
        $recmsg = Receive-SQSMessage -QueueUrl $SQSQueueUrl -MessageCount 10 -MessageAttributeName All
        if ($recmsg) {
            Write-Verbose "$(Get-Date -Format u) ... Messages found in queue...starting to process them"
            $recmsg | ForEach-Object {
                Write-Verbose "$(Get-Date -Format u) ... Processing message $($_.MessageId) that was $($_.Body)" 
				cd "d:\Tableau Server\2018.1\bin"
				.\tabcmd login -s http://localhost -u Admin -p tableauadmin
				.\tabcmd refreshextracts --project "Server Health Dashboards"  --datasource $($_.Body)
				.\tabcmd refreshextracts --project "Data Sources - Business Health"  --datasource $($_.Body)
				.\tabcmd refreshextracts --project "Data Sources - Competitive"  --datasource $($_.Body)
                $_.MessageAttributes | ForEach-Object {
						{
						}
                    }
                Write-Verbose "$(Get-Date -Format u) Done processing $($_.MessageId) that was $($_.Body) attempting message deletion"  
                Remove-SQSMessage -QueueUrl $SQSQueueUrl -ReceiptHandle $_.ReceiptHandle -Force
                }
 
        }else{ Write-Verbose "$(Get-Date -Format u) ... No messages were pulled from the queue...nothing to do right now"}
 
        }
        catch {a
            Write-Error $_
        }
 
    }
 
}