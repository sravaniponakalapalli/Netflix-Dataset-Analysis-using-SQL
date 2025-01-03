# Netflix Dataset Analysis
## Overview
This project analyzes Netflix's dataset using SQL to uncover insights about its content, including movies and TV shows. The dataset contains information on titles, directors, cast, countries, release years, ratings, and more.
## Objective
To explore and answer key questions about Netflix content trends, such as:

- Most common ratings.
- Top countries producing content.
- Trends in genres, actors, and directors.
- Categorization of content based on keywords like 'kill' and 'violence'.
## Tools Used
- SQL Server for data processing.
- Functions: STRING_SPLIT, CROSS APPLY, COUNT, CASE, and MAX.
- Query techniques: CTEs, filtering, grouping, and aggregations.
## **Dataset Overview**
### Columns:
- **show_id**: Unique identifier for the content.
- **type**: Type of content (Movie/TV Show).
- **title**: Title of the content.
- **director**: Director of the content.
- **cast**: Cast members of the content.
- **country**: Country where the content was produced.
- **date_added**: Date the content was added to Netflix.
- **release_year**: Year the content was released.
- **rating**: Maturity rating of the content.
- **duration**: Duration of the content (runtime or number of seasons).
- **listed_in**: Genres associated with the content.
- **description**: Description of the content.
  
## **Key Questions Answered**

### 1. **Most Common Rating**
   - Identified the most common rating across all movies and TV shows.

### 2. **Top 5 Countries with Most Content**
   - Determined the top 5 countries producing the most content on Netflix.

### 3. **Movies Released in a Specific Year (e.g., 2020)**
   - Filtered all movies released in a specific year.

### 4. **Longest Movie**
   - Found the movie with the longest duration.

### 5. **Content Added in the Last 5 Years**
   - Identified all content added to Netflix in the last 5 years.

### 6. **Top 10 Actors by Number of Movies Produced in India**
   - Determined the top 10 actors who appeared in the highest number of movies produced in India.

### 7. **Categorize Content Based on Keywords**
   - Categorized content as 'Good' or 'Bad' based on the presence of keywords 'kill' and 'violence' in the description field.

### 8. **TV Shows with More Than 5 Seasons**
   - Listed all TV shows that have more than 5 seasons.

### 9. **Content Count by Genre**
   - Counted the number of content items in each genre, accounting for multiple genres listed in the same row.

### 10. **Top 5 Years with Highest Average Content Releases by India**
   - Found the top 5 years with the highest average number of content releases produced in India.

### 11. **Movies Featuring 'Salman Khan' in the Last 10 Years**
   - Calculated how many movies actor Salman Khan appeared in during the last 10 years.

## Conclusion

This project provides an in-depth analysis of Netflix data, offering insights into content trends and audience preferences. The findings can be leveraged to optimize content recommendations, identify audience segments, and improve content production strategies.



