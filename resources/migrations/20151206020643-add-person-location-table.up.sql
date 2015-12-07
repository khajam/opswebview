create table person_location
(person_location_id integer primary key AUTO_INCREMENT,
 city_name varchar(100) not null,
 country_name varchar(100) not null
);
--;;
ALTER TABLE person
ADD CONSTRAINT fk_person_location_id
FOREIGN KEY (location_id)
REFERENCES person_location(person_location_id);