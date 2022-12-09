
# Azure Data Fundamentals - COVID 19 Challenge
## Introduction
This Challenge is designed so that the students will construct a fully functional Modern Data Platform utilizing COVID-19 data and help derive analytical insights.  The process of collecting, organizing and making inferences based on different data sources is someting that most data practioners need to do at some point in there career.  This challenge teaches how to do this in Azure.  

**Note:  This lab is recommended to be done over at least three days.  Is it very in-depth and will test most students.**

## Learning Objectives
In this challenge you will be preparing, collecting, cleaning, correlating and examining available data sets. 

The technical learning objectives:

1. Provision a Azure SQL Database, Cosmos DB, and Synapse Analytics
2. Load data into Azure SQL Database, Cosmos DB from the given dacpac and CSV file in this repo.
3. Land data in the Synapse SQL Pool from Cloud resources (Azure SQL and CosmosDB).
4. Create Data Pipelines to merge the datasets into usuable format.
5. Execute queries to extract Analytical insights.

## Challenges

- Initial Setup: **[Introduction and Initial Setup](Student/00-InitialSetup.md)**
  - Introductiona and Initial Setup for the challenge
- Challenge 1: **[Background](Student/01-Background.md)**
   - Prepare for the challenge
- Challenge 2: **[Provision](Student/02-Provision.md)**
   - Provision a Data Storage solution for landing your COVID-19 data sources.
- Challenge 3: **[Ingest Data into DW](Student/03-CloudIngest.md)**
   - Ingest COVID-19 data sources from cloud resources.
- Challenge 4: **[Analytics](Student/04-OnPremIngest.md)**
   - Ingest COVID-19 data sources from On-Premises resources.
   
## Prerequisites
- Your own Azure subscription with Owner access
- Public Azure DevOps or Github Repository

## Repository Contents
- `../images`
    - Generic image files needed
- `../Student`  
    - Student Challenges
- `../setup/LabDeployment`
    - ARM Templates 
    - Powershell Scripts 
    - Data for deploying the lab environment
