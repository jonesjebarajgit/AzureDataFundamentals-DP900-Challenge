# Initial Setup : Guide

**[Home](../README.md)** - [Next Challenge >](./01-Background.md)

## Setting up Permissions 

Before continuing ensure you understand the permissions needed to run the challenge on your Azure subscription.

Attendees should have Azure subscription permissions which allow the creation of resources in their resource group. Additionally, attendees should have sufficient subscription permissions to create service principals in Azure AD and to register applications in Azure AD. Typically, all that is required is a user account with `Owner` role on their resource group.

## Common Azure Resources

The following is a list of common Azure resources that are required and utilized during the challenge. 

Ensure that these services are not blocked by Azure Policy.  As this is an open hack, the services that attendees can utilize are not limited to this list so subscriptions with a tightly controlled service catalog may run into issues if the service an attendee wishes to use is disabled via policy.

| Azure resource           | Resource Providers |
| ------------------------ | --------------------------------------- |
| Azure Cosmos DB          | Microsoft.DocumentDB 
| Azure Data Factory       | Microsoft.DataFactory                   |
| Azure SQL Database       | Microsoft.SQL                           |
| Azure Storage            | Microsoft.Storage                       |
| Azure Data Lake Store    | Microsoft.DataLakeStore                 |
| Azure Synapse            | Microsoft.Synapse                       |


## Deployment Instructions 

1. Login to Azure Portal and create a new **resource group** where you can create all the resources needed for this challenge. 

   ```
   Lets say <collegename>-group#-rg 
   Eg: megha-group1-rg
   ```

2. Create SQL Database Server (logical) and load the database from the given dacpac file. 

    ```
    a) Create SQL Database Server (logical) into the new created resource group. Name the SQL Database Server as **<collegename><group#>sqlserver**. Please note that this is a empty logical server with no database in it.
    b) Once the SQL Database Server is created, under the **"Overview"** section, use the **"Import database"** feature and load the backup data in the dacpac file   into SQL Database Server. Name the database as **"covid19"**
    ```

3. Create a new Cosmos DB for NoSQL account with naming convension **<collegename><group#>cosmosdb**. Add a new container called **"covid19"** with autoscale database max RU/s set to 400. 

4. Load the csv file **"covid_policy_tracker.csv"** into the Cosmos DB container **"covid19"** using Azure Data Factory 

    ```
    a) Create a new Azure data factory instance in your resoruce group (say **<collegename><group#>adf**). 
    b) Launch the data factory studio and use the copy data tool feature to load the data in the **"covid_policy_tracker.csv"** to cosmosdb **"covid19"** container.
     
    ```

5. Now  you have covid data in both Azure SQL (structured) and in Cosmos db (semi structured). These will act as 2 sources of data in this challenge. 
   
