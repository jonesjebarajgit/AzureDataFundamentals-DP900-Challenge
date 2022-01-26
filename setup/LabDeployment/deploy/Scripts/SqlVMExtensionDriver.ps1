param (
    [string]$ohmdwSqlserverName = "covid19-sqlserver-k6xqmi3m5rdi4",    
    [string]$databaseName = "covid19",
    [string]$covid19BaseUri = "https://github.com/jonesjebarajgit/AzureAnalyticsOH/tree/main/setup/LabDeployment",
    [string]$databaseDacPacName = "covid19.bacpac",
    [string]$databaseBackupName = "covid19.bak",
    [string]$sqlUserName = "sqladmin",
    [string]$sqlPassword = "Password.1!!",
    [string]$cosmosDBConnectionString = "AccountEndpoint=https://covid19-cosmosdb-k6xqmi3m5rdi4.documents.azure.com:443/;AccountKey=gx7aFPXQstfRS8K3GarO5vrWz4BlSHQNVdO8upGyKIAaiyxMmoUberZFwgyj8xKCfDtpq0tXcUl9lyKEJgUNOw==;",
    [string]$cosmosDBDatabaseName = "covid19"
)

.\DeploySQLVM.ps1 -ohmdwSqlserverName $ohmdwSqlserverName `
    -databaseName $databaseName `
    -covid19BaseUri $covid19BaseUri `
    -databaseDacPacName $databaseDacPacName `
    -databaseBackupName $databaseBackupName `
    -sqlUserName $sqlUserName `
    -sqlPassword $sqlPassword

.\DeployCosmosDB.ps1 -databaseName $databaseName `
    -covid19BaseUri $covid19BaseUri `
    -databaseBackupName $databaseBackupName `
    -sqlUserName $sqlUserName `
    -sqlPassword $sqlPassword `
    -cosmosDBConnectionString $cosmosDBConnectionString `
    -cosmosDBDatabaseName $cosmosDBDatabaseName

.\DisableIEESC.ps1