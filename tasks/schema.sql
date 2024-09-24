
CREATE DATABASE roast_app;
USE roast_app;

CREATE TABLE users (
  id integer PRIMARY KEY AUTO_INCREMENT,
  firstName VARCHAR(255) NOT NULL,
  lastName VARCHAR(255) NOT NULL,
  userName VARCHAR(255) NOT NULL,
  passWord VarChar(255) NOT NULL,
  created TIMESTAMP NOT NULL DEFAULT NOW()
);

CREATE TABLE cafes (
  id integer PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(255) NOT NULL,
  rating integer,
  address VARCHAR(255) NOT NULL,
  city VARCHAR(255) NOT NULL,
  state VARCHAR(255) NOT NULL,
  zipcode VARCHAR(255) NOT NULL,
  owner_id integer,
  beans integer,
  CHECK (rating > 0 AND rating <= 5),
  created TIMESTAMP NOT NULL DEFAULT NOW()
);

CREATE TABLE reviews (
  id integer PRIMARY KEY AUTO_INCREMENT,
  poster_id integer,
  cafe_id integer,
  rating integer,
  content text,
  CHECK (rating > 0 AND rating <= 5),
  created TIMESTAMP NOT NULL DEFAULT NOW()
);

CREATE TABLE beans (
  id integer PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(255) NOT NULL,
  roastery integer,
  roast integer,
  singleOrigin boolean,
  region VARCHAR(255),
  created TIMESTAMP NOT NULL DEFAULT NOW()
);

CREATE TABLE roasteries (
  id integer PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(255),
  website text,
  created TIMESTAMP NOT NULL DEFAULT NOW()
);

INSERT INTO users (firstName, lastName, userName, passWord)
VALUES 
('John', 'Smith', "jsmith999", "GoodPassword123!"),
('Adam', "Johnson", "theCoffeeGuy112", "1L0v3C0ffee!");