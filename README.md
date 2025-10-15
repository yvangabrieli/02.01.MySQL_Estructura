# 🗂️ Practical MySQL Exercises - Data Structure

## 📌 Description  
This repository contains two database design and SQL practice exercises built using **MySQL**.  
Each exercise focuses on creating and managing relational databases to simulate real-world business cases.  

- **Exercise 1 – Optics Shop ("Cul d'Ampolla")**:  
  A system to manage clients, suppliers, employees, and sales of glasses.  
  The database stores customer information, eyewear details (brand, frame, lenses, price), and supplier data.  
  It also tracks which employee sold each pair of glasses and who recommended each customer.  

- **Exercise 2 – Pizzeria**:  
  A database for an online food delivery website.  
  It includes entities for customers, orders, stores, employees, products (pizzas, burgers, drinks), and categories.  
  The structure supports delivery tracking, product categorization, and store management.  

## 💻 Technologies Used  
- **MySQL** – Database management system  
- **Docker** – Environment for running MySQL containers  
- **MySQL Workbench** – For schema design and queries  

## 📋 Requirements  
Before starting, make sure you have:  
- A working **MySQL server** (local or in Docker).  
- A SQL client such as **MySQL Workbench**, **DBeaver**, or the **MySQL CLI**.  

## 🛠️ Installation & Setup  
1. Start your MySQL server or Docker container.  
2. Open MySQL Workbench (or another SQL client).  
3. Run the provided `.sql` scripts to create each database:  
   - `optics_db.sql` for **Exercise 1 – Optics Shop**  
   - `pizzeria_db.sql` for **Exercise 2 – Pizzeria**  
4. Insert the provided sample data (using the included `INSERT` statements).  

## 🧪 Example Queries  
Some example queries included in the exercises:  

- **Optics Shop:**  
  - List the suppliers for each brand of glasses.  
  - Find which employee sold a specific pair of glasses.  

- **Pizzeria:**  
  - Count how many *drink* products were sold in a specific city.  
  - Count how many orders were handled by a specific employee.  

## 🎯 Learning Objectives  
- Practice **database modeling** with entities and relationships.  
- Apply **SQL commands** for creating tables, inserting data, and running queries.  
- Understand **1:N** and **N:M** relationships between real-world entities.  
- Gain hands-on experience working with **MySQL Workbench** and **Docker**.  
