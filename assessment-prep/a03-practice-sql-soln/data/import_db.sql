CREATE TABLE movie (
  id INTEGER PRIMARY KEY,
  title VARCHAR(255) NOT NULL,
  yr INTEGER NOT NULL,
  director INTEGER NOT NULL
);

CREATE TABLE actor (
  id INTEGER PRIMARY KEY,
  name VARCHAR(255) NOT NULL
);

CREATE TABLE casting (
  movieid INTEGER NOT NULL,
  actorid INTEGER NOT NULL,
  ord INTEGER NOT NULL,
  
  FOREIGN KEY(movieid) REFERENCES movie(id),
  FOREIGN KEY(actorid) REFERENCES actor(id)
);

.separator "\t"
.import "./data/tabmovie.txt" movie
.import "./data/tabactor.txt" actor
.import "./data/tabcasting.txt" casting
