DELIMITER $$

CREATE TRIGGER AuditMoviesInsert
AFTER INSERT ON Movies
FOR EACH ROW
BEGIN
    DECLARE v_status VARCHAR(50);
    SET v_status = 'Success';

    INSERT INTO AuditLog (operation_type, movie_id, title, movie_type, netflix_exclusive, release_date, status_msg, user)
    VALUES ('INSERT', NEW.movie_id, NEW.title, NEW.movie_type, NEW.netflix_exclusive, NEW.release_date, v_status, USER());
END $$

DELIMITER ;







