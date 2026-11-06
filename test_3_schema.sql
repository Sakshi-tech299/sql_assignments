DROP DATABASE IF EXISTS training_functions;
DROP DATABASE IF EXISTS training_functions;
CREATE DATABASE training_functions;
USE training_functions;
CREATE TABLE CourseEnrollments (
StudentID INT PRIMARY KEY,
FirstName VARCHAR(40),
LastName VARCHAR(40),
CourseName VARCHAR(40),
Fee DECIMAL(10,2),
EnrollmentDate DATE,
CompletionDate DATE
);
INSERT INTO CourseEnrollments
(StudentID, FirstName, LastName, CourseName, Fee, EnrollmentDate, CompletionDate)
VALUES
(101, "aman", "Sharma", "Python", 12500.75, "2026-01-05", "2026-03-20"),
(102, "priya", "Verma", "MySQL", 9800.40, "2026-01-12", "2026-02-28"),
(103, "rahul", "Singh", "Python", 15750.90, "2026-02-01", "2026-04-15"),
(104, "neha", "Gupta", "Power_BI", 11200.25, "2026-02-10", "2026-05-05"),
(105, "ishita", "Kapoor", "MySQL", 8900.60, "2026-03-03", "2026-04-22"),
(106, "arjun", "Mehta", "Python", 13650.15, "2026-03-15", "2026-06-10"),
(107, "simran", "Joshi", "Power_BI", 10400.95, "2026-04-01", "2026-06-30"),
(108, "vikas","Rao", "MySQL", 7600.50,"2026-04-18", "2026-05-29"),
(109, "kiran", "Malik", "Python", 14999.99, "2026-05-02", "2026-07-25"),
(110, "rohan", "Sethi", "Power_BI", 11950.35, "2026-05-20", "2026-08-14");
SELECT * FROM CourseEnrollments;


-- String functions
select *,upper(concat (FirstName, " ",LastName)) as full_name from CourseEnrollments;
select concat(upper(substring(FirstName,1,1)),substring( FirstName,2)," ",LastName) as new_name from CourseEnrollments;
select concat(upper(left(CourseName ,3)),"-",StudentID)  as student_code from CourseEnrollments;
select FirstName, reverse(FirstName)as reversed_name ,char_length(FirstName) as length from CourseEnrollments;
select FirstName, locate("a",FirstName) from CourseEnrollments;
select FirstName,upper(replace(FirstName,"a","o")) as replaced_name from CourseEnrollments;
select lpad(FirstName,12,0) as left_padded from CourseEnrollments;
select concat(right(CourseName,2), "-",left(FirstName,2)) as course_label from CourseEnrollments;
select concat(upper(left(FirstName,3)),lower(right(LastName,2))) from CourseEnrollments;

-- Numeric Functions
select fee, round(fee,1),round(fee) as round_salary from CourseEnrollments;
select fee, ceil(fee) as ceil_fee, floor(fee) as floor_fee from CourseEnrollments;
select fee, mod(fee,500) as divided_fee from CourseEnrollments;
select fee,abs(fee-10000) as abs_fee from CourseEnrollments;
select fee, round(fee*1.18,2) as mul_fee from CourseEnrollments;
select fee, format(fee,2) as format_fee from CourseEnrollments;

-- date functions
select EnrollmentDate, Year(EnrollmentDate), monthname(EnrollmentDate),dayname(EnrollmentDate) from CourseEnrollments;
select date_format(EnrollmentDate,"%D %M %Y"),date_format(CompletionDate,"%M-%D-%Y") from CourseEnrollments;
select timestampdiff(day,EnrollmentDate,CompletionDate) as Diff from CourseEnrollments;
select (date_add(date_add(EnrollmentDate,Interval 1 Month ),Interval 10 day)) from CourseEnrollments;
select date_add(CompletionDate,interval -7 day) from CourseEnrollments;
select timestampdiff(Month,EnrollmentDate,CompletionDate) as diff_month from CourseEnrollments;
select date_add(date_add(date_add(EnrollmentDate,Interval 1 year),Interval 2 month),Interval 5 day) from CourseEnrollments;
select dayname(EnrollmentDate) as day_1, dayname(CompletionDate) as day_2 from CourseEnrollments;
select timestampdiff(day,EnrollmentDate,curdate()) as diff from CourseEnrollments;
select CompletionDate,date_format(date_add(CompletionDate,Interval 15 day),"%d/%m/%y") as new_date from CourseEnrollments;