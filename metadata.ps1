#Azure IMDS Server URL
$uri = "http://169.254.169.254/metadata/instance?api-version=2021-01-01"

#Capturing Meta-data
$response=Invoke-RestMethod -Headers @{"Metadata"="true"} -Method GET -Proxy $Null -Uri $uri

#Display Specific Meta-data requested
function instancequery {
    $data = Read-Host -Prompt "Which meta-data you want me to display"
    $responseJson = $response.$data | ConvertTo-Json -Depth 10
    Write-Output "$($responseJson)" 
}

instancequery   #Calling function