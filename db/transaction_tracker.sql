DROP TABLE IF EXISTS tags;
DROP TABLE IF EXISTS transactions;
DROP TABLE IF EXISTS people;

CREATE TABLE people
(
  id SERIAL4 PRIMARY KEY,
  name VARCHAR(255),
  budget INT4
);

CREATE TABLE transactions
(
  id SERIAL4 PRIMARY KEY,
  person_id INT4 REFERENCES people(id) ON DELETE CASCADE
  tag_id INT4 REFERENCES tags(id) ON DELETE CASCADE 
  merchant VARCHAR(255),
  value INT4,
  purchased_on DATE
);

CREATE TABLE tags
(
  id SERIAL4 PRIMARY KEY,
  tag_name VARCHAR(255),
);