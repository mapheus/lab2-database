DROP TABLE IF EXISTS theater;
CREATE TABLE theater (
  theater_name		TEXT,
  capacity		INT
  PRIMARY KEY  (theater_name);
);

DROP TABLE IF EXISTS performance;
CREATE TABLE performance (
  performance_id	TEXT DEFAULT (lower(hex(randomblob(16)))),
  start_time		DATE,
  theater_name		TEXT,
  imdb_key		TEXT
  PRIMARY KEY (performance_id);
  FOREIGN KEY (theater_name) REFERENCES theater(theater_name);
  FOREIGN KEY (imdb_key) REFERENCES movies(imdb_key);
);

DROP TABLE IF EXISTS movie;
CREATE TABLE movie (
  imdb_key		TEXT DEFAULT (lower(hex(randomblob(16)))),
  movie_name		TEXT,
  production_year	INT,
  running_time		INT
  PRIMARY KEY (imdb_key);
);

DROP TABLE IF EXISTS ticket;
CREATE TABLE ticket (
  t_id		TEXT DEFAULT (lower(hex(randomblob(16)))),
  performance_id	TEXT,
  username		TEXT
  PRIMARY KEY (t_id);
  FOREIGN KEY (performance_id) REFERENCES performance(performance_id);
  FOREIGN KEY (username) REFERENCES customer(username);
);

DROP TABLE IF EXISTS customer;
CREATE TABLE customer(
  username		TEXT,
  full_name		TEXT,
  password		TEXT,
  t_id			TEXT
  PRIMARY KEY (username);
  FOREIGN KEY (t_id) REFERENCES ticket(t_id);
);
