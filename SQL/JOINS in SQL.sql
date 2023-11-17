-- This Sql file include the multiple table.

-- When we used single table for all information their is issue of data redundancy, Data is not organized and updation of data is difficult. Hence to avoid this issue we uses multiple table.

-- SQL JOINS



use moviesdb;

SELECT 
    *
FROM
    movies;
    
SELECT 
    *
FROM
    financials;
    
SELECT 
    *
FROM
    Languages;
    
    
-- Inner Joins - When we do inner join it will only return columns which are present in both  table. In the below example movie with id 106 and 112 is not present in financial table and similar 406 and 412 movies id financial information is available in financial table however movies with that id are not present in the movies table. Hence inner join will not consider this row in the final result.
-- if I don't write any things before join it is automatically inner join
SELECT 
    m.movie_id, title, budget, revenue, currency, unit
FROM
    movies m
        INNER JOIN
    financials f ON m.movie_id = f.movie_id;-- no information about movies with 106 , 112 , 406 and 412 present in the output.


SELECT 
    m.movie_id, title, budget, revenue, currency, unit
FROM
    movies m
        LEFT JOIN
    financials f ON m.movie_id = f.movie_id;

-- Right Joins - It is a opposite of left join

SELECT 
    m.movie_id, title, budget, revenue, currency, unit
FROM
    movies m
        RIGHT JOIN
    financials f ON m.movie_id = f.movie_id;

-- Full Join - It will return all the information after joining both the table. If their is some missing records it will put null but show all record from both the table.

SELECT 
    m.movie_id, title, budget, revenue, currency, unit
FROM
    movies m
        LEFT JOIN
    financials f ON m.movie_id = f.movie_id 
UNION SELECT 
    f.movie_id, title, budget, revenue, currency, unit
FROM
    movies m
        RIGHT JOIN
    financials f ON m.movie_id = f.movie_id;


-- Show all the movies with their language names

SELECT 
    movie_id, title, name
FROM
    movies m
        JOIN
    languages l ON m.language_id = l.language_id;

-- Show all Telugu movie names (assuming you don't know the language id for Telugu)

SELECT 
    movie_id, title, l.name
FROM
    movies m
        JOIN
    languages l ON m.language_id = l.language_id
WHERE
    l.name = 'telugu';

--  Show the language and number of movies released in that language

SELECT 
    name, COUNT(m.movie_id) AS number_of_movies
FROM
    movies m
        RIGHT JOIN
    languages l ON m.language_id = l.language_id
GROUP BY m.language_id
ORDER BY number_of_movies DESC;

-- Calculate the profit Made by each movies

SELECT 
    movies.movie_id,
    title,
    CASE
        WHEN unit = 'thousands' THEN ROUND((revenue - budget) / 1000, 2)
        WHEN unit = 'billions' THEN ROUND((revenue - budget) * 1000, 2)
        ELSE ROUND((revenue - budget), 2)
    END AS profit_ml,
    currency
FROM
    movies
        JOIN
    financials ON movies.movie_id = financials.movie_id
WHERE
    industry = 'bollywood'
ORDER BY profit_ml DESC;


SELECT 
    m.title, GROUP_CONCAT(a.namE) AS movie_actors
FROM
    movies AS m
        JOIN
    movie_actor AS ma ON m.movie_id = ma.movie_id
        JOIN
    actors a ON ma.actor_id = a.actor_id
GROUP BY m.movie_id; 


-- Same thing above but now I want to know which movies is done by which actor

Select a.name,group_concat(m.title SEPARATOR "|"),COUNT(M.TITLE) as No_movies from actors a join movie_actor ma on a.actor_id=ma.actor_id join movies m on ma.movie_id=m.movie_id group by a.actor_id order by No_movies desc ;

-- 1. Generate a report of all Hindi movies sorted by their revenue amount in millions.
-- Print movie name, revenue, currency, and unit

Select m.title, f.revenue,
case
when f.unit="thousands" then round((f.revenue/1000),2)
when f.unit="billions" then round((f.revenue*1000),2)
else f.revenue
end as Revenue_in_Millions,
f.currency,
f.unit
from movies m join financials f on m.movie_id=f.movie_id join languages l on m.language_id=l.language_id where l.name="hindi"  order by Revenue_in_millions Desc; 
