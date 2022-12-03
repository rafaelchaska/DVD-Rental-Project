# 'TOP Films DVD Rental'

## Introduction
I recently completed a number of certifications from Udemy, UC Davis, and Google that taught me how to use 
SQL for data exploration, data cleaning, and data analyzing. For a personal project, i decided to analyze the database for a 
fictional DVD rental company that I will called ‘Top Films’. Let’s take a look at a case study detailing my process and output.

## Dataset 
I began by checking the database. The database for ’Top Films’ have 15 tables. Below are the different tables and a brief description of what the table entails. 

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

##Objective & Goals 

In this project, I’ll aim to answer the following questions:
1. What are the top and least rented (in-demand) genres and what are their total sales?
2. Can we know how many distinct users have rented each genre?
3. What is the average rental rate for each genre? (from the highest to the lowest)
4. How many rented films were returned late, early, and on time?
5. In which countries does ’Top Films’ have a presence and what is the customer base in each country? What are the total sales in each country? (from most to least)
6. Who are the top 5 customers per total sales and can we get their details just in case ‘Top Films’ wants to reward them?

Before I get started with my analysis, I had to make sure that I understand the schema of the database. Here is the schema below:

![dvd-rental-sample-database-diagram](https://user-images.githubusercontent.com/102846044/205462973-29e670de-6a34-418c-a609-f98dcd0e6395.png)


