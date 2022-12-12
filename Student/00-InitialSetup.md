# Challenge 1: Initial Setup

**[Home](../README.md)** - [Next Challenge >](./01-Background.md)

## Setting up Permissions 

Before continuing ensure you understand the permissions needed to run the challenge on your Azure subscription.

Attendees should have Azure subscription permissions which allow the creation of resources in their resource group. Additionally, attendees should have sufficient subscription permissions to create service principals in Azure AD and to register applications in Azure AD. Typically, all that is required is a user account with `Owner` role on their resource group.

## Common Azure Resources and naming convensions

The following is a list of common Azure resources that are required and utilized during the challenge. Ensure that you follow the below standard naming convensions for creating these resources to avoid naming conflicts with your fellow teams.

| Azure resource           | Naming Convensions |
| ------------------------ | --------------------------------------- |
| Azure Cosmos DB          | (collegename)(group#)cosmosdb           |
| Azure Data Factory       | (collegename)(group#)adf                |
| Azure SQL Database       | (collegename)(group#)sqldb              |
| Azure Storage            | (collegename)(group#)storageac          |
| Azure Data Lake Store    | (collegename)(group#)adls               |
| Azure Synapse            | (collegename)(group#)synapsews          |

## Deployment Instructions

   Login to Azure Portal and create the below resources that we will be using in this challenge. Ensure you follow the standard naming convension.
   
1. **Create a Resource Group:** Create a new **resource group** where you can create all the resources needed for this challenge. 

   ```
   Lets say <collegename>-group#-rg 
   Eg: megha-group1-rg
   ```

2. **Create a Azure Storage Account and upload files:**

   a) Create a Azure storage account within the newly created reource group. 
   
      Parameters to consider:
      
         Performance Tier: Standard
         Redundancy: LRS

         Rest all properties can be to be default.
      
   b) Once the storage account is provisioned, create a new container called **"sourcefiles"** and upload both the below files from AzureDataFundamentals/setup/LabDeployment/data.
   
         covid19.bacpac 
      
         covid_policy_tracker.csv

   This storage account is from where we will forklift both these files to Azure SQL DB and Cosmos DB respectively.
   
3. **Create SQL Database Server (logical) and load the database from the given bacpac file:** 

    a) Create SQL Database Server (logical) within the newly created resource group. Name the SQL Database Server as (collegename)(group#)sqlserver. Please note that this is a empty logical server with no database in it yet. 
    
    b) Once the SQL Database Server is created, under the "Overview" section, use the "Import database" feature and load the backup data in the bacpac file (from storage account) into SQL Database Server. 
    
         Database Name: covid19
         SKU: Standard (DTU = 10, Max Data Size = 250 GB)
              
    c) Download and Install Azure data Studio in your laptop / desktop. We will use Azure Data Studio to access and query data in databases.
    
    
    [Azure Data Studio Download and Install](https://learn.microsoft.com/en-us/sql/azure-data-studio/download-azure-data-studio?view=sql-server-ver16)
    
    
    d) From Azure data studio connect to your SQL database "covid19" and ensure the connection is successful and you are able to query the data.

    ```
    Ensure the below 3 tables are loaded and available 
      dbo.Country
      dbo.Covid19_Metrics
      dbo.Dates
    ```

4. **Create a Azure Data Factory:**

   Create a Azure Data Factory instance within your resource group. We will use Data Factory service to 
   
   a) Copy data from Azure Storage account (covid_policy_tracker.csv) to Cosmos DB for NoSQL account
   
   b) To move data from Azure SQL and Cosmos DB to Azure Data Lake and then to Synapse DW Pool with transformations

5. **Create a new Cosmos DB for NoSQL account:** 

   Create a Cosmos DB for NoSQL and Add a new container called **"covid19"** with autoscale database max RU/s set to 400. 

6. **Load the csv file into the Cosmos DB:**

   Load the csv file **"covid_policy_tracker.csv"** into the Cosmos DB container **"covid19"** using Azure Data Factory 

      a) Launch the data factory studio and use the copy data tool feature to load the data in the **"covid_policy_tracker.csv"** to cosmosdb "covid19" container. 
      
      b) Please note that the data in source is of CSV format and needs to be converted to JSON when loaded into Cosmos DB container
        
7. **Your Source Data is Ready now:** Now that you have covid data in both Azure SQL (structured) and in Cosmos db (semi structured), these will act as 2 sources of data in this challenge. 


## Success Criteria

   The below tasks should have been completed towards the end of this challenge
   
   1. Successful create of a resource group to host all your resources in this challenge
   2. Successful creation of Azure storage account with datasets 
   3. Successful creation and loading of Azure SQL database with Covid19 data from bacpac file
   4. Successful creation and loading of Cosmos DB for NoSQL account with CSV file
   5. Successful creation of Azure Data factory pipeline to load Cosmos DB data
   
## Learning Resources

### Reference Documentations

- [What is a Azure Resource Group?](https://learn.microsoft.com/en-us/azure/azure-resource-manager/management/manage-resource-groups-portal#what-is-a-resource-group)
- [How to create a Storage Account in Azure?](https://learn.microsoft.com/en-us/azure/storage/common/storage-account-create?tabs=azure-portal)
- [How to create a Container in Azure Storage Account?](https://learn.microsoft.com/en-us/azure/storage/blobs/blob-containers-portal)
- [How to Import Database from bacpac file into SQL Server?](https://learn.microsoft.com/en-us/azure/azure-sql/database/database-import?view=azuresql&tabs=azure-powershell#using-azure-portal)
- [How to connect and query Azure SQL DB from Azure Data Studio?](https://learn.microsoft.com/en-us/sql/azure-data-studio/quickstart-sql-database?view=sql-server-ver16)
- [How to create a Azure Data Factory?](https://learn.microsoft.com/en-us/azure/data-factory/quickstart-create-data-factory)
- 
