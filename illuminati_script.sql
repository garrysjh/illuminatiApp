-- Database Name:
CREATE DATABASE MyCoolApp;
USE MyCoolApp;
show tables;
create table user(id int auto_increment primary key, username varchar(255), password varchar(255), firstname varchar(255), lastname varchar(255), mobile varchar(255));
create table quiz(id int auto_increment primary key, quiztitle varchar(255), quizdesc varchar(255), creator_id int);
create table question(id int auto_increment primary key, questiondesc varchar(255), actualanswer int);
create table answer(id int auto_increment primary key, question_id int, user_id int, answer int);
