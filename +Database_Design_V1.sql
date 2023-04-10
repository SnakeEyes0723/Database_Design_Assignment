CREATE SCHEMA app;

Use app;

CREATE TABLE IF NOT EXISTS artist (
artist_id INT AUTO_INCREMENT, 
first_name VARCHAR(50) NOT NULL,
last_name VARCHAR(50) NOT NULL, 
birth_date DATE, 
PRIMARY KEY (artist_id)
);

CREATE TABLE IF NOT EXISTS genre (
genre_id INT AUTO_INCREMENT, 
genre_name VARCHAR(50) NOT NULL,
PRIMARY KEY (genre_id)
);

CREATE TABLE IF NOT EXISTS songs (
songs_id INT AUTO_INCREMENT, 
title VARCHAR(50) NOT NULL,
duration VARCHAR(50),
explicity BOOL NULL DEFAULT FALSE,
cloud_link VARCHAR(255) NULL,
artist_id INT NOT NULL,
genre_id INT NOT NULL,
PRIMARY KEY (songs_id),
FOREIGN KEY (artist_id) REFERENCES artist(artist_id),
FOREIGN KEY (genre_id) REFERENCES genre(genre_id)
);

CREATE TABLE IF NOT EXISTS song_genre (
genre_id INT,
songs_id INT,
PRIMARY KEY (songs_id, genre_id),
FOREIGN KEY (genre_id) REFERENCES genre(genre_id),
FOREIGN KEY (songs_id) REFERENCES songs(songs_id)
);

CREATE TABLE IF NOT EXISTS playlist (
playlist_id INT AUTO_INCREMENT, 
orders INT NOT NULL,
ranks INT NOT NULL,
song_id INT NOT NULL,
PRIMARY KEY (playlist_id), 
FOREIGN KEY (songs_id) REFERENCES songs(songs_id)
);

CREATE TABLE IF NOT EXISTS some_user (
some_user_id INT AUTO_INCREMENT, 
email VARCHAR(50) NOT NULL,
first_name VARCHAR(50) NOT NULL,
last_name VARCHAR(50) NOT NULL,
user_password VARCHAR(255) NOT NULL,
PRIMARY KEY (some_user_id),
FOREIGN KEY (playlist_id) REFERENCES playlist(playlist_id),
UNIQUE (email)
);

CREATE TABLE IF NOT EXISTS favorite (
favorite_id INT AUTO_INCREMENT, 
some_user_id INT NOT NULL,
songs_id INT NOT NULL,
PRIMARY KEY (favorite_id),
FOREIGN KEY (some_user_id) REFERENCES some_user(some_user_id),
FOREIGN KEY (songs_id) REFERENCES songs(songs_id)
);