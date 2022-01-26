param (
    [string]$databaseName = "covid19",
    [string]$covid19BaseUri = "https://github.com/jonesjebarajgit/AzureAnalyticsOH/tree/main/setup/LabDeployment",
    [string]$databaseBackupName = "covid19.bak",
    [string]$sqlUserName = "sqladmin",
    [string]$sqlPassword = "Password.1!!",
    [string]$cosmosDBConnectionString = "AccountEndpoint=https://covid19-cosmosdb-k6xqmi3m5rdi4.documents.azure.com:443/;AccountKey=gx7aFPXQstfRS8K3GarO5vrWz4BlSHQNVdO8upGyKIAaiyxMmoUberZFwgyj8xKCfDtpq0tXcUl9lyKEJgUNOw==;",
    [string]$cosmosDBDatabaseName = "covid19"
)

$dataFolder = "data/"
$covidFileName = "covid_policy_tracker.csv"

[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
Invoke-WebRequest -Uri https://www.microsoft.com/en-us/download/details.aspx?id=46436 -OutFile dt-1.7.zip
Expand-Archive -Path dt-1.7.zip -DestinationPath .
$dtutil = Get-ChildItem -Recurse | Where-Object { $_.Name -ieq "Dt.exe" }
$env:path += ";$($dtutil.DirectoryName)"
$azcopy = Get-ChildItem -Recurse | Where-Object { $_.Name -ieq "azcopy.exe" }
$env:path += ";$($azcopy.DirectoryName)"

Invoke-WebRequest -Uri "$($covid19BaseUri)$($dataFolder)$($covidFileName)" -OutFile $($covidFileName)
dt.exe /s:CsvFile /s.Files:.\$($covidFileName) /t:DocumentDBBulk /t.ConnectionString:"$($cosmosDBConnectionString);Database=$($cosmosDBDatabaseName)" /t.Collection:covidpolicy /t.CollectionThroughput:10000
