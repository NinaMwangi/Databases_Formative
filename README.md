# Formative 1 - Databases
In this project, we will use a Netflix dataset from Kaggle, Link (https://www.kaggle.com/datasets/prasertk/netflix-daily-top-10-in-us). That data will be stored in a MySQL database and MongoDB. We have created an API that retrieves data from the MySQL database hosted on Railway and used the data to train our model.

## MySQL Database & MongoDB - Nina
The relationship Database in this project is a MySQL database that contains 3 normalized tables: Movies, Ranking & Performance. The relational database has been hosted on Railway, and MongoDB is the NoSQL option. The relational database contains a stored procedure for the Movies table that adds movies to it and a trigger that automatically logs updates to an audit table when any INSERT, UPDATE or DELETE happens on the Movies table. It can be manual updates to the movies table or by calling the stored procedure.

###Original data attributes: 
1. Movie_id
2. Rank
3. Year to Date Rank
4. Last Week Rank
5. Title
6. Type (TV Show or Movie)
7. Netflix Exclusive (Yes/No)
8. Netflix Release Date
9. Days in Top 10
10. Viewership Score
11. as of (Date)

## Movies Table

| movie_id | title                         | movie_type | netflix_exclusive | release_date |
|----------|-------------------------------|------------|-------------------|--------------|
| 2        | Tiger King: Murder Mayhem      | TV Show    | Yes               | 2020-03-20   |
| 3        | Ozark                          | TV Show    | Yes               | 2017-07-21   |
| 4        | All American                   | TV Show    | No                | 2019-03-28   |
| 5        | Blood Father                   | Movie      | No                | 2020-03-26   |

## Ranking Table

| rank_id | movie_id | rank_date  | movie_rank | year_to_date_rank | last_week_rank |
|---------|----------|------------|------------|-------------------|----------------|
| 1       | 2        | 2020-04-01 | 1          | 1                 | 1              |
| 2       | 3        | 2020-04-01 | 2          | 2                 | 1              |
| 3       | 4        | 2020-04-01 | 3          | 3                 | 2              |
| 4       | 5        | 2020-04-01 | 4          | 4                 | 2              |
| 5       | 6        | 2020-04-01 | 5          | 5                 | 4              |

## Performance Table

| performance_id | movie_id | days_in_top10 | viewership_score |
|----------------|----------|---------------|------------------|
| 1              | 2        | 9             | 90               |
| 2              | 3        | 5             | 45               |
| 3              | 4        | 9             | 76               |
| 4              | 5        | 5             | 30               |
| 5              | 6        | 9             | 55               |


## Api - Madol
I created a  RESTful API using FastAPI to perform CRUD operations on the Netflix database hosted on Railway and MongoDB Atlas. I was able to write two scripts that fetch data from the hosted databases. I hosted the api on Render and it is working well as intended. The two databases are connected with api. I decided to choose the Movies Table in the Netflix database created. The aim is to be able to access the movie data, read, update, delete, put, and create. The cooperation from the team led to this wonderful development. 

## Model -Data Fetching and Prediction
Contributors: Magnifique & AlHassan

Created a script to fetch data from the API, targeting the latest entries.
Prepared data for predictions using a machine learning model from an Intro to ML course.
Ensured the script properly loads the model, formats input data, and produces accurate predictions.
The output is a binary classification, producing 0s and 1s which means no = 0 or yes = 1.
