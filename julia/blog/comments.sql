CREATE TABLE comments (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  author TEXT,
  content TEXT,
  created_at TEXT,
  updated_at TEXT,
  post_id INTEGER
);