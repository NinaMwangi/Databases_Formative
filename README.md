# Formative 1 - Databases
In this project, we will be using a Netflix dataset from Kaggle, Link (). That data will be stored in both a MySQL database and in MongoDB as well. We have created an API that retrieves data from the MySQL database that is hosted on Railway and used the data to train our model.

## MySQL Database & MongoDB - Nina
The relationship Database in this project is a MySQL database that contains 3 normalized tables: Movies, Ranking & Performance. The relational database has been hosted on Railway and the NoSQL option is MongoDB. The relational database contains a stored procedure for the Movies table that adds movies to it and a trigger that automatically logs updates to an audit table when any INSERT, UPDATE or DELETE happens on the Movies table. It can be manual updates to the movies table or by calling the stored procedure.

## Api - Madol




## Model -Data Fetching and Prediction
Contributors: Magnifique & AlHassan

Created a script to fetch data from the API, targeting the latest entries.
Prepared data for predictions using a machine learning model from an Intro to ML course.
Ensured the script properly loads the model, formats input data, and produces accurate predictions.
