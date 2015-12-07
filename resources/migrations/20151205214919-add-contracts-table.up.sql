CREATE TABLE contracts
(contract_id integer PRIMARY KEY AUTO_INCREMENT,
 atrack_number varchar(10) not null, 
 reference_number integer not null,
 description varchar(100) not null,
 start_date date not null,
 end_date date not null,
 client_contact varchar(100) not null,
 contract_value integer not null,
 expenses_value integer not null,
 total_value integer not null,
 currency varchar(10) )