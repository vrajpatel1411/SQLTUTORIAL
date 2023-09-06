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

-- I want movies whose imdb rating is greater than 9

select * from movies where imdb_rating > 9;

-- I want movies whose imdb rating is between 6 and 8

select * from movies where imdb_rating Between 6 and 8;

-- I want movies from 2022,2019,2018 

select * from movies where release_year=2022 or release_year=2019 or release_year=2018;

-- or  

Select * from movies where release_year in (2022,2019,2018);

-- Record with nothing in imdb_rating
 
 select * from movies where imdb_rating is NUll;
 
-- Record which is not null in imdb_rating
 
 select * from movies where imdb_rating is not null;
 
-- I want to see all bollywood movie in such a way that movie with highest rating appear first
 
 Select * from movies where industry="bollywood" order by imdb_rating desc;

-- Top 5 highest rating movies from bollywood

 Select * from movies where industry="bollywood" order by imdb_rating desc limit 5;
 
-- I want to see 2nd highest rating movies upto 6th position movies from the bollywood
 
  Select * from movies where industry="bollywood" order by imdb_rating desc limit 5 offset 1;
    
-- Print all movies in the order of their release year
  
  select * from movies order by release_year desc;

-- All the movies release in the year 2022
  
  Select * from movies where release_year=2022;
  
-- All the movies release after the 2020
  
  Select * from movies where release_year > 2020;
  
-- All the movies after the year 2020 and have imdb_rating greater than 8;
 
 Select * from movies where release_year > 2020 and imdb_rating > 8;
 
 -- All the movies by the Marvel studios and hombale films
 
 Select * from movies where studio in ("Marvel studios","Hombale Films");
 
 -- All the thor movies by their release year
 
 Select * from movies where title like "%thor%" order by release_year asc;
 
 -- All the movies that are not from marvel studios
 
 Select * from movies where studio not in ("Marvel studios");

-- max imdb rating movies

Select max(imdb_rating) from movies;

-- min imdb rating movies

Select min(imdb_rating) from movies;

-- average imdb rating of marvel studios

Select avg(imdb_rating) from movies where studio="Marvel Studios";

-- restrict imdb_rating average to 2 decimal points

Select round(avg(imdb_rating),2) from movies where studio="Marvel Studios";

-- define costum column label using "as"

Select round(avg(imdb_rating),2) as avg_rating from movies where studio="Marvel Studios";

-- Print min, max and average imdb rating of marvel studios

Select min(imdb_rating) as min_rating, max(imdb_rating) as max_rating, avg(imdb_rating) as avg_rating from movies where studio="Marvel studios";

-- Print number of hollywood and bollywood movies using group by

Select industry, count(*) from movies group by industry;

-- Same thing but by studio

Select studio, count(*) from movies group by studio;

-- Same thing but I need only studio with more than 2 movies

Select studio, count(*) as total_movies from movies group by studio having total_movies>=2 order by total_movies desc;

-- Same thing just remove the null data

Select studio, count(*) as total_movies from movies where studio != "" group by studio having total_movies>=2 order by total_movies desc;


-- flow of execution of sql query : from => where => group by => having => order by
-- Having is similar to where clause but it is mostly used with group by

-- How many movies were released between 2015 and 2022

Select count(*) from movies where release_year between 2015 and 2022;

-- Print the max and min movie release year

Select min(release_year) as min_year, max(release_year) as max_year from movies ;  

-- Print a year and how many movies were released in that year starting with the latest year

Select release_year , count(*) as Count_movies from movies group by release_year order by Count_movies desc;
