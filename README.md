![Pet_Warehouse](https://github.com/AJAnalyticsHub/AJ_Petwarehouse/assets/168544313/7d6b78c1-6784-414f-8224-c9b1a528399b)

This repository contains .xlsx, .csv, .sql and .twbx files to create and analyse a database for a fictional pet shop supplier.

## Project Overview

AJPetWarehouse is a project from my self-study journey to enhance my data analysis skills using SQL and data visualisations using Tableau. 
The database was created by myself using Pet Store records from [Kaggle](https://www.kaggle.com/datasets/ippudkiippude/pet-store-records-2020). 
It contains tables for customers, pet size, pet type, products, sales and suppliers.

## Repository Structure

- **AJ_petwarehouse.xlsx:** Raw and transformed Excel data.
- **AJ_PetwarehouseDB.sql:** SQL code to create the database, tables and initial data values for pet size, pet type and products.
- **AJ_petwarehouse(customers).csv:** Data for the customers table.
- **AJ_petwarehouse(sales).csv:** Data for the sales table.
- **AJ_petwarehouse(suppliers).csv:** Data for the suppliers table.
- **AJ_PetWarehouse(Analytics).sql:** Analytical queries to look at sales trends and identify opportunities for growth.
- **AJ_PetWarehouse_Dashboard.png:** Tableau dashboard image showcasing sales visuals, including a symbol map, box-and-whisker plot, pie chart, and indexed horizontal bar chart.
- **AJ_PetWarehouse.twbx:** Tableau file for interacting with the interactive dashboard.

## How to Use

1. **Run AJ_PetwarehouseDB Script:** This will set up your database, including relationships and values for the pet size, pet type, and products tables.
2. **Data Import Wizard:** Use the Data Import Wizard to populate the customer and suppliers tables with their respective .csv files.
3. **AJ_petwarehouse(sales).csv:** Use the Data Import Wizard to populate the sales parent table with the AJ_petwarehouse(sales).csv file.
4. **Run AJ_PetWarehouse(Analytics) Script:** Execute this script to answer the analysis questions outlined below.
5. **AJ_PetWarehouse.twbx:** Interactive dashboard highlighting sales analysis.

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

## Analysis

Due to the nature of the Kaggle data, I chose to analyse data in both sales volume and revenue.

### Which animals should we be targeting in our product expansion?

```
-- by sales amount --

SELECT p.pet_type, SUM(s.sales) AS total_sales_amount
FROM pet_type AS p
JOIN sales AS s
ON p.pet_type_id = s.pet_type_id
GROUP BY p.pet_type_id
ORDER BY SUM(s.sales) DESC;
```

The following query shows that cat sales are our most frequent, closely followed by dog sales.

<img width="984" alt="Sales Volume Pie Chart by Pet Type" src="https://github.com/AJAnalyticsHub/AJ_Petwarehouse/assets/168544313/6f44a4bd-b67c-4a93-b32e-8a8a7e49f0c8">

```
SELECT p.pet_type, SUM(s.price) AS total_revenue_amount
FROM pet_type AS p
JOIN sales AS s
ON p.pet_type_id = s.pet_type_id
GROUP BY p.pet_type_id
ORDER BY SUM(s.price) DESC;
```

Querying the revenue by each pet category, we can see that dog sales provide the highest revenue, followed closely by cat sales.

<img width="984" alt="Revenue Pie Chart by Pet Type" src="https://github.com/AJAnalyticsHub/AJ_Petwarehouse/assets/168544313/31827e28-4f23-4993-8894-5d778248165f">

Cat and dog sales account for the majority of sales and revenue. 
Therefore, my recommendations for product expansions are:

- Conduct further analysis into the ranges in which sales volume of cats and dogs are strongest, and expand the product ranges and marketing efforts in these categories.
- Focus on introducing new and diverse products for cats and dogs to capitalise on their popularity.

### Which sizes of cats and dogs should we be targeting in our clothing line?

Inventory management is a crucial issue in the retail sector. Without data-driven insights, businesses can face increased storage costs and spend money on products that are unlikely to generate profits, potentially causing revenue loss.

```
SELECT pt.pet_type, ps.pet_size, SUM(s.sales) AS total_sales_amount
FROM pet_type AS pt
JOIN sales AS s
ON pt.pet_type_id = s.pet_type_id
JOIN pet_size AS ps
ON s.pet_size_id = ps.pet_size_id
JOIN products AS pr
ON pr.product_cat_id = s.product_cat_id
WHERE pt.pet_type IN ('cat', 'dog')
AND pr.product_category = 'clothes'
GROUP BY pt.pet_type, ps.pet_size
ORDER BY total_sales_amount DESC;
```

In this query i decided to focus on solely sales volume to focus on the storage aspect for the business. As we can see our biggest seller is small dog clothing. Sales totaling over 500 units are found in medium, large and extra large cat and extra large dog. Small cat had a sales volume that significantly deviates from other options.

<img width="945" alt="Bar Chart Comparing the Clothing Sales Volume of Different Sizes of Cats and Dogs " src="https://github.com/AJAnalyticsHub/AJ_Petwarehouse/assets/168544313/e2b40b44-a412-448d-9cb2-decabd9b0aec">

Recommendations for our clothing line would be:

- Increasing inventory on high selling items to ensure adequate inventory levels fof stock to meet demand and reduce stockouts.
- Conduct a cost benefit analysis to review small cat clothing. Determine if it's more cost-effective to discontinue or reduce stock to allow for more stock of better selling items.
- Continuously monitor sales trends to respond to customer preferences and market to demand effectively.

### Tableau Dashboard

![AJ_PetWarehouse_Dashboard](https://github.com/AJAnalyticsHub/AJ_Petwarehouse/assets/168544313/246afd1f-a634-4660-ba51-edf022fda892)

**Data Visuals:**

1. Sales Map:

<img width="1125" alt="Sales Map" src="https://github.com/AJAnalyticsHub/AJ_Petwarehouse/assets/168544313/d20a4fdd-751b-4722-a377-b73e150f1405">
   
2. Distribution of Sales by Product Category:

<img width="1040" alt="Distribution of Sales by Product Category" src="https://github.com/AJAnalyticsHub/AJ_Petwarehouse/assets/168544313/1fc90f67-6255-405e-a292-66998a59facd">

3. Product Sales Volume:

<img width="1123" alt="Product Sales Volume" src="https://github.com/AJAnalyticsHub/AJ_Petwarehouse/assets/168544313/2eb37257-0476-47db-891d-05851ca5adfd">

4. Top 5 Customers by Sales Volume:

<img width="1122" alt="Top 5 Customers by Sales Volume" src="https://github.com/AJAnalyticsHub/AJ_Petwarehouse/assets/168544313/b646f2b5-efcd-4772-baea-3dcfc877e96d">

5. Pet Sales Volume:

<img width="1122" alt="Pet Sales Volume" src="https://github.com/AJAnalyticsHub/AJ_Petwarehouse/assets/168544313/b2fe4f21-6412-4615-8ff6-70c4216f496b">

6.Top 3 Average Pet Sales by Product Category:

<img width="1122" alt="Top 3 Average Pet Sales by Product Category" src="https://github.com/AJAnalyticsHub/AJ_Petwarehouse/assets/168544313/36596704-3301-48bb-8826-eab22e1a016a">

