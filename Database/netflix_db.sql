-- Creating Database
CREATE Database netflix_db;

-- Use Database
USE netflix_db;

-- Create Movies Table
CREATE TABLE Movies (
    movie_id INT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    movie_type VARCHAR(50) NOT NULL,
    netflix_exclusive VARCHAR(3),
    release_date DATE
);

--Load data
LOAD DATA LOCAL INFILE '/opt/homebrew/var/mysql/Data/netflix\ Movies\ Unique\ -\ netflix\ data.csv'
    INTO TABLE Movies
    FIELDS TERMINATED BY ','
    IGNORE 1 LINES
    (movie_id, title, movie_type, netflix_exclusive, release_date);

-- Create ranking table
CREATE TABLE Ranking(
    -> rank_id int AUTO_INCREMENT PRIMARY KEY,
    -> movie_id INT,
    -> rank_date DATE,
    -> movie_rank INT NOT NULL,
    -> year_to_date_rank INT,
    -> last_week_rank INT,
    -> FOREIGN KEY (movie_id) REFERENCES Movies(movie_id));

-- Load data
LOAD DATA LOCAL INFILE '/opt/homebrew/var/mysql/Data/netflix\ Movies\ Unique\ -\ netflix\ data.csv'
    -> INTO TABLE Ranking
    -> FIELDS TERMINATED BY ','
    -> IGNORE 1 LINES
    -> (movie_id, @dummy1, @dummy2, @dummy3, @dummy4, rank_date, movie_rank, year_to_date_rank, last_week_rank);

-- Create Performance table
CREATE TABLE Performance (
    -> performance_id INT AUTO_INCREMENT PRIMARY KEY,
    -> movie_id INT,
    -> days_in_top10 INT,
    -> viewership_score INT,
    -> FOREIGN KEY (movie_id) REFERENCES Movies(movies_id) ON DELETE CASCADE);

-- Load Data
LOAD DATA LOCAL INFILE '/opt/homebrew/var/mysql/Data/netflix\ Movies\ Unique\ -\ netflix\ data.csv'
    -> INTO TABLE Performance
    -> FIELDS TERMINATED BY ','
    -> IGNORE 1 LINES
    -> (movie_id, @dummy1, @dummy2, @dummy3, @dummy4, @dummy5, @dummy6, @dummy7, @dummy8, days_in_top10, viewership_score);

 