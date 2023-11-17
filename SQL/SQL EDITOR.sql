-- Database is nothing but a collection of tabular data built across rows and columns. 

SELECT 
    *
FROM
    moviesdb.movies;-- This will return all data in movies table from moviesdb database

SELECT 
    title, industry
FROM
    moviesdb.movies; -- This will only return the title and industry columns from the movies table from moviesdb database. 

-- So now we can see that we everytime write the moviesdb because we have multiple database and how the sql server will where our table and in which database it is stored. That's why we are using moviesdb.[TABLE NAME]. We can also do following thing as shown below:

USE moviesdb;-- So this will set the default database.

SELECT 
    *
FROM
    movies;

-- Now I want all movies data from bollywood so we will use "Where" Clause

SELECT 
    *
FROM
    movies
WHERE
    industry = 'bollywood';

-- Return the count of bollywood and hollywood movies

SELECT 
    COUNT(*)
FROM
    movies
WHERE
    industry = 'bollywood';

SELECT 
    COUNT(*)
FROM
    movies
WHERE
    industry = 'Hollywood';

-- Return the distinct industry

SELECT DISTINCT
    industry
FROM
    movies;

-- Return all record where title has thor. 

SELECT 
    *
FROM
    movies
WHERE
    title LIKE '%thor%';-- this will return all thor movies irrespective thor word in the name becuase we added % before and after. If we remove % from before than it will return only movies which start with thor or if remove % from end it will return only the movies end with thor.   

SELECT 
    *
FROM
    movies
WHERE
    studio = '';

-- or

SELECT 
    *
FROM
    movies
WHERE
    studio IS NULL;

-- Print all movie titles and release year for all Marvel Studios movies.

SELECT 
    title, release_year
FROM
    movies
WHERE
    studio = 'Marvel Studios';

-- Print all movies that have Avenger in their name.

SELECT 
    *
FROM
    movies
WHERE
    title LIKE '%avenger%';

-- Print the year when the movie The Godfather was released.

SELECT 
    release_year
FROM
    movies
WHERE
    title = 'The GodFather';

-- Print all distinct movie studios in the Bollywood industry.

SELECT DISTINCT
    studio
FROM
    movies
WHERE
    industry = 'Bollywood';

-- I want movies whose imdb rating is greater than 9

SELECT 
    *
FROM
    movies
WHERE
    imdb_rating > 9;

-- I want movies whose imdb rating is between 6 and 8

SELECT 
    *
FROM
    movies
WHERE
    imdb_rating BETWEEN 6 AND 8;

-- I want movies from 2022,2019,2018 

SELECT 
    *
FROM
    movies
WHERE
    release_year = 2022
        OR release_year = 2019
        OR release_year = 2018;

-- or  

SELECT 
    *
FROM
    movies
WHERE
    release_year IN (2022 , 2019, 2018);

-- Record with nothing in imdb_rating
 
SELECT 
    *
FROM
    movies
WHERE
    imdb_rating IS NULL;
 
-- Record which is not null in imdb_rating
 
SELECT 
    *
FROM
    movies
WHERE
    imdb_rating IS NOT NULL;
 
-- I want to see all bollywood movie in such a way that movie with highest rating appear first
 
SELECT 
    *
FROM
    movies
WHERE
    industry = 'bollywood'
ORDER BY imdb_rating DESC;

-- Top 5 highest rating movies from bollywood

SELECT 
    *
FROM
    movies
WHERE
    industry = 'bollywood'
ORDER BY imdb_rating DESC
LIMIT 5;
 
-- I want to see 2nd highest rating movies upto 6th position movies from the bollywood
 
SELECT 
    *
FROM
    movies
WHERE
    industry = 'bollywood'
ORDER BY imdb_rating DESC
LIMIT 5 OFFSET 1;
    
-- Print all movies in the order of their release year
  
SELECT 
    *
FROM
    movies
ORDER BY release_year DESC;

-- All the movies release in the year 2022
  
SELECT 
    *
FROM
    movies
WHERE
    release_year = 2022;
  
-- All the movies release after the 2020
  
SELECT 
    *
FROM
    movies
WHERE
    release_year > 2020;
  
-- All the movies after the year 2020 and have imdb_rating greater than 8;
 
SELECT 
    *
FROM
    movies
WHERE
    release_year > 2020 AND imdb_rating > 8;
 
 -- All the movies by the Marvel studios and hombale films
 
SELECT 
    *
FROM
    movies
WHERE
    studio IN ('Marvel studios' , 'Hombale Films');
 
 -- All the thor movies by their release year
 
SELECT 
    *
FROM
    movies
WHERE
    title LIKE '%thor%'
ORDER BY release_year ASC;
 
 -- All the movies that are not from marvel studios
 
SELECT 
    *
FROM
    movies
WHERE
    studio NOT IN ('Marvel studios');

-- max imdb rating movies

SELECT 
    MAX(imdb_rating)
FROM
    movies;

-- min imdb rating movies

SELECT 
    MIN(imdb_rating)
FROM
    movies;

-- average imdb rating of marvel studios

SELECT 
    AVG(imdb_rating)
FROM
    movies
WHERE
    studio = 'Marvel Studios';

-- restrict imdb_rating average to 2 decimal points

SELECT 
    ROUND(AVG(imdb_rating), 2)
FROM
    movies
WHERE
    studio = 'Marvel Studios';

-- define costum column label using "as"

SELECT 
    ROUND(AVG(imdb_rating), 2) AS avg_rating
FROM
    movies
WHERE
    studio = 'Marvel Studios';

-- Print min, max and average imdb rating of marvel studios

SELECT 
    MIN(imdb_rating) AS min_rating,
    MAX(imdb_rating) AS max_rating,
    AVG(imdb_rating) AS avg_rating
FROM
    movies
WHERE
    studio = 'Marvel studios';

-- Print number of hollywood and bollywood movies using group by

SELECT 
    industry, COUNT(*)
FROM
    movies
GROUP BY industry;

-- Same thing but by studio

SELECT 
    studio, COUNT(*)
FROM
    movies
GROUP BY studio;

-- Same thing but I need only studio with more than 2 movies

SELECT 
    studio, COUNT(*) AS total_movies
FROM
    movies
GROUP BY studio
HAVING total_movies >= 2
ORDER BY total_movies DESC;

-- Same thing just remove the null data

SELECT 
    studio, COUNT(*) AS total_movies
FROM
    movies
WHERE
    studio != ''
GROUP BY studio
HAVING total_movies >= 2
ORDER BY total_movies DESC;


-- flow of execution of sql query : from => where => group by => having => order by
-- Having is similar to where clause but it is mostly used with group by

SELECT 
    COUNT(*)
FROM
    movies
WHERE
    release_year BETWEEN 2015 AND 2022;

-- Print the max and min movie release year

SELECT 
    MIN(release_year) AS min_year, MAX(release_year) AS max_year
FROM
    movies;

-- Print a year and how many movies were released in that year starting with the latest year

SELECT 
    release_year, COUNT(*) AS Count_movies
FROM
    movies
GROUP BY release_year
ORDER BY Count_movies DESC;

-- The column used in having statement must be present in select claus 
SELECT 
    release_year, COUNT(*) AS movies_count
FROM
    movies
GROUP BY release_year
HAVING movies_count > 2;

-- function to get current date
 
SELECT CURDATE();

-- function to get current year

SELECT YEAR(CURDATE());

SELECT 
    *
FROM
    actors;

SELECT 
    name, (YEAR(CURDATE()) - birth_year) AS age
FROM
    actors;

SELECT * from financials;
SELECT 
    *, (revenue - budget) AS profit
FROM
    financials;
    
    --  if(condition, action if condition true, action if condition is false)
SELECT 
    *,
    if(currency='usd',
		budget*77,
        budget) as budget_inr,
    IF(currency = 'USD',
        revenue * 77,
        revenue) AS revenue_inr
	
FROM
    financials;

-- Convert revenue to million
select 
	*,
    CASE
		when unit="thousands" then revenue/1000
        when unit="billions" then revenue*1000
        else revenue
	end as revenue_ml
    from 
    Financials;
    
-- Print profit % for all the movies

SELECT 
    *, ((revenue-budget)*100)/budget AS profit
FROM
    financials;
    
    
