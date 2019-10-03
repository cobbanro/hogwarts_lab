DROP TABLE students;
DROP TABLE houses;


CREATE TABLE houses(
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255),
  url TEXT
);

CREATE TABLE students(
  id SERIAL8 PRIMARY KEY,
  first_name VARCHAR(255),
  last_name VARCHAR(255),
  age INT,
  house_id INT8 REFERENCES houses(id)
);
