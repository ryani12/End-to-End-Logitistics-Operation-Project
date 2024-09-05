# Data Engineering & Analytics Project: From Data Source to Power BI

## Project Overview

This project showcases an end-to-end data engineering and analytics pipeline, starting from data ingestion to visualization. The pipeline covers the following stages:

1. **Data Source**: The raw data is stored in GitHub (or another source).
2. **Azure Data Factory**: Used for orchestrating data ingestion and movement to the data lake.
3. **Azure Data Lake Gen 2**: Stores raw and transformed data.
4. **Databricks**: Transforms the raw data using Spark jobs.
5. **Azure Synapse**: Analytics, data aggregation, and serving data for Power BI.
6. **Power BI**: Interactive dashboard visualizing key insights from the data.

## Architecture Diagram

![image](https://github.com/user-attachments/assets/79c8816e-bebb-41e3-b6bb-e8b8a8f3a002)


## Project Workflow

### 1. Data Source
The raw data is stored and version-controlled in GitHub. (Provide a link to the data or sample data.)

### 2. Azure Data Factory
- Pipelines are used to move data from GitHub to Azure Data Lake Gen 2.
- (Include the pipeline JSON or ARM template files under `/azure-data-factory`)

### 3. Azure Data Lake Gen 2
- Data is stored in raw and transformed layers in ADLS Gen 2.
- Example folder structure:
- /raw /transformed


### 4. Databricks
- Data is transformed using Spark jobs in Databricks.
- Notebooks used for transformation are included under `/databricks`.
- Example Databricks process:
- Load raw data from ADLS Gen 2.
- Apply transformations (data cleaning, aggregations).
- Write transformed data back to ADLS Gen 2.

### 5. Azure Synapse
- Data is further aggregated in Synapse for reporting.
- SQL scripts for creating views and aggregating data are available under `/azure-synapse`.

### 6. Power BI
- The final data is visualized in a Power BI dashboard, which connects to the Synapse views.
- The dashboard visualizes:
- Key Performance Indicators (KPIs)
- Trends over time
- Detailed insights into operations
- Screenshots or a link to the Power BI dashboard are provided under `/power-bi`.

## Project Files

- **/data-source**: Contains the original data or a sample.
- **/azure-data-factory**: ADF pipelines in JSON or ARM template format.
- **/databricks**: Notebooks used in Databricks for data transformations.
- **/azure-synapse**: SQL scripts for aggregations and creating views.
- **/power-bi**: Screenshots or published links to the Power BI dashboard.

## How to Use This Project

1. Clone this repository.
2. Deploy the provided Azure Data Factory pipelines to ingest data into ADLS Gen 2.
3. Use the Databricks notebooks to transform the data.
4. Set up Azure Synapse and run the provided SQL scripts to create views and tables.
5. Connect Power BI to Azure Synapse and visualize the data using the Power BI dashboard.

## Conclusion

This project demonstrates an end-to-end pipeline using Azure services for data engineering and analytics, from data ingestion to visualization in Power BI.  
