SELECT * FROM data;

-- 1) What are the different genres?--

SELECT DISTINCT(prime_genre) FROM data;

-- 2) Which is the genre with the most apps rated?--
SELECT prime_genre, 
   SUM (rating_count_tot) AS sum_ratings
  FROM data
  GROUP BY prime_genre
  ORDER BY sum_ratings DESC 
  LIMIT 1;
 
 -- 3) Which is the genre with most apps?
 SELECT prime_genre, 
  COUNT(rating_count_tot) as count_ratings
  FROM data
  GROUP BY prime_genre
  ORDER BY count_ratings DESC;
  
  -- 4) Which is the one with least?
  SELECT prime_genre, 
  	COUNT(id)
  	FROM data
  	GROUP BY prime_genre
  	ORDER BY count
	LIMIT 1;
	
-- 5) Find the top 10 apps most rated
SELECT track_name, rating_count_tot 
	FROM data
	ORDER BY rating_count_tot DESC LIMIT 10;
	
-- 6) Find the top 10 apps best rated by users.
SELECT track_name, user_rating, rating_count_tot
	FROM data
	ORDER BY (user_rating) DESC LIMIT 10;
	
-- 7) Take a look at the data you retrieved in question 5. Give some insights.
-- * There is no clear connection between amount of ratings and app ranking

-- 8) Take a look at the data you retrieved in question 6. Give some insights.
-- * Best evaluated apps are not necessarily ranked amongst the most ranked ones.

-- 9) Now compare the data from questions 5 and 6. What do you see?
SELECT track_name, user_rating, rating_count_tot 
	FROM data
	ORDER BY user_rating DESC,
	         rating_count_tot DESC;
			 
			 -- No aparent correlation between evaluations and rankings.
			 
-- 10) How could you take the top 3 regarding both user ratings and number of votes?
SELECT track_name, user_rating, rating_count_tot 
	FROM data
	ORDER BY user_rating DESC, 
	         rating_count_tot DESC LIMIT 3;
			 
-- 11) Do people care about the price of an app? 

SELECT track_name, user_rating, rating_count_tot, price
	FROM data
	ORDER BY price DESC LIMIT 10;
	-- * Way less votes for expensive apps.
	-- * Amongst the TOP 10 BEST RANKED APPs, there's only one free app.
	
-- Bonus: Find the total number of games available in more than 1 language.

select count(*)
	from data
	where prime_genre = 'Games'
	and "lang.num" > 1; 

-- Bonus2: Find the number of free vs paid apps
create temporary table tmp as
SELECT CASE WHEN price = 0 THEN 1 else 0 END AS fl_free,
	COUNT(*) as fcount_apps
FROM data
	group by fl_free
	limit 10;
	
select * from tmp;
--Bonus3: Find the number of free vs paid apps for each genre

SELECT prime_genre, CASE WHEN price = 0 THEN 1 else 0 END AS fl_free,
	COUNT(*) as fcount_apps
FROM data
	group by fl_free, prime_genre
	order by prime_genre, fl_free;
