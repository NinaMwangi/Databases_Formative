-- Creating my trigger that adds to the audit table
DELIMETER $$

CREATE TRIGGER AuditMoviesChanges
AFTER INSERT, UPDATE, DELETE ON Movies
FOR EACH ROW
BEGIN
    DECLARE v_status VARCHAR(50);
    DECLARE v_err_message TEXT;

    --Initialising default values for err_message and status
    SET v_status = 'Success';
    SET v_err_message = NULL;

    -- Logging operation to Audit table
    BEGIN
        --INSERT operation
        IF (NEW.movie_id IS NOT NULL) AND (OLD.movie_id IS NULL) THEN
        INSERT INTO AuditLog (operation_type, movie_id, title, movie_type, netflix_exclusive, release_date, status_msg, user)
        VALUES ('INSERT', NEW.movie_id, NEW.title, NEW.movie_type, NEW.netflix_exclusive, NEW.release_date, v_status, USER());

        --UPDATE operation
        ELSIF (NEW.movie_id IS NOT NULL) AND (OLD.movie_id IS NULL) THEN
        INSERT INTO AuditLog (operation_type, movie_id, title, movie_type, netflix_exclusive, release_date, status_msg, user)
        VALUES ('UPDATE', NEW.movie_id, NEW.title, NEW.movie_type, NEW.netflix_exclusive, NEW.release_date, v_status, USER());

        --DELETE operation
        ELSIF (NEW.movie_id IS NULL) AND (OLD.movie_id IS NOT NULL) THEN
        INSERT INTO AuditLog (operation_type, movie_id, title, movie_type, netflix_exclusive, release_date, status_msg, user)
        VALUES ('DELETE', OLD.movie_id, 0LD.title, OLD.movie_type, OLD.netflix_exclusive, OLD.release_date, v_status, USER());
        END IF;
    EXCEPTION
        -- If error occurs Log err_message and status_msg
        WHEN OTHERS THEN
            SET v_status_msg = 'Failure';
            SET v_err_message = 'Error occurred during operation: ' || SQLERRM;

            -- Update AuditLog with failure status & error message
            INSERT INTO AuditLog (operation_type, movie_id, title,movie_type,netflix_exclusive, release_date, status_msg, err_message)
            VALUES ('ERROR', NULL, NULL, NULL, NULL, NULL, v_status, v_err_message, USER());
    END;
END $$

DELIMETER;







