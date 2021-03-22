-- SELECT *
-- FROM departments d
-- where dept_name = 'Marketing';
--
-- -- select s.salary, de.from_date, de.to_date, de.dept_no, sum(salary)
-- -- from salaries s
-- -- inner join dept_emp de on s.emp_no = de.emp_no
-- -- where dept_no = 'd001'
-- -- and de.from_date >= '1990-1-1'
-- -- and de.to_date <= '1992-12-31';
--
-- select d.dept_name, sum(salary)
-- from departments d
-- inner join dept_emp de on d.dept_no = de.dept_no
-- inner join salaries s2 on de.emp_no = s2.emp_no
-- where dept_name = 'Marketing'
-- and s2.from_date >= '1990-1-1'
-- and s2.to_date <= '1992-12-31';
--
-- where from_date >= '1990-1-1' and to_date <= '1992-12-31';
-- -- select *
-- -- from dept_emp de
-- -- where dept_no ='d001';
--
-- select format(from_date, 'd', 'no')
-- from salaries s;
--
-- select length(" how long is this string") as LengthOfString;
--
-- select lower("WHY ARE YOU YELLING AT ME") as LowerCase;
--
-- select ltrim("          why is there so much space in front of this sentence?") as TrimmedStr;
--
-- select repeat("I like to repeat myself.", 5);
--
-- select rtrim("So much space behind me.             ") as RemoveSpaceFromBack;
--
-- select reverse("semordnilap");
--
-- select strcmp("Is this the same", "I don't think so");
--
-- select substring("We like removing odd parts of the sentence.", 4, 4) as ExtractStr;
drop database if exists social_db;
create database social_db;
use social_db;
drop table if exists users;
drop table if exists post;
drop table if exists comments;

create table comments(
comment_id int not null auto_increment,
comment_body varchar(10000) not null,
time_of_comment timestamp,
primary key(comment_id)
);

create table post(
post_id int not null auto_increment,
comment_id int not null,
post_title char(50) not null,
post_body char(50) not null,
time_of_post timestamp not null,
primary key(post_id),
foreign key(comment_id) references comments(comment_id)
);

create table users(
user_id int not null auto_increment,
post_id int,
comment_id int,
username char(50),
first_name char(50),
last_name char(50),
email char(50),
primary key(user_id),
foreign key(post_id) references post(post_id),
foreign key(comment_id) references comments(comment_id)
);
