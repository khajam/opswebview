create table person_contracts
(person_contract_id integer PRIMARY KEY AUTO_INCREMENT,
 contract_id integer not null,
 person_id integer not null,
 location_id integer not null,
 career_stage varchar(20) not null,
 start_date date not null,
 end_date date not null
 );
--;;
ALTER TABLE person_contracts
ADD CONSTRAINT fk_person_contract_id
FOREIGN KEY (contract_id)
REFERENCES contracts(contract_id);
--;;
ALTER TABLE person_contracts
ADD CONSTRAINT fk_person_id
FOREIGN KEY (person_id)
REFERENCES person(person_id);
