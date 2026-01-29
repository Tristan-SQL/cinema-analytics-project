-- Create database
CREATE DATABASE cinema_analytics;
USE cinema_analytics;

-- Create halls table
CREATE TABLE halls (
    hall_id INT PRIMARY KEY AUTO_INCREMENT,
    hall_name VARCHAR(50),
    capacity INT
);

-- Create movies table
CREATE TABLE movies (
    movie_id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(100),
    duration_min INT,
    genre VARCHAR(50)
);

-- Create shows table
CREATE TABLE shows (
    show_id INT PRIMARY KEY AUTO_INCREMENT,
    movie_id INT,
    hall_id INT,
    show_time DATETIME,
    price DECIMAL(6,2),
    FOREIGN KEY (movie_id) REFERENCES movies(movie_id),
    FOREIGN KEY (hall_id) REFERENCES halls(hall_id)
);

-- Create tickets table
CREATE TABLE tickets (
    ticket_id INT PRIMARY KEY AUTO_INCREMENT,
    show_id INT,
    sold_at DATETIME,
    FOREIGN KEY (show_id) REFERENCES shows(show_id)
);
