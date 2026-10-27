create database banking_system;

use banking_system;

#create the "braches" table
create table branches(
branch_id int primary key,
branch_name varchar(100),
location varchar(255));

#create "customers" table
create table customers(
customer_id int primary key,
name varchar(100),
address varchar(255),
phone varchar(15),
email varchar(100),
dob date);

#create "accounts" table
create table accounts(
account_id int primary key,
customer_id int,
branch_id int,
account_type varchar(20),
balance decimal(12,2),
created_at datetime,
foreign key (customer_id)
references customers(customer_id),
foreign key(branch_id)
references branches(branch_id)
);

#create "employees" table
create table employees(
employee_id int primary key,
branch_id int,
name varchar(100),
designation varchar(50),
salary decimal(10,2),
foreign key(branch_id)
references branches(branch_id)
);

#create "transactions" table
create table transactions(
transaction_id int primary key,
account_id int,
amount decimal(12,2),
type enum("credit","debit"),
date datetime,
foreign key (account_id)
references accounts(account_id)
);

#create "loans" table
create table loans(
loan_id int primary key,
customer_id int,
amount decimal(12,2),
loan_type varchar(50),
interest_rate decimal(5,2),
start_date date,
end_date date,
foreign key (customer_id)
references customers(customer_id)
);

#inserting data in branches table
insert into branches(branch_id,branch_name,location) values
(1,"hydrabad branch","hydrabad"),
(2,"guntur branch","guntur"),
(3,"vijayawada branch","vijayawada"),
(4,"visakhapatnam branch","visakhapatnam");

#inserting data in customers table
insert into customers (customer_id,name,address,phone,email,dob) values
(1,"rahul","hyderabad",6985315894,"rahul@gmail.com","1999-05-14"),
(2,"shiva","nellor",8974562844,"shiva@gmail.com","1995-06-17"),
(3,"rajesh","ongol",5894469832,"rajesh@gmail.com","2001-05-25"),
(4,"hari","rajam",6985693214,"rajesh@gmail.com","1997-11-19"),
(5,"kiran","hyderabad",8526549173,"kiran@gmail.com","2002-12-30"),
(6,"ramesh","eluru",1425358796,"ramesh@gmail.com","2000-07-18");

#inserting data in accounts
insert into accounts(account_id, customer_id, branch_id, account_type, balance, created_at) values
(101,1,1,"savings",65000,"2024-04-14"),
(102,2,1,"current",59000,"2025-11-25"),
(103,3,4,"savings",900000,"2026-04-13"),
(104,4,3,"current",50000,"2024-08-11"),
(105,5,2,"savings",400000,"2025-09-15"),
(106,6,2,"current",400000,"2025-08-15"),
(107,3,2,"savings",18000,"2023-01-16"),
(108,5,3,"savings",1400000,"2026-08-19");

#inserting data in employees
insert into employees(employee_id,branch_id,name,designation,salary) values
(301,1,"vamsi","branch manager",65000),
(302,1,"nithin","casher",45000),
(303,2,"raghu","loan officer",50000),
(304,2,"manoj","accountant",40000),
(305,3,"ravi","loan officer",50000),
(306,3,"srinivas","casher",45000),
(307,4,"nandu","branch manager",65000),
(308,4,"praveen","accountant",40000);

#insert data into transaction
insert into transactions(transaction_id, account_id,amount,type,date) values
(201,101,52000,"credit","2026-04-30"),
(202,108,25000,"debit","2025-12-19"),
(203,105,17000,"debit","2026-10-14"),
(204,106,45000,"credit","2024-09-07"),
(205,103,17000,"credit","2025-09-22"),
(206,102,80000,"debit","2026-07-14"),
(207,104,15000,"debit","2025-06-03"),
(208,107,75000,"credit","2026-04-18");


#insert data in loans
insert into loans (loan_id, customer_id, amount, loan_type, interest_rate, start_date, end_date) values
(401, 1, 300000.00, 'Home Loan', 8.50, '2024-01-01', '2034-01-01'),
(402, 2, 150000.00, 'Personal Loan', 12.50, '2024-02-01', '2029-02-01'),
(403, 3, 500000.00, 'Home Loan', 8.25, '2024-03-01', '2039-03-01'),
(404, 4, 100000.00, 'Car Loan', 9.50, '2024-04-01', '2029-04-01'),
(405, 5, 200000.00, 'Education Loan', 7.50, '2024-05-01', '2030-05-01'),
(406, 6, 250000.00, 'Business Loan', 11.00, '2024-06-01', '2031-06-01'),
(407, 2, 120000.00, 'Personal Loan', 13.00, '2024-07-01', '2029-07-01'),
(408, 5, 350000.00, 'Home Loan', 8.75, '2024-08-01', '2039-08-01');

#displaing each tables
select * from branches;
select *from customers;
select * from accounts;
select * from employees;
select * from transactions;
select * from loans;

#questions and answers
#1. Display all records from the Customers table.
select * 
from customers;

#2.Display the name, phone number, and email of all customers. 
select name as customer_name , phone as phone_number,email
 from customers;

#3.Display all customers who are from Hyderabad. 
select name, customer_id
from customers
where address ="hyderabad";

#4.Display all accounts whose account_type is Savings. 
select account_id, customer_id, account_type
from accounts
where account_type="savings";

#5.Display all accounts having a balance greater than ₹50,000. 
select account_id, customer_id, balance
from accounts
where balance>=50000;

#6.Display all transactions where the transaction type is credit.
select *
from transactions
where type ="credit";

#7.Display all employees whose salary is greater than ₹40,000. 
select *
from employees
where salary>40000;

#8.Display all customers born after 1998-01-01. 
select *
from customers
where dob>"1998-01-01";

#9.Display all accounts in descending order of their balance. 
select *
from accounts
order by balance desc;

#10.Find the total number of customers in the bank.
select count(*) as total_number_of_customers
from customers;

#11.Find the total balance of all accounts
select sum(balance) as total_balance
from accounts;

#12.Find the average account balance. 
select avg(balance) as average_balance
from accounts;

#13.Find the highest and lowest account balance. 
select max(balance) as highest_balance, min(balance) as lowest_balance
from accounts;

#14.Display the number of accounts for each account_type. 
select account_type, count(*) as total_accounts
from accounts
group by account_type;

#15.Display each account type and its total balance, but show only account types whose total balance is greater than ₹80,000. 
select account_type, sum(balance) as total_balance
from accounts
group by account_type
having sum(balance)>80000;

#16.Display the customer name, account ID, account type, and balance using Customers and Accounts. 
select c.name, a.account_id, a.account_type,a.balance
from customers c left join accounts a
on c.customer_id=a.customer_id;

#17.Display the customer name, transaction ID, transaction amount, and transaction type using Customers, Accounts, and Transactions. 
select c.name as customer_name, t.transaction_id, t.amount as transaction_amount, t.type as transaction_type
from customers c inner join accounts a 
on c.customer_id=a.customer_id
inner join transactions t
on a.account_id=t.account_id;

#18.Display the customer name, loan type, loan amount, and interest rate using Customers and Loans. 
select c.name as customer_name, l.loan_type, l.amount as loan_amount, interest_rate
from customers c left join loans l
on c.customer_id=l.customer_id;  

#19.Display the employee name, designation, branch name, and branch location using Employees and Branches. 
select e.name as employee_name,e.designation, b.branch_name, b.location as branch_location
from employees e left join branches b
on e.branch_id=b.branch_id;

#20.Display the names of customers whose account balance is greater than the average balance of all accounts.
select c.name as customer_name
from Customers c
join Accounts a
    on c.customer_id = a.customer_id
where a.balance > (
    select avg(balance)
    from accounts);