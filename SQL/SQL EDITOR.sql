-- Database is nothing but a collection of tabular data built across rows and columns. 

SELECT * FROM moviesdb.movies; -- This will return all data in movies table from moviesdb database

select title, industry FROM moviesdb.movies; -- This will only return the title and industry columns from the movies table from moviesdb database. 

-- So now we can see that we everytime write the moviesdb because we have multiple database and how the sql server will where our table and in which database it is stored. That's why we are using moviesdb.[TABLE NAME]. We can also do following thing as shown below:

USE moviesdb; -- So this will set the default database.

Select * from movies;

-- Now I want all movies data from bollywood so we will use "Where" Clause

Select * from movies where industry="bollywood"; 

-- Return the count of bollywood and hollywood movies

Select count(*) from movies where industry="bollywood";

Select count(*) from movies where industry="Hollywood";


-- Return the distinct industry

Select distinct industry from movies;

-- Return all record where title has thor. 

-- like is called wild card search

Select * From movies where title like "%thor%"; -- this will return all thor movies irrespective thor word in the name becuase we added % before and after. If we remove % from before than it will return only movies which start with thor or if remove % from end it will return only the movies end with thor.   

-- So it is normal that the table have null or empty value . So now I want all record where studio has null value.

Select * from movies where studio=""; 
-- or
Select * from movies where studio is null; 

-- Print all movie titles and release year for all Marvel Studios movies.
select title,release_year from movies where studio="Marvel Studios";
-- Print all movies that have Avenger in their name.
select * from movies where title like "%avenger%";
-- Print the year when the movie The Godfather was released.
select release_year from movies where title="The GodFather";
-- Print all distinct movie studios in the Bollywood industry.
select distinct studio from movies where industry="Bollywood";


