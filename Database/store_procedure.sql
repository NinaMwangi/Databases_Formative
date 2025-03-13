DELIMITER $$

CREATE PROCEDURE AddMovie(
    IN n_movie_id INT,
    IN n_title VARCHAR(255),
    IN n_movie_type VARCHAR(50),
    IN n_netflix_exclusive VARCHAR(3),
    IN n_release_date DATE
)
BEGIN
    INSERT INTO Movies(movie_id, title, movie_type, netflix_exclusive, release_date)
    VALUES (n_movie_id, n_title, n_movie_type, n_netflix_exclusive, n_release_date);
END $$

DELIMETER;

CALL AddMovie(644, 'Glass Onion', 'Movie', 'Yes', '2022-09-10');