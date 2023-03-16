
/*1. Create a Stored Procedure that will insert a new film into the film table with the
following arguments: title, description, release_year, language_id, rental_duration,
rental_rate, length, replace_cost, rating*/

CREATE OR REPLACE PROCEDURE add_film(title VARCHAR, description VARCHAR, release_year YEAR, language_id INTEGER, rental_duration INTEGER,rental_rate NUMERIC(4,2),"length" INTEGER,replace_cost NUMERIC(5,2),rating mpaa_rating)
LANGUAGE plpgsql
AS $$
BEGIN 
	INSERT INTO film(title, description, release_year, language_id, rental_duration,rental_rate,"length",replacement_cost,rating,last_update)
	VALUES(title, description, release_year, language_id, rental_duration,rental_rate,"length",replace_cost,rating,NOW());
END;
$$;

CALL add_film('Cool_Runnings', 'Bobsled Movie', 1989, 1, 48, 9.99, 240, 15.99, 'NC-17')





--2. Create a Stored Function that will take in a category_id and return the number of
--films in that category

CREATE OR REPLACE FUNCTION film_generes(cat_id INTEGER)
RETURNS INTEGER
LANGUAGE plpgsql
AS $$
	DECLARE films INTEGER;
BEGIN
	SELECT COUNT(film_ID) INTO films
	FROM film_category
	WHERE category_id = cat_id
	ORDER BY COUNT(film_ID)DESC;
	RETURN films;
END;
$$;

SELECT film_generes(1);
