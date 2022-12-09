# Initial Setup

**[Home](../README.md)** - [Next Challenge >](./01-Background.md)

## Setting up Permissions 

Before continuing ensure you understand the permissions needed to run the challenge on your Azure subscription.

Attendees should have Azure subscription permissions which allow the creation of resources in their resource group. Additionally, attendees should have sufficient subscription permissions to create service principals in Azure AD and to register applications in Azure AD. Typically, all that is required is a user account with `Owner` role on their resource group.

## Common Azure Resources and naming convensions

The following is a list of common Azure resources that are required and utilized during the challenge. Ensure that you follow the below standard naming convensions for creating these resources to avoid naming conflicts with your fellow teams.

| Azure resource           | Naming Convensions |
| ------------------------ | --------------------------------------- |
| Azure Cosmos DB          | (collegename)(group#)cosmosdb           |
| Azure Data Factory       | <collegename>group#adf                |
| Azure SQL Database       | <collegename>group#sqldb              |
| Azure Storage            | <collegename>group#storageac          |
| Azure Data Lake Store    | <collegename>group#adls               |
| Azure Synapse            | <collegename>group#synapsews          |

## Deployment Instructions

   Login to Azure Portal and create the below resources that we will be using in this challenge. Ensure you follow the standard naming convension.
   
1. Create a Resource Group: Create a new **resource group** where you can create all the resources needed for this challenge. 

   ```
   Lets say <collegename>-group#-rg 
   Eg: megha-group1-rg
   ```

2. Create SQL Database Server (logical) and load the database from the given dacpac file. 

    ```
    a) Create SQL Database Server (logical) into the new created resource group. Name the SQL Database Server as <collegename><group#>sqlserver. Please note that this is a empty logical server with no database in it.
    b) Once the SQL Database Server is created, under the "Overview" section, use the "Import database" feature and load the backup data in the dacpac file into SQL Database Server. Name the database as "covid19".
    ```

3. Create a new Cosmos DB for NoSQL account (say **"<collegename><group#>cosmosdb"**). Add a new container called **"covid19"** with autoscale database max RU/s set to 400. 

4. Load the csv file **"covid_policy_tracker.csv"** into the Cosmos DB container **"covid19"** using Azure Data Factory 

    ```
    a) Create a new Azure data factory instance in your resoruce group (say <collegename><group#>adf). 
    b) Launch the data factory studio and use the copy data tool feature to load the data in the **"covid_policy_tracker.csv"** to cosmosdb "covid19" container.
     
    ```

5. Now  you have covid data in both Azure SQL (structured) and in Cosmos db (semi structured). These will act as 2 sources of data in this challenge. 
   
