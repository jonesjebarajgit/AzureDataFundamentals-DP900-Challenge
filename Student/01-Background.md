# Building Enterprise data estate

**[Home](../README.md)** - [Next Challenge >](./02-Provision.md)

In this exercise you have to provision a data warehouse and using ADF pipelines load data from both the source systems in Azure SQL and Cosmos DB into the warehouse.


# Provision a Synapse DW Pool for Data Warehouse enviornment:

From the azure portal, search for azure synapse analytics resource and provision a synapse workspace (say <collegename><group#>synapsews). Please note that you will have to create a data lake as well. Ensure that you make a note of the passwords for SQL server login.

Once the synapse workspace is created, provision a SQL DW Pool with 100 DWU capacity. 


## Success Criteria 

1. The team has created a synapse DW Pool successfully
2. Once the DW Pool is created, create the tables as given in the DDL scripts
3. The team has created a data pipeline in ADF to load synapse tables from the source tables in Azure SQL and Cosmos DB
4. Ensure that the tables are loaded properly
