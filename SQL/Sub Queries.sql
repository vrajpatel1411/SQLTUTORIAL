# Select a movie with highest imdb_rating using Sub Query
use moviesdb;
SELECT 
    *
FROM
    movies
WHERE
    imdb_rating IN (SELECT 
            MIN(imdb_rating)
        FROM
            movies);

-- Get the max and min imdb_rating movies
SELECT 
    *
FROM
    movies
WHERE
    imdb_rating IN ((SELECT 
            MIN(imdb_rating)
        FROM
            movies) , (SELECT 
                MAX(imdb_rating)
            FROM
                movies));

-- Select actor name and age 
SELECT 
    *
FROM
    (SELECT 
        name, YEAR(CURDATE()) - birth_year AS age
    FROM
        actors) AS actors_age
WHERE
    age > 70 AND age < 85;
    
SELECT 
    actor_id, name
FROM
    actors
WHERE
    actor_id IN (SELECT 
            actor_id
        FROM
            movie_actor
        WHERE
            movie_id IN (101 , 110, 121));
-- This will also return same result except we have replace IN with ANY
SELECT 
    actor_id, name
FROM
    actors
WHERE
    actor_id = ANY (SELECT 
            actor_id
        FROM
            movie_actor
        WHERE
            movie_id IN (101 , 110, 121));

-- This will return all movies whose imdb_rating is highest then highest imdb_rating of marvel studios
SELECT 
    *
FROM
    movies
WHERE
    imdb_rating > ALL (SELECT 
            imdb_rating
        FROM
            movies
        WHERE
            studio = 'Marvel Studios');
            
-- This will return all movies whose imdb_rating is highest then any of imdb_rating of marvel studios
SELECT 
    *
FROM
    movies
WHERE
    imdb_rating > ANY (SELECT 
            imdb_rating
        FROM
            movies
        WHERE
            studio = 'Marvel Studios');
            
SELECT 
    a.actor_id, a.name, COUNT(*) AS total_movies
FROM
    movie_actor ma
        JOIN
    actors a ON ma.actor_id = a.actor_id
GROUP BY a.actor_id
ORDER BY total_movies DESC;


## OR
explain analyze
SELECT 
    actor_id,
    name,
    (SELECT 
            COUNT(*)
        FROM
            movie_actor
        WHERE
            actor_id = actors.actor_id) AS movie_count
FROM
    actors
ORDER BY movie_count DESC;

-- Select all the movies with minimum and maximum release_year. Note that there
-- can be more than one movie in min and a max year hence output rows can be more than 2

SELECT 
    *
FROM
    movies
WHERE
    release_year IN ((SELECT 
            MAX(release_year)
        FROM
            movies) , (SELECT 
                MIN(release_year)
            FROM
                movies));

-- Select all the rows from the movies table whose imdb_rating is higher than the average rating

SELECT 
    *
FROM
    movies
WHERE
    imdb_rating > ALL (SELECT 
            AVG(imdb_rating)
        FROM
            movies);
            
            
With actor_age as (
select name, year(curdate())-birth_year as age from actors)
select * from actor_age where age > 70 and age<85;

select *, (revenue-budget)*100/budget as profit from financials;



with movie_profit as (
select *, (revenue-budget)*100/budget as profit from financials),
 movies_temp as (
select * from movies where imdb_rating < (select avg(imdb_rating) from movies)  )
select mp.movie_id,mp.profit,mt.title,mt.imdb_rating from movie_profit mp join movies_temp mt on mp.movie_id=mt.movie_id where profit >= 500;


with movie_profit as (
select *, (revenue-budget)*100/budget as profit from financials)
select movies.title, movies.industry, movies.release_year,profit from movies join movie_profit on movies.movie_id=movie_profit.movie_id where release_year>=2000 and movie_profit.profit>500 and industry="hollywood";