/* ================================
   PHẦN 1: TẠO CSDL & BẢNG
================================ */

create database if not exists hackathon;
use hackathon;

/* ----- Department ----- */
create table Department (
    department_id varchar(10) primary key,
    department_name varchar(100) not null unique,
    location varchar(255) not null
);

/* ----- Employee ----- */
create table Employee (
    employee_id varchar(10) primary key,
    full_name varchar(100) not null,
    email varchar(100) not null unique,
    phone_number varchar(15) not null unique,
    hire_date date not null,
    department_id varchar(10),
    foreign key (department_id) references Department(department_id)
);

/* ----- Project ----- */
create table Project (
    project_id int primary key,
    project_name varchar(150) not null,
    budget decimal(15,2) not null,
    status varchar(50) not null
);

/* ----- Assignment ----- */
create table Assignment (
    assignment_id int primary key,
    employee_id varchar(10),
    project_id int,
    role varchar(50),
    bonus_amount decimal(10,2),
    foreign key (employee_id) references Employee(employee_id),
    foreign key (project_id) references Project(project_id)
);

/* ================================
   INSERT DỮ LIỆU
================================ */

/* Department */
insert into Department values
('D001','Information Technology','Floor 4, Building A'),
('D002','Human Resources','Floor 2, Building B'),
('D003','Finance & Accounting','Floor 3, Building A'),
('D004','Marketing & Sales','Floor 5, Building C'),
('D005','Research & Development','Floor 6, Building D');

/* Employee */
insert into Employee values
('E001','Nguyen Minh Anh','anh.nm@company.com','0912345678','2022-01-15','D001'),
('E002','Tran Thi Thanh','thanh.tt@company.com','0923456789','2021-05-20','D002'),
('E003','Pham Hoang Nam','nam.ph@company.com','0934567890','2023-03-10','D001'),
('E004','Le Thu Thao','thao.lt@company.com','0945678901','2020-11-25','D003'),
('E005','Vu Duc Cuong','cuong.vd@company.com','0956789012','2024-02-01','D005');

/* Project */
insert into Project values
(1,'ERP System Upgrade',500000,'Active'),
(2,'Mobile App Launch',250000,'Pending'),
(3,'Annual Financial Audit',100000,'Completed'),
(4,'Market Expansion Asia',800000,'Active'),
(5,'AI Research Pilot',150000,'Pending');

/* Assignment */
insert into Assignment values
(1,'E001',1,'Manager',2000),
(2,'E003',1,'Developer',1700),
(3,'E002',4,'Developer',1500),
(4,'E004',3,'Tester',1200),
(5,'E005',5,'Tester',1000);

/* 3.*/
update Department
set location = 'Landmark Tower, HCM City'
where department_id = 'D003';

/* 4. */
update Project
set budget = budget * 1.2,
    status = 'Active'
where project_id = 1;

/* 5. */
delete a
from Assignment a
join Project p on a.project_id = p.project_id
where a.bonus_amount < 1200
  and p.status = 'Completed';

/* ================================
   TRUY VẤN CƠ BẢN
================================ */

/* 6 */
select project_id, project_name
from Project
where budget > 300000 and status = 'Active';

/* 7 */
select full_name, email, phone_number
from Employee
where full_name like '%Anh%';

/* 8 */
select employee_id, full_name, hire_date
from Employee
order by hire_date desc;

/* 9 */
select employee_id, full_name, hire_date
from Employee
order by hire_date asc
limit 3;

/* 10 */
select employee_id, full_name
from Employee
limit 2 offset 2;

/* ================================
  TRUY VẤN NÂNG CAO
================================ */

/* 11 */
select e.employee_id, e.full_name, d.department_name
from Employee e
join Department d on e.department_id = d.department_id;

/* 13 */
select status, sum(budget) as total_budget
from Project
group by status;




