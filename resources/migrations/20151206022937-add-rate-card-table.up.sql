create table rate_card
(rate_card_id integer primary key AUTO_INCREMENT,
 location_id integer not null,
 career_stage VARCHAR(20) not null,
 rate integer not null,
 currency VARCHAR(10)
 );
--;;
ALTER TABLE rate_card
ADD CONSTRAINT fk_rate_card_id
FOREIGN KEY (location_id)
REFERENCES person_location(person_location_id);