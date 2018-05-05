-- Movie Genres
-- Write a query to find which genres are most clear-cut.
-- Question to ask: what does clear-cut mean? (average genre, the lower the more clear-cut) What tables do we have and what are the data fields? (Table genres_movies: movie_id, genre_id)
SELECT genre_id, ROUND(AVG(count), 1) AS num_genre
FROM genres_movies
JOIN
(SELECT movie_id, COUNT(genre_id) AS count
FROM genres_movies
GROUP BY movie_id) AS movie_numGenre
ON genres_movies.movie_id = movie_numGenre.movie_id
GROUP BY genre_id
ORDER BY num_genre;

