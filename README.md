# Top Films DVD Rental

## Introduction
After completing a number of certifications from Udemy, UC Davis, and Google. I decided to make a project to finally utilize my current knowledge on SQL for data exploration, data cleaning, and data analyzing. This dataset contains a ficticious DVD rental company that provides information that is beneficial for business growth and strategy. In this study case, we'll outline how the data will be inquired and what insights will we gain from the data. 

## Dataset 
This sample database was acquired from the PostgreSQL [website](https://www.postgresqltutorial.com/postgresql-getting-started/postgresql-sample-database/).

The database for Top Films have 15 tables. Below are the different tables and a brief description of what the table entails. 

* actor — contains actors data including first name and last name.
* film — contains films data such as title, release year, length, rating, etc.
* film_actor — contains the relationships between films and actors.
* category — contains film’s categories data.
* film_category — containing the relationships between films and categories.
* store — contains the store data including manager staff and address.
* inventory — stores inventory data.
* rental — stores rental data.
* payment — stores customer’s payments.
* staff — stores staff data.
* customer — stores customer’s data.
* address — stores address data for staff and customers
* city — stores the city names.
* country — stores the country names.

## Objective & Goals 

In this project, the objective is to provide insightful business analysis to Top Films. Based on the dataset that is provided, there are numerous schemas that will benefit this evaluation.

This analysis will provide the following information:
* Top Film's most and least rented genre following its total sales for each genre
* Customer's favorite genre to rent
* Average rental rate for each genre
* Total count of early, late, and on-time returns 
* Countries where Top Films have presence following its customer base
* Top 5 customers from Top Films

Below is the schema:

![dvd-rental-sample-database-diagram](https://user-images.githubusercontent.com/102846044/205462973-29e670de-6a34-418c-a609-f98dcd0e6395.png)

## Analysis & Insights

It's important before starting the query, the schema must be reviewed to find relevant information. Afterwards, identify each schema's column to grab the necessary data.

###### Question 1 What are the top and least rented (in-demand) genres and what are their total sales? 

Analysis: Tables **inventory > film_category > rental > category > payment** 

Add the SUM aggregate into the query to find the total sales. 
It's also important to include the COUNT function to count the rent demand. 
Finally, use the GROUP BY clause to group each genre to its number of rent demand and ORDER BY to sort the rent demand in descending order to find the highest number of demand

Result: 

![image](https://user-images.githubusercontent.com/102846044/205466458-a6c39e95-96e2-4e3c-8446-36d720a18a8b.png)

Insight: 
* Top Films have 16 available genres
* Sports genre is the highest selling genre to be rented
* Music Genre is the lowest selling genre to be rented 

###### Question 2 How many distinct users have rented each genre?

Analysis: Tables **category > film_category > inventory > rental** 

Use the COUNT function to find the number of customers. 
Next, add the DISTINCT clause next to the COUNT function to find unique customers to prevent duplication.
Finally, use the GROUP BY clause to group each genre to its number of customers and ORDER BY to sort the distinct customers in descending order to find the highest number of customer for each genre. 

Result: 

![image](https://user-images.githubusercontent.com/102846044/205467668-60772d2f-7025-4ba0-b053-cf38195467ee.png)

Insight: 
* Most of Top Film's customers love the sports genre
* Based on the previous table, music was the lowest selling genre. However, the least rented genre from our store is the travel genre

###### Question 3 What is the average rental rate for each genre? 

Analysis: Tables **category > film_category > film** 

Add the AVG aggregate funtion to find the average rental rate of the genre. 
Finally, use the GROUP BY clause to group each genre to its average rental rate and ORDER BY to sort the distinct customers in descending order to find the highest number of customer for each genre. 

Result: 

![image](https://user-images.githubusercontent.com/102846044/205468229-dcadb4e0-2132-4765-8a1a-1ff846b2dd88.png)

Insight: 
* Travel has the second highest rental rate and the lowest customer demand
* Sci-fi has the third highest rental rate and the third highest customer demand 
* Sports has the fifth highest rental rate and the highest customer demand 

###### Question 4 How many rented films were returned late, early, and on time?

Analysis: Tables **inventory > film > rental** 

For this query, add the CASE expression to find out the status of return. There are multiple conditions that needs to be satisfied to find out if the film is returned on time, early, or late.
Additionally, add the COUNT function to find the number of films
Finally, use the GROUP BY clause to group each status of return to its number of films and use ORDER BY to sort the number of films in descending order to find the highest number of films being returned. 

Result:

![image](https://user-images.githubusercontent.com/102846044/205518866-64f70129-42f6-4401-b702-959ad5285118.png)

Insight: 
* 48.22% of customers returned the film early 
* 39.90% of customers returned the film late 
* 11.86% of customer returned the film on-time 

###### Question 5 In which countries does ’Top Films’ have a presence and what is the customer base in each country? What are the total sales in each country? (from most to least)

Analysis: Tables **country > city > address > customer > payement**

Add the SUM aggregate into the query to find the total sales. 
It's also important to include the COUNT function to count the customer base. 
Finally, use the GROUP BY clause to group each customer base and total sales to its total sales and use ORDER BY to sort the total sales in descending order to find the highest total sales from each country / customer base.

Result: 

![image](https://user-images.githubusercontent.com/102846044/205519911-26f0a144-84ba-4e00-9505-2d5d100c1a6f.png)

Insight: 
* 10% of Top Film's customers are based in India 
* 9.84% of Top Film's sales are from India
* Top Films have managed to be present in 108 countries in the world 
* 34.26% of Top Film's customer are based in the ASIA continent 

###### Question 6 Who are the top 5 customers per total sales and what are their details just in case ‘Top Films’ wants to reward them?

Analysis: Tables **customer > payment > address > city > country**

Since there are two seperate tables for the first name and last name, add CONCAT to combine those two tables together.
Additionally, use the SUM aggregate funcction to find the total purchase. We also want to make sure that these customers
are still active. Add a WHERE clause to make sure we only filter for active customers. 
Afterwards, use GROUP BY clause to group each customer's full name, email, address, phone, city, and country to its total purchase.
We also need to use the ORDER BY clause to sort the total purchase in descending order to find the highest total purchase by a customer. 
Finally, since we only need the top 5 customers we limit the query to 5 results. 

Result:


