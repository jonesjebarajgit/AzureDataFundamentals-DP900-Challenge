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
   
   b) Once the storage account is provisioned, upload both the below files from AzureDataFundamentals/setup/LabDeployment/data.
   
      covid19.bacpac
      covid_policy_tracker.csv

   This storage account is from where we will forklift both these files to Azure SQL DB and Cosmos DB respectively.
   
3. **Create SQL Database Server (logical) and load the database from the given dacpac file:** 

    a) Create SQL Database Server (logical) within the newly created resource group. Name the SQL Database Server as (collegename)(group#)sqlserver. Please note that this is a empty logical server with no database in it yet.
    b) Once the SQL Database Server is created, under the "Overview" section, use the "Import database" feature and load the backup data in the dacpac file (from storage account) into SQL Database Server. Name the database as "covid19".
    c) Download and Install Azure data Studio in your laptop / desktop. We will use Azure Data Studio to access and query data in databases
    d) From Azure data studio connect to your SQL database and ensure the data is properly loaded.

    ```
    Ensure the below 3 tables are loaded and available 
      dbo.Country
      dbo.Covid19_Metrics
      dbo.Dates
    ```

4. **Create a Azure Data Factory:**

   Create a Azure Data Factory instance within your resource group. We will use Data Factory service to 
   
   1. Copy data from Azure Storage account (covid_policy_tracker.csv) to Cosmos DB for NoSQL account
   2. To move data from Azure SQL and Cosmos DB to Azure Data Lake and then to Synapse DW Pool with transformations

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
   3. Successful creation and loading of Azure SQL database with Covid19 data from dacpac file
   4. Successful creation and loading of Cosmos DB for NoSQL account with CSV file
   5. Successful creation of Azure Data factory pipeline to load Cosmos DB data
   
## Learning Resources

### Ramp Up

- [What is a Azure Resource Group?](https://docs.microsoft.com/en-us/azure/architecture/data-guide/scenarios/data-lake](https://learn.microsoft.com/en-us/azure/azure-resource-manager/management/manage-resource-groups-portal#what-is-a-resource-group)
- [Data Lakes and Data Warehouses: Why You Need Both](https://www.arcadiadata.com/blog/data-lakes-and-data-warehouses-why-you-need-both/)

### Choose Your Tools
- [What is Azure Synapse](https://docs.microsoft.com/en-us/azure/synapse-analytics/overview-what-is)
- [Introduction to Azure Data Lake Storage Gen2](https://docs.microsoft.com/en-us/azure/storage/blobs/data-lake-storage-introduction)
- [What is Azure Blob storage?](https://docs.microsoft.com/en-us/azure/storage/blobs/storage-blobs-overview)

### Dive In

- [Quickstart: Create an Azure Data Lake Storage Gen2 storage account](https://docs.microsoft.com/en-us/azure/storage/blobs/data-lake-storage-quickstart-create-account)
- [Get started with Azure Data Lake Storage Gen1 using the Azure portal](https://docs.microsoft.com/en-us/azure/data-lake-store/data-lake-store-get-started-portal)
- [Create a storage account](https://docs.microsoft.com/en-us/azure/storage/common/storage-quickstart-create-account?toc=%2Fazure%2Fstorage%2Fblobs%2Ftoc.json&tabs=azure-portal)
