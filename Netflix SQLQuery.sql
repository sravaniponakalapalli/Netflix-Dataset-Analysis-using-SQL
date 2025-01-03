create database netflix
use netflix
        -------------------------------------------------------------------------------------
        -- Netflix Data Exploration: Content Trends, Actors, Genres, and Keywords Insights --
		-------------------------------------------------------------------------------------
select *
from netflix_data

select COUNT(*) as total_content
from netflix_data

-- 1. Count the number of Movies vs TV Shows
select type,COUNT(*) as counts
from netflix_data
group by type

-- 2. Find the most common rating for movies and TV shows
with cte as
(select type,rating,COUNT(*) as rating_count,RANK() over(partition by type order by count(*) desc) as ranks
from netflix_data
group by type,rating
)
select type,rating,rating_count
from cte
where ranks = 1

-- 3. List all movies released in a specific year (e.g., 2020)
select *
from netflix_data
where type='movie' and release_year= 2020

-- 4. Find the top 5 countries with the most content on Netflix
select country,COUNT(*) as counts
from netflix_data
where country is not null
group by country
order by COUNT(*) desc
offset 0 rows
fetch next 5 rows only
       -- or --
select top 5 country,COUNT(*) as counts
from netflix_data
where country is not null
group by country
order by COUNT(*) desc

-- 5. Identify the longest movie
select *
from netflix_data
where type='movie' and duration = (select MAX(duration) from netflix_data)

-- 6. Find content added in the last 5 years
select *
from netflix_data
where date_added >= DATEADD(year,-5,getdate())

-- 7. Find all the movies/TV shows by director 'Rajiv Chilaka'!
select *
from 
(select *,TRIM(value) as director_name
from netflix_data
cross apply string_split(director,',') as split_directors
)as sub_query
where director_name = 'Rajiv Chilaka'

-- 8. List all TV shows with more than 5 seasons
select *
from netflix_data
where type = 'Tv show' and TRY_CAST(replace(replace(duration,'seasons',''),'season','') as int) > 5

-- 9. Count the number of content items in each genre
with cte as
(select TRIM(value) as genre
from netflix_data
cross apply string_split(listed_in,',') as ss
)
select genre,COUNT(*) as content_items
from cte
group by genre
order by COUNT(*) desc

-- 10. Find each year and the average numbers of content release by India on netflix. 
-- return top 5 year with highest avg content release !
select top 5 release_year,country,count(show_id) as content_count,round(cast(COUNT(show_id) as float)/(select cast(COUNT(show_id) as float) from netflix_data where country = 'India') * 100,2) as avg_content
from netflix_data
where country = 'India'
group by release_year,country
order by avg_content desc

-- 11. List all movies that are documentaries
with cte as
(select *,TRIM(value) as genre
from netflix_data
cross apply string_split(listed_in,',') as ss
)
select *
from cte
where type = 'Movie' and genre = 'Documentaries'
       -- or --
select *
from netflix_data
where listed_in like '%Documentaries%'

-- 12. Find all content without a director
select *
from netflix_data
where director is null

-- 13. Find how many movies actor 'Salman Khan' appeared in last 10 years!
with cte as
(select *,TRIM(value) as actor
from netflix_data
cross apply string_split(cast,',') as ss
)
select *
from cte
where type = 'Movie' and actor = 'salman khan' and release_year >= YEAR(getdate())-10
     -- or --
select *
from netflix_data
where type = 'Movie' and cast like '%salman khan%' and release_year >= YEAR(dateadd(year,-10,getdate()))

-- 14. Find the top 10 actors who have appeared in the highest number of movies produced in India.
with cte as
(select *,TRIM(value) as actors
from netflix_data
cross apply string_split(cast,',') as ss
)
select top 10 actors,country,COUNT(*) as no_of_movies
from cte
where country = 'India' and type = 'Movie'
group by actors,country
order by no_of_movies desc

/*
15. Categorize the content based on the presence of the keywords 'kill' and 'violence' in the description field.
Label content containing these keywords as 'Bad' and all other content as 'Good'. Count how many items fall into each category.
*/
select show_id,type,title,description,
case when description like '%kill%' or description like '%violence%' then 'Bad' else 'good' end as content
from netflix_data


