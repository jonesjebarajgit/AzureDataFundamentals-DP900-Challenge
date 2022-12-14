# Challenge 2: Building Enterprise data estate

**[Home](../README.md)** - [Next Challenge >](./02-Provision.md)

In this exercise you have to provision a data lake, data warehouse and using ADF pipelines load data from both the source systems in Azure SQL and Cosmos DB into the warehouse.

Please refer the following link for the reference architecture on building a [modern data warehouse on Azure](https://learn.microsoft.com/en-us/azure/architecture/example-scenario/data/data-warehouse)


# Instructions:

1. **Create a Data Lake in Azure:**

   a) From the azure portal, search for azure storage account  and provision a Data lake (say (collegename)(group#)adls). 
   
         Tier - Standard
         Redudancy - LRS
         Enable hierarchical namespace = Check
      
   
   b) Once the data lake is provisioned, create a directory "raw" where data from both the source systems (Azure SQL and Cosmos DB) can be landed.
   

2. **Create a Data Warehouse in Azure:**

   a) From the azure portal, search for azure synapse analytics resource and provision a synapse workspace (say (collegename)(group#)synapsews). Ensure that you make a note of the passwords for SQL server login for future references. 
   
   b) Once the synapse workspace is created, provision a Dedicated SQL Pool (DataWarehouse) with 100 DWU capacity. 
   

2. **Ingest the data from Azure SQL DB and Cosmos DB into Azure Data Lake using ADF:**

   a) Within the "Raw" Layer create 2 sub directories called "covidmetrics" and "covidpolicy". Further you have to create sub directories under "covidmetrics" for each file from the Azure SQL DB source ("country", "covid19metrics", "dates")
   
   b) We will have to load the covid metrics data from Azure SQL DB into "covidmetrics" sub directory and covid policy data from cosmos db to "covidpolicy" sub directory using ADF pipeline


3. **Create the target tables in Synapse Data warehouse:** 

   The synapse target table DDL scripts are given at **/setup/Synapse Tables Script.txt**. 
   
   Using Azure Syanpase Studio build the target tables in the Synapse SQL Pool (DW). 


4. **Transformation and Loading:**

   a) Once the target tables in Synapse SQL Pool are ready, extend the same ADF pipeline that was used to load the RAW layer and load data from the Raw Layer to the target tables in Synapse SQL Pool
   
   
   b) Apply the transformations before loading data into the target tables. Ensure proper datatype conversions are inplace before loading data into Target tables. 


## Success Criteria 

1. The team has created a synapse DW Pool successfully
2. Successfully loaded the data from Azure SQL DB and Cosmos DB into the Raw layer in Azure Data Lake
3. Successfully create the tables as given in the DDL scripts
4. The team has created a data pipeline in ADF to load synapse tables from the data in Raw layer
5. Ensure that the tables are loaded properly with the transformations applied

## Learning Resources

### Reference Links

- [How to create a azure data lake gen2 account?](https://learn.microsoft.com/en-us/azure/storage/blobs/create-data-lake-storage-account)
- [How to create a synapse workspace?](https://learn.microsoft.com/en-us/azure/synapse-analytics/quickstart-create-workspace)
- [How to create Synapse SQL DW Pool and query?](https://learn.microsoft.com/en-us/azure/synapse-analytics/sql-data-warehouse/create-data-warehouse-portal)
