# Data Engineering & Analytics Project: From Data Source to Power BI

## Project Overview

This project showcases an end-to-end data engineering and analytics pipeline, starting from data ingestion to visualization. The pipeline covers the following stages:

1. **Data Source**: The raw data is stored in GitHub.
2. **Azure Data Factory**: Used for orchestrating data ingestion and movement to the data lake.
3. **Azure Data Lake Gen 2**: Stores raw and transformed data.
4. **Databricks**: Transforms the raw data using Spark jobs.
5. **Azure Synapse**: Analytics, data aggregation, and serving data for Power BI.
6. **Power BI**: Interactive dashboard visualizing key insights from the data.

## Architecture Diagram
![image](https://github.com/user-attachments/assets/79c8816e-bebb-41e3-b6bb-e8b8a8f3a002)


## Project Workflow

### 1. Data Source
The raw data is stored and version-controlled in GitHub.

### 2. Azure Data Factory
- Pipelines are used to move data from GitHub to Azure Data Lake Gen 2.
![image](https://github.com/user-attachments/assets/fcc1ec84-09a1-4244-89a3-a851354eb6ec)


### 3. Azure Data Lake Gen 2
- Data is stored in raw and transformed layers in ADLS Gen 2.
- Example folder structure:
![image](https://github.com/user-attachments/assets/13d4dbba-34e6-4b95-8e54-0c23d7949fa0)


### 4. Databricks
- Data is transformed using Spark jobs in Databricks.
- Notebook used for transformation are included under `/databricks`.
- Example Databricks process:
- Load raw data from ADLS Gen 2.
- Apply transformations (data cleaning, aggregations).
- Write transformed data back to ADLS Gen 2.


### 5. Azure Synapse
- Data is further aggregated in Synapse for reporting.
- SQL scripts for creating views and aggregating data are available under `/azure-synapse`.

### 6. Power BI
- The final data is visualized in a Power BI dashboard, which connects to the Synapse views.
- The data is also modelled:
![image](https://github.com/user-attachments/assets/25ccd708-3538-4717-a96f-19a838f34698)

- The dashboard visualizes:
- Key Performance Indicators (KPIs)
- Trends over time
- Detailed insights into operations
- Screenshots and to the Power BI dashboard and the .pbix file are provided under `/power-bi`.

## How to Use This Project

1. Clone this repository.
2. Deploy the provided Azure Data Factory pipelines to ingest data into ADLS Gen 2.
3. Use the Databricks notebooks to transform the data.
4. Set up Azure Synapse and run the provided SQL scripts to create views and tables.
5. Connect Power BI to Azure Synapse and visualize the data using the Power BI dashboard.

## Conclusion

This project demonstrates an end-to-end pipeline using Azure services for data engineering and analytics, from data ingestion to visualization in Power BI.  
