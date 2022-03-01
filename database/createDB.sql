CREATE DATABASE IF NOT EXISTS Meteo;
USE Meteo;
CREATE TABLE Meteo.Countries (
    id INT AUTO_INCREMENT PRIMARY KEY, 
    name VARCHAR(255), 
    longitude DOUBLE NOT NULL,
    latitude DOUBLE NOT NULL,
    CONSTRAINT UC_country UNIQUE (name)
);

CREATE TABLE Meteo.Cities (
    id INT AUTO_INCREMENT PRIMARY KEY,  
    country_id INT,
    name VARCHAR(255),
    longitude DOUBLE NOT NULL,
    latitude DOUBLE NOT NULL,
    CONSTRAINT Fk_city FOREIGN KEY (country_id) REFERENCES Countries(id) ON DELETE CASCADE,
    CONSTRAINT UC_city UNIQUE (country_id, name)
);

CREATE TABLE Meteo.Temperatures (
    id INT AUTO_INCREMENT PRIMARY KEY, 
    value DOUBLE,
    timestamp TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    city_id INT,
    CONSTRAINT Fk_temp FOREIGN KEY (city_id) REFERENCES Cities(id) ON DELETE CASCADE,
    CONSTRAINT UC_temp UNIQUE (city_id, timestamp)
);