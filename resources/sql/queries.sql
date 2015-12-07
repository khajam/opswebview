-- name: add-person-location!
-- creates a new location for the project
INSERT INTO person_location
(person_location_id, city_name, country_name)
VALUES (:person_location_id, :city_name, :country_name);

-- neme: add-person!
-- creates a new person
INSERT INTO person
(person_id, name, domain, career_stage, location_id, ssemail, sapemail, psid)
values (:person_id, :name, :domain, :career_stage, :location_id, :ssemail, :sapemail, :psid);

-- name: add-contract!
-- creates a new contract
INSERT INTO contracts
(contract_id, atrack_number, reference_number, description, start_date, end_date, client_contact, contract_value, expenses_value  , total_value, currency)
VALUES (:contract_id, :atrack_number, :reference_number, :description, :start_date, :end_date, :client_contact, :contract_value, expenses_value  ,
 :total_value, :currency);

-- name: add-person-contract!
-- this creates an entry into the person and contracts table
INSERT INTO person_contracts
(person_contract_id, contract_id, person_id, location_id, career_stage, start_date , end_date)
VALUES (:person_contract_id, :person_id, :contract_id, :location_id, :career_stage, :start_date , :end_date);

-- name: add-rate-card!
-- this creates a rate card entry
INSERT INTO rate_card
(rate_card_id, location_id , career_stage , rate , currency)
VALUES (:rate_card_id, :location_id, :career_stage, :rate, :currency);

-- name: get-all-locations
-- this gets all the locations
select * from person_location;

-- name: get-all-rate-cards
-- this gets all the rate card info
select * from rate_card;

-- name: get-people-on-a-contract
-- this gets all people in a contract
select * from person p, person_contracts pc 
where p.person_id = pc.person_id
and pc.person_contract_id = :person_contract_id

