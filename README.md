![Pet_Warehouse](https://github.com/AJAnalyticsHub/AJ_Petwarehouse/assets/168544313/7d6b78c1-6784-414f-8224-c9b1a528399b)

This repository contains .xls, .csv and .sql files to create and analyse a database for a fictional pet shop supplier.

## Project Overview

AJPetWarehouse is a project from my self-study journey to enhance my data analysis skills using SQL. 
The database was created by myself using Pet Store records from [Kaggle](https://www.kaggle.com/datasets/ippudkiippude/pet-store-records-2020) 
It contains tables for customers, pet size, pet type, products, sales and suppliers.

## Repository Structure

- **AJ_petwarehouse.xls:** Raw and transformed Excel data.
- **AJ_PetwarehouseDB.sql:** SQL code to create the database, tables and initial data values for pet size, pet type and products.
- **AJ_petwarehouse(customers).csv:** Data for the customers table.
- **AJ_petwarehouse(sales).csv:** Data for the sales table.
- **AJ_petwarehouse(suppliers).csv:** Data for the suppliers table.
- **AJ_PetWarehouse(Analytics).sql:** Analytical queries to look at sales trends and identify opportunities for growth.

## How to Use

1. **Run AJ_PetwarehouseDB Script:** This will set up your database, including relationships and values for the pet size, pet type, and products tables.
2. **Data Import Wizard:** Use the Data Import Wizard for the three .csv files to populate the customers, sales, and suppliers tables.
3. **Run AJ_PetWarehouse(Analytics) Script:** Execute this script to answer the analysis questions outlined below.

## Data Queries

This database is ideal for learners to practice and enhance their SQL skills. 
The following questions are addressed:

1. **Who are our top 5 customers?:** Identify top customers using the LIMIT syntax.
2. **Which supplier provides us with the most sales?:** Analysing sales revenue to discover our top supplier.
3. **Which animals should we be targeting in our product expansion?:** Perform predictive analysis to determine the most profitable pet types.
4. **Which sizes of cats and dogs should we be targeting in our clothing line?:** Focus on best-selling sizes to manage stock efficiently.
5. **Provide me with the email and addresses of customers who did not purchase any goods in this period:** Identify customers to target with incentives for repeat business.
6. **Provide me with the products that businesses would not buy:** Determine which product lines to consider discontinuing.
7. **Which products are rated higher than average?:** Identify high-rated products for potential expansion.


## Future Enhancements

- **Visualisations:** My next learning steps are to master Power Bi or Tableau to create advanced data visualisations.
- **Report Analysis:** Develop a detailed report on the findings from the SQL analysis
