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
SELECT m.movie_id, title, budget, revenue, currency, unit from movies m inner join financials f on m.movie_id=f.movie_id;  -- no information about movies with 106 , 112 , 406 and 412 present in the output.


-- Left Joins- It will return all information from the left table and their respective information from right table. However if their is no information in right table about some record from left it will simple put null.
SELECT m.movie_id, title, budget, revenue, currency, unit from movies m Left join financials f on m.movie_id=f.movie_id;

-- Right Joins - It is a opposite of left join

SELECT m.movie_id, title, budget, revenue, currency, unit from movies m Right join financials f on m.movie_id=f.movie_id; 

-- Full Join - It will return all the information after joining both the table. If their is some missing records it will put null but show all record from both the table.

SELECT m.movie_id, title, budget, revenue, currency, unit from movies m Left join financials f on m.movie_id=f.movie_id
union
SELECT f.movie_id, title, budget, revenue, currency, unit from movies m Right join financials f on m.movie_id=f.movie_id;


-- Show all the movies with their language names

Select movie_id, title, name from movies m join languages l on m.language_id=l.language_id;

-- Show all Telugu movie names (assuming you don't know the language id for Telugu)

Select movie_id, title, l.name from movies m join languages l on m.language_id=l.language_id where l.name='telugu';

--  Show the language and number of movies released in that language

select name, count(m.movie_id) as number_of_movies from movies m right join languages l on m.language_id=l.language_id group by m.language_id order by number_of_movies Desc;


