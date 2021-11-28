--1. Create tables for the above list given
--2. insert at least 5 rows of values in each table
------------------------USERS TABLE -------------------------------------------------------
---Create Users
CREATE TABLE users(userid INTEGER PRIMARY KEY, username VARCHAR(100),email VARCHAR(100)
,mentorid INTEGER
);
-- Insert Into Users
INSERT INTO users VALUES(1,"Narayan","narayan@gmail.com",5)
INSERT INTO users VALUES(2,"Sekar","sekar@gmail.com",4)
INSERT INTO users VALUES(3,"Raj","raj@gmail.com",4)
INSERT INTO users VALUES(4,"Harish","hari@gmail.com",2)
INSERT INTO users VALUES(5,"KrishnaKumar","krishna@gmail.com",5);

---QUERY
--(LIST ALL STUDENTS ASSIGNED FOR A SPECIFIC MENTOR)
Select mentors.mentorid,mentors.mentorname,count(users.mentorid) as Total_Students
from mentors
inner join users on mentors.mentorid=users.mentorid
group by users.mentorid
having users.mentorid=4;
--(LIST ALL STUDENTS ASSIGNED FOR A ALL MENTORS)
Select mentors.mentorid,mentors.mentorname,count(users.mentorid) as Total_Students
from mentors
inner join users on mentors.mentorid=users.mentorid
group by users.mentorid;

------------------------CODEKATA TABlE---------------------------------------------------------
--Create CODEKATA
CREATE TABLE codekata(userid INTEGER,number_problems INTEGER,
 string_problems INTEGER
 );
--Insert into CODEKATA
INSERT INTO codekata VALUES(1,20,10)
INSERT INTO codekata VALUES(2,10,20)
INSERT INTO codekata VALUES(3,30,60)
INSERT INTO codekata VALUES(4,7,30)
INSERT INTO codekata VALUES(5,50,10);

-- QUERY (get number problems solved in codekata by combining the users)
select users.userid,users.username,codekata.number_problems from users
inner join codekata on users.userid=codekata.userid;


------------------------ATTENDANCE TABlE---------------------------------------------
--CREATE
CREATE TABLE attendance( userid INTEGER,courseid INTEGER ,topicsid INTEGER, attended BOOLEAN
);
--INSERT
INSERT INTO attendance(userid,courseid,topicsid,attended) VALUES(1,1,1,true);
INSERT INTO attendance(userid,courseid,topicsid,attended) VALUES(1,1,2,false);
INSERT INTO attendance(userid,courseid,topicsid,attended) VALUES(2,2,3,false);
INSERT INTO attendance(userid,courseid,topicsid,attended) VALUES(3,3,4,true);
INSERT INTO attendance(userid,courseid,topicsid,attended) VALUES(4,4,5,true);
INSERT INTO attendance(userid,courseid,topicsid,attended) VALUES(5,5,7,true);



------------------------TOPICS TABlE---------------------------------------------------------
--CREATE
CREATE TABLE topics(topicsid INTEGER AUTO_INCREMENT PRIMARY KEY,courseid INTEGER, topic VARCHAR(200),
FOREIGN KEY (courseid) REFERENCES courses(courseid)
);

INSERT INTO topics(courseid,topic) VALUES(1,"loops and array")
INSERT INTO topics(courseid,topic) VALUES(1,"objects and classes")
INSERT INTO topics(courseid,topic) VALUES(2,"Html basics")
INSERT INTO topics(courseid,topic) VALUES(3,"CSS basics")
INSERT INTO topics(courseid,topic) VALUES(4,"React intro")
INSERT INTO topics(courseid,topic) VALUES(4,"React basics")
INSERT INTO topics(courseid,topic) VALUES(5,"NODE js intro")
INSERT INTO topics(courseid,topic) VALUES(5,"NOde js basics");


------------------------STUDENTS ACTIVATED COURSES TABlE------------------------------------
--CREATE
CREATE TABLE students_activated_courses(userid INTEGER,courseid INTEGER
);

--INSERT
INSERT INTO students_activated_courses VALUES(1,1)
INSERT INTO students_activated_courses VALUES(1,2)
INSERT INTO students_activated_courses VALUES(2,2)
INSERT INTO students_activated_courses VALUES(2,3)
INSERT INTO students_activated_courses VALUES(3,2)
INSERT INTO students_activated_courses VALUES(3,3)
INSERT INTO students_activated_courses VALUES(4,4)
INSERT INTO students_activated_courses VALUES(5,5);

--query 5. combine and display students_activated_courses and courses for a specific user groping them based on the course
SELECT students_activated_courses.userid,students_activated_courses.courseid,
COUNT(students_activated_courses.courseid) ,courses.coursename
FROM students_activated_courses
INNER JOIN courses ON students_activated_courses.courseid=courses.courseid
GROUP BY courses.courseid
Having students_activated_courses.userid=1;


------------------------COMPANY DRIVES TABlE-------------------------------------------------
--create
CREATE TABLE company_drives(userid INTEGER,company VARCHAR(100)
);

--insert
INSERT INTO company_drives VALUES(1,"Flipkart")
INSERT INTO company_drives VALUES(1,"Google")
INSERT INTO company_drives VALUES(1,"Amazon")
INSERT INTO company_drives VALUES(2,"Zoho")
INSERT INTO company_drives VALUES(3,"Google")
INSERT INTO company_drives VALUES(4,"Flipkart")
INSERT INTO company_drives VALUES(5,"Zoho")
INSERT INTO company_drives VALUES(5,"Amazon");

--query  display the no of company drives attended by a user
select users.userid,users.username,count(users.userid) as TOTAL_COMPANIES_ATTENDED from users
inner join company_drives on users.userid=company_drives.userid
group by users.userid having users.userid=1;

--display the no of company drives attended by all users
select users.userid,users.username,count(users.userid) as TOTAL_COMPANIES_ATTENDED from users
inner join company_drives on users.userid=company_drives.userid
group by users.userid;


------------------------TASKS TABlE------------------------------------------------------------
--CREATE
CREATE TABLE tasks(tasksid INTEGER,task VARCHAR(200)
);

--insert
INSERT INTO tasks VALUES (1,"javascript task")
INSERT INTO tasks VALUES (2,"Html task")
INSERT INTO tasks VALUES (3,"Css task")
INSERT INTO tasks VALUES (4,"ReactJs task")
INSERT INTO tasks VALUES (5,"NodeJs task");

------------------------COURSES TABlE-----------------------------------------------------------
--CREATE
CREATE TABLE courses(courseid INTEGER,coursename VARCHAR(100));
--insert
INSERT INTO courses VALUES(1,"Javascript")
INSERT INTO courses VALUES(2,"Html")
INSERT INTO courses VALUES(3,"Css")
INSERT INTO courses VALUES(4,"ReactJs")
INSERT INTO courses VALUES(5,"NodeJs");


---------------------------MENTOR TABLE------------------------------------------------------------
-- create mentors table

CREATE TABLE mentors(mentorid INTEGER PRIMARY KEY,mentorname VARCHAR(100),mentoremail VARCHAR(100));

-- insert into mentors table

INSERT INTO  mentors VALUES (1,"Siri","sirialexa@gmail.com")
INSERT INTO  mentors VALUES (2,"Alexa","alexa@gmail.com")
INSERT INTO mentors VALUES (3,"Ragav","ragav@gmail.com")
INSERT INTO  mentors VALUES (4,"Rob","roblio@gmail.com")
INSERT INTO mentors  VALUES (5,"Rene","rene@gmail.com");

-- query ( List all Mentors)
SELECT mentorid,mentorname FROM mentors;


