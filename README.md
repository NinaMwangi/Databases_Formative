# Formative 1 - Databases
In this project, we will use a Netflix dataset from Kaggle, Link (https://www.kaggle.com/datasets/prasertk/netflix-daily-top-10-in-us). That data will be stored in a MySQL database and MongoDB. We have created an API that retrieves data from the MySQL database hosted on Railway and used the data to train our model.

## MySQL Database & MongoDB - Nina
The relationship Database in this project is a MySQL database that contains 3 normalized tables: Movies, Ranking & Performance. The relational database has been hosted on Railway, and MongoDB is the NoSQL option. The relational database contains a stored procedure for the Movies table that adds movies to it and a trigger that automatically logs updates to an audit table when any INSERT, UPDATE or DELETE happens on the Movies table. It can be manual updates to the movies table or by calling the stored procedure.

## Api - Madol
I created a  RESTful API using FastAPI to perform CRUD operations on the Netflix database hosted on Railway and MongoDB Atlas. I was able to write two scripts that fetch data from the hosted databases. I hosted the api on Render and it is working well as intended. The two databases are connected with api. I decided to choose the Movies Table in the Netflix database created. The aim is to be able to access the movie data, read, update, delete, put, and create. The cooperation from the team led to this wonderful development. 

## Model -Data Fetching and Prediction
Contributors: Magnifique & AlHassan

Created a script to fetch data from the API, targeting the latest entries.
Prepared data for predictions using a machine learning model from an Intro to ML course.
Ensured the script properly loads the model, formats input data, and produces accurate predictions.
