-- Database Name:
CREATE DATABASE MyCoolApp;
USE MyCoolApp;

--Entities/Tables:
--User
CREATE TABLE User(
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL,
    password VARCHAR(255) NOT NULL,
    firstname VARCHAR(50) NOT NULL,
    lastname VARCHAR(50),
    mobile VARCHAR(50) NOT NULL
);

--Quiz
CREATE TABLE Quiz(
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    quiztitle varchar(50) NOT NULL,
    quizdesc varchar(100)
);

--Question
CREATE TABLE Question(
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    quiz_id INT NOT NULL,
    questiondesc varchar(255),
    maxtime int(50),
    actualanswer INT NOT NULL
);

--Answer
CREATE TABLE Answer(
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    question_id INT NOT NULL,
    user_id INT NOT NULL,
    answergiven INT NOT NULL,
    comments varchar(255)   
);
