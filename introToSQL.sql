-- Query all of the entries in the Genre table
SELECT * FROM Genre;

-- Using the INSERT statement, add one of your favorite artists to the Artist table.
SELECT * FROM Artist;
INSERT INTO Artist (ArtistName, YearEstablished) VALUES ('Brittany spears', '1991');

-- Using the INSERT statement, add one, or more, albums by your artist to the Album table.
SELECT * FROM Album;
INSERT INTO Album (Title, ReleaseDate, AlbumLength, Label, ArtistId, GenreId) VALUES ('the dog album', 'today', 111, 'brit label', 6, 1);

-- Using the INSERT statement, add some songs that are on that album to the Song table.
SELECT * FROM Song;
INSERT INTO Song (Title, SongLength, ReleaseDate, GenreId, ArtistId, AlbumId) VALUES ('meowza 89', 1000, 'yesterday', 4, 8, 23);

-- Write a SELECT query that provides the song titles, album title, and artist name for all of the data you just entered in. 
--Use the LEFT JOIN keyword sequence to connect the tables, and the WHERE keyword to filter the results to the album and artist you added.
SELECT * FROM Artist;
SELECT s.Title AS songTitle, a.Title AS albumTitle, art.ArtistName from Song s
JOIN Album a ON a.Id = s.AlbumId
JOIN Artist art ON art.Id = s.ArtistId
WHERE art.ArtistName = 'Black Flag' AND s.Title = 'meowza 89';

-- Reminder: Direction of join matters. Try the following statements and see the difference in results.

-- SELECT a.Title, s.Title FROM Album a LEFT JOIN Song s ON s.AlbumId = a.AlbumId;
SELECT * FROM Album;
SELECT a.Title, s.Title FROM Album a 
LEFT JOIN Song s ON s.AlbumId = a.Id;

-- SELECT a.Title, s.Title FROM Song s LEFT JOIN Album a ON s.AlbumId = a.AlbumId;
SELECT a.Title, s.Title FROM Song s 
LEFT JOIN Album a ON s.ArtistId = a.Id;

-- Write a SELECT statement to display how many songs exist for each album. You'll need to use the COUNT() function and the GROUP BY keyword sequence.
SELECT * FROM Song;
SELECT * FROM Album;
SELECT COUNT(s.Title) AS amountOfSongs, a.Title AS albumTitle FROM Song s
JOIN Album a ON a.Id = s.AlbumId
GROUP BY a.Title;

-- Write a SELECT statement to display how many songs exist for each artist. You'll need to use the COUNT() function and the GROUP BY keyword sequence.
SELECT * FROM Song;
SELECT * FROM Artist;
SELECT COUNT(s.Title) AS numberOfSongs, a.ArtistName FROM Song s
JOIN Artist a ON s.ArtistId = a.Id
GROUP BY a.ArtistName;

-- Write a SELECT statement to display how many songs exist for each genre. You'll need to use the COUNT() function and the GROUP BY keyword sequence.
SELECT * FROM Song;
SELECT * FROM Genre;
SELECT COUNT(s.Title) AS numberOfSongs, g.Label FROM Song s
JOIN Genre g ON g.Id = s.GenreId
GROUP BY g.Label;

-- Using MAX() function, write a select statement to find the album with the longest duration. The result should display the album title and the duration.
SELECT * FROM Album;
SELECT a.AlbumLength, a.Title FROM Album a
WHERE (SELECT MAX(AlbumLength) AS test FROM Album) = a.AlbumLength;

SELECT MAX(AlbumLength) FROM Album;
SELECT Top 1 AlbumLength, Title FROM Album
ORDER BY AlbumLength desc;

-- Using MAX() function, write a select statement to find the song with the longest duration. The result should display the song title and the duration.
SELECT * FROM Song;
SELECT * FROM Album;
SELECT s.Title, s.SongLength, a.Title FROM Song s 
JOIN Album a ON a.Id = s.AlbumId
WHERE (SELECT MAX(s.SongLength) FROM Song s) = s.SongLength;

-- Modify the previous query to also display the title of the album.

