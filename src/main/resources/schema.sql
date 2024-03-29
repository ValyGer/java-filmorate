DROP TABLE IF EXISTS  genres, rating, films, users, film_likes, film_genres, friendship_status;

-- Определение таблиц
-- таблица с жанрами
CREATE TABLE IF NOT EXISTS genres (
  genre_id integer NOT NULL GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
  genre_name varchar(255) NOT NULL
);

-- таблица с рейтингами
CREATE TABLE IF NOT EXISTS rating (
  rating_id integer NOT NULL GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
  rating_name varchar(255) NOT NULL
);

-- таблица с фильмами
CREATE TABLE IF NOT EXISTS films (
  film_id integer NOT NULL GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
  film_name varchar(255) NOT NULL,
  description varchar(200) NOT NULL,
  releaseDate date NOT NULL,
  duration integer NOT NULL,
  rating_id integer REFERENCES rating(rating_id) ON DELETE RESTRICT ON UPDATE CASCADE
);

-- таблица с пользователями
CREATE TABLE IF NOT EXISTS users (
  user_id integer NOT NULL GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
  email varchar(255) NOT NULL,
  login varchar(255) NOT NULL,
  user_name varchar(255),
  birthday date
);

-- таблица соответствия фильмов и лайков
CREATE TABLE IF NOT EXISTS film_likes (
  film_id integer REFERENCES users (user_id) ON DELETE RESTRICT ON UPDATE CASCADE,
  user_id integer REFERENCES films (film_id) ON DELETE RESTRICT ON UPDATE CASCADE
);

-- таблица соответствия фильмов и жанров
CREATE TABLE IF NOT EXISTS film_genres (
  film_id integer REFERENCES films (film_id) ON DELETE RESTRICT ON UPDATE CASCADE,
  genre_id integer REFERENCES genres (genre_id) ON DELETE RESTRICT ON UPDATE CASCADE
);

-- таблица дружбы
CREATE TABLE IF NOT EXISTS friendship_status (
  user_id integer REFERENCES users (user_id) ON DELETE RESTRICT ON UPDATE CASCADE,
  friend_id integer REFERENCES users (user_id) ON DELETE RESTRICT ON UPDATE CASCADE,
  status boolean
);