# Top Films DVD Rental

## Introduction
After completing a number of certifications from Udemy, UC Davis, and Google. I decided to make a project to finally utilize my current knowledge on SQL for data exploration, data cleaning, and data analyzing. This dataset contains a ficticious DVD rental company that provides information that is beneficial for business growth and strategy. In this study case, we'll outline how the data will be inquired and what insights will we gain from the data. 

## Dataset 
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

Analysis: Tables **inventory > film_category > rental > category > payments** 

Have all the the tables that is required to query the data. 

Result: 

![image](https://user-images.githubusercontent.com/102846044/205466458-a6c39e95-96e2-4e3c-8446-36d720a18a8b.png)

Insight: 
* Top Films have 16 available genres
* Sports genre is the highest selling genre to be rented
* Music Genre is the lowest selling genre to be rented 

###### Question 2 Can we know how many distinct users have rented each genre?

Analysis: Tables **category > film_category > inventory > rental** 

Next, add the DISTINCT clause to find unique customers to prevent duplication. 

Result: 

![image](https://user-images.githubusercontent.com/102846044/205467668-60772d2f-7025-4ba0-b053-cf38195467ee.png)

Insight: 
* Most of our customers love the sports genre
* Based on the previous table, music was the lowest selling genre. However, the least rented genre from our store is the travel genre

###### Question 3 What is the average rental rate for each genre? 

Analysis: Tables **category > film_category > film** 

Afterwards, add the AVG aggregate funtion to find the average rental rate of the genre. Finally, add the GROUP BY clause to ensure the data is generating a single result row for each set of unique values.

Result: 

![image](https://user-images.githubusercontent.com/102846044/205468229-dcadb4e0-2132-4765-8a1a-1ff846b2dd88.png)

Insight: 
* Travel has the second highest rental rate and the lowest customer demand
* Sci-fi has the third highest rental rate and the third highest customer demand 
* Sports has the fifth highest rental rate and the highest customer demand 

###### Question 4 How many rented films were returned late, early, and on time?


