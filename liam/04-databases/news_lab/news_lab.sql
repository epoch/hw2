CREATE TABLE users (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  name TEXT,
  email TEXT,
  image TEXT,
  description TEXT
);

CREATE TABLE articles (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  title TEXT,
  category TEXT,
  body TEXT,
  image TEXT,
  posted_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  user_id INTEGER
);