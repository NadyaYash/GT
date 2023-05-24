create database online_courses;
use online_courses;
CREATE TABLE students (
	student_id int PRIMARY KEY auto_increment,
    created_at timestamp DEFAULT current_timestamp,
    fullname varchar(64) NOT NULL,
    email varchar(64) UNIQUE
);

CREATE TABLE groupss (
	group_id int PRIMARY KEY auto_increment,
    created_at timestamp DEFAULT current_timestamp,
    name varchar(64) NOT NULL
);

CREATE TABLE students_attachments (
	student_attachment_id int PRIMARY KEY auto_increment,
    created_at timestamp DEFAULT current_timestamp,
	group_id int NOT NULL,
	student_id int NOT NULL,
    start timestamp default NULL,
    finish timestamp default NULL
);

INSERT INTO students (fullname, email)
VALUES
		('Ivanov Ivan', 'hello@example.org'),
    ('Petr Petrov', 'user@example.lorg'),
		('Sidr Sidorov', 'linux_user@example.lorg');

INSERT INTO groupss (name)
VALUES
	('Group 1');

INSERT INTO students_attachments (group_id, student_id, start)
VALUES
	(1, 1, CURRENT_TIMESTAMP),
	(1, 2, TIMESTAMP('2023-06-01 00:00:00')),
	(1, 3, TIMESTAMP('2023-07-01 00:00:00'));
    
    select * from students_attachments;
    
    
    use online_courses;
-- Опишите схему таблицу "расписание занятий"
create table Timetable(
lesson_id int PRIMARY KEY auto_increment,
lesson_name varchar(50) not null,
created_at timestamp DEFAULT current_timestamp,
date_time timestamp default null,
group_id int not null);

-- Опишите схему таблицы "преподаватели"
create table Tutors(
full_name varchar(50) not null,
lesson_id int not null,
age int not null);

-- Вывести имена студентов и названия групп, в которых они состоят
select students.fullname, groupss.name
from students
join groupss
join students_attachments
on students_attachments.group_id = groupss.group_id and students_attachments.student_id = students.student_id;

