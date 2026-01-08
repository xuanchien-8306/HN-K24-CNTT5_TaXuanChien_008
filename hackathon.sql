create database if not exists hackathon;
use hackathon;

-- Phòng ban
create table Department (
	department_id varchar(10) primary key,
    department_name varchar(100) not null unique,
    location varchar(255) not null
);

-- Nhan vien
create table Employee(
	employee_id varchar(10) primary key,
    full_name varchar(100) not null,
    email varchar(100) not null unique,
    phone_number varchar(15) not null unique,
    hire_date date not null,
    department_id varchar(10) not null,	
    
    foreign key (department_id) references Department(department_id)
);

-- Du an
create table Project (
	project_id int primary key auto_increment,
    project_name varchar(150), 
    budget decimal(15,2),
    status varchar(50) = ''
    
    -- foreign key (project_name) references Customer(project_name), 
    -- foreign key (budget) references Room(budget)
);

-- Phan cong du an
create table Assignment (
	assignment_id int primary key auto_increment,
    employee_id varchar(10),
    project_id int,
    role varchar(50),
    bonus_amount decimal(10,2),
    
    foreign key (employee_id) references Employee(employee_id)
    
);

insert into Department(department_id, department_name, location) value
('D001', 'Information Technology' , 'Floor 4, Building A'),
('D002', 'Human Resources', 'Floor 2, Building B'),
('D003','Finance & Accounting','Floor 3, Building A'),
('D004','Marketing & Sales','Floor 5, Building C'),
('D005','Research & Development','Floor 6, Building D');

insert into Employee(employee_id,full_name,email,phone_number,hire_date,department_id) value
('E001','Nguyen Minh Anh','anh.nm@company.com','0912345678','2022-01-15','D001'),
('E002','Tran Thi Thanh','thanh.tt@company.com','0923456789','2021-05-20','D002'),
('E003','Pham Hoang Nam','nam.ph@company.com','0934567890','2023-03-10','D001'),
('E004','Le Thu Thao','thao.lt@company.com','0945678901','2020-11-25','D003'),
('E005','Vu Duc Cuong','cuong.vd@company.com','0956789012','2024-02-01','D005');

insert into Project(project_id,project_name,budget,status) value
(1,'ERP System Upgrade','500000.00','Active'),
(2,'Mobile App Launch','250000.00','Pending'),
(3,'Annual Financial Audit','100000.00','Completed'),
(4,'Market Expansion Asia','800000.00','Active'),
(5,'AI Research Pilot','150000.00','Pending');

insert into Assignment(assignment_id,employee_id,project_id,role,bonus_amount) value
(1,'E001',1,'Manager','2000.00'),
(2,'E003',1,'Developer','1700.00'),
(3,'E002',4,'Developer','1500.00'),
(4,'E004',3,'Tester','1200.00'),
(5,'E005',5,'Tester','1000.00');

-- 3
update Department 
set location = 'Landmark Tower, HCM City' where department_id = 'D003';

-- 4
update  Project 
set status = 'Active', budget = budget+(500000*0.2) where project_id = 1;

-- update Project
-- set budget = 500000 where project_id = 1;

-- 5
delete from Assignment where bonus_amount < 1200;

-- 6
select project_id, project_name from Project where budget > 300000 and status = 'Active'; 

-- 7
-- select full_name, email, phone_number from Employee where full_name = 'Anh';
 
-- 8
select employee_id, full_name, hire_date from Employee order by hire_date desc;

-- 9
select * from Employee order by hire_date asc limit 3;

-- 10
select employee_id, full_name from Employee limit 2 offset 2;

-- 11
-- select employee_id, full_name, department_name from 
