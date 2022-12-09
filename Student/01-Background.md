# Building Enterprise data estate

**[Home](../README.md)** - [Next Challenge >](./02-Provision.md)

In this exercise you have to provision a data warehouse and using ADF pipelines load data from both the source systems in Azure SQL and Cosmos DB into the warehouse.


# Instructions:

1. **Create a Data Warehouse in Azure:**

   a) From the azure portal, search for azure synapse analytics resource and provision a synapse workspace (say (collegename)(group#)synapsews). Please note that you will have to create a data lake as well. Ensure that you make a note of the passwords for SQL server login for future references. 
   
   b) Once the synapse workspace is created, provision a SQL DW Pool with 100 DWU capacity. 

2. **Ingest the data from Azure SQL DB and Cosmos DB into Azure Data Lake using ADF:**

   a) create a new directory in Azure Data Lake called "Raw". And then within raw create 2 sub directories called "covidmetrics" and "covidpolicy". 
   
   b) We will have to load the covid metrics data from Azure SQL DB into "covidmetrics" sub directory and covid policy data from cosmos db to "covidpolicy" sub directory using ADF pipeline

3. Create the target tables in Synapse Data warehouse as per the DDL scripts provided. 


4. Transformation and Loading

   a) Once the target tables in Synapse SQL DW Pool are ready, using a ADF pipeline load them from the data in the Raw layer in Data Lake
   
   b) Apply the transformations before loading data into the target tables. Transformations are given in the reference mapping docuemnt 


## Success Criteria 

1. The team has created a synapse DW Pool successfully
2. Successfully loaded the data from Azure SQL DB and Cosmos DB into the Raw layer in Azure Data Lake
3. Successfully create the tables as given in the DDL scripts
4. The team has created a data pipeline in ADF to load synapse tables from the data in Raw layer
5. Ensure that the tables are loaded properly with the transformations applied
