create table if not exists final_accidentes(accident_id SERIAL,
    CRASH_DATE date not null,
    CRASH_TIME  time not null ,
    borough Varchar(30),
    zip_code CHAR(5),
    latitude NUMERIC(9,6),
    longitude NUMERIC(9,6),
    on_street_name	VARCHAR(100),
    cross_street_name	VARCHAR(100),
    off_street_name	VARCHAR(100),
    persons_injured	smallint,
    persons_killed	smallint,
    pedestrians_injured	smallint,
    pedestrians_killed	smallint,
    cyclists_injured	smallint,
    cyclists_killed	smallint,
    motorists_injured	smallint,
    motorists_killed	smallint,
    CONTRIBUTING_FACTOR_VEHICLE_1 VARCHAR(255),
    CONTRIBUTING_FACTOR_VEHICLE_2 VARCHAR(255),
    CONTRIBUTING_FACTOR_VEHICLE_3 VARCHAR(255),
    CONTRIBUTING_FACTOR_VEHICLE_4 VARCHAR(255),
    CONTRIBUTING_FACTOR_VEHICLE_5 VARCHAR(255)
    );

create table if not exists final_vehiculos(vehicle_id	SERIAL,
    state_registration CHAR(2),
    vehicle_type	VARCHAR(20),
    vehicle_make	VARCHAR(20),
    vehicle_model	VARCHAR(30),
    vehicle_year	smallint
    );

Create table if not exists final_persona(person_id SERIAL,
    person_sex	CHAR(1),
    person_lastname	VARCHAR(20),
    person_firstname VARCHAR(20),
    person_phone	VARCHAR(15),
    person_address	VARCHAR(100),
    person_city	VARCHAR(30)	,
    person_state CHAR(2),
    person_zip	CHAR(5)	,
    person_ssn	CHAR(11),
    person_dob	DATE
    );

CREATE TABLE IF NOT EXISTS final_colision_persona (collision_person_id SERIAL,
    accident_id varchar(10),
    person_id varchar(512),
    vehicle_id varchar(512),
    person_type VARCHAR(20),
    person_sex CHAR(1),
    person_injury VARCHAR(50),
    person_age SMALLINT,
    ejection BOOLEAN,
    emotional_status VARCHAR(50),
    bodily_injury VARCHAR(50),
    position_in_vehicle VARCHAR(50),
    safety_equipment VARCHAR(50),
    ped_location VARCHAR(50),
    ped_action VARCHAR(50),
    COMPLAINT VARCHAR(255),
    ped_role VARCHAR(50),
    CONTRIBUTING_FACTOR_1 VARCHAR(255),
    CONTRIBUTING_FACTOR_2 VARCHAR(255)
    );

CREATE TABLE IF NOT EXISTS final_colision_vehiculos (collision_vehicle_id SERIAL,
    accident_id varchar(10),
    vehicle_id varchar(512),
    travel_direction VARCHAR(50),
    vehicle_occupants SMALLINT,
    driver_sex CHAR(1),
    driver_license_status VARCHAR(20),
    driver_license_jurisdiction VARCHAR(50),
    pre_crash VARCHAR(50),
    point_of_impact VARCHAR(50),
    public_property_damage VARCHAR(100),
    public_property_damage_type VARCHAR(100),
    CONTRIBUTING_FACTOR_1 VARCHAR(255),
    CONTRIBUTING_FACTOR_2 VARCHAR(255)
    );

INSERT INTO final_accidentes (
    crash_date,
    crash_time,
    borough,
    zip_code,
    latitude,
    longitude,
    on_street_name,
    cross_street_name,
    off_street_name,
    persons_injured,
    persons_killed,
    pedestrians_injured,
    pedestrians_killed,
    cyclists_injured,
    cyclists_killed,
    motorists_injured,
    motorists_killed,
    contributing_factor_vehicle_1,
    contributing_factor_vehicle_2,
    contributing_factor_vehicle_3,
    contributing_factor_vehicle_4,
    contributing_factor_vehicle_5
)
SELECT
    TO_DATE(temp.accidentes.crash_date, 'MM/DD/YY'),
    CAST(crash_time AS TIME),
    CAST(borough AS VARCHAR(30)),
    CAST(zip_code AS CHAR(5)),
    CAST(latitude AS NUMERIC(9,6)),
    CAST(longitude AS NUMERIC(9,6)),
    CAST(on_street_name AS VARCHAR(100)),
    CAST(cross_street_name AS VARCHAR(100)),
    CAST(off_street_name AS VARCHAR(100)),
    CAST(persons_injured AS SMALLINT),
    CAST(persons_killed AS SMALLINT),
    CAST(pedestrians_injured AS SMALLINT),
    CAST(pedestrians_killed AS SMALLINT),
    CAST(cyclists_injured AS SMALLINT),
    CAST(cyclists_killed AS SMALLINT),
    CAST(motorists_injured AS SMALLINT),
    CAST(motorists_killed AS SMALLINT),
    CAST(contributing_factor_vehicle_1 AS VARCHAR(255)),
    CAST(contributing_factor_vehicle_2 AS VARCHAR(255)),
    CAST(contributing_factor_vehicle_3 AS VARCHAR(255)),
    CAST(contributing_factor_vehicle_4 AS VARCHAR(255)),
    CAST(contributing_factor_vehicle_5 AS VARCHAR(255))
FROM temp.accidentes;

INSERT INTO final_vehiculos (vehicle_id,
                             state_registration,
                             vehicle_type,
                             vehicle_make,
                             vehicle_model,
                             vehicle_year
)
SELECT
    CAST(vehicle_id AS VARCHAR(512)),
    CAST(NULL AS CHAR(2)), -- Como no hay state_registration, se deja como NULL explícito
    CAST(vehicle_type AS VARCHAR(20)),
    CAST(vehicle_make AS VARCHAR(20)),
    CAST(vehicle_model AS VARCHAR(30)),
    CAST(vehicle_year AS SMALLINT)
FROM temp.vehiculos;

INSERT INTO final_persona (
    person_sex,
    person_lastname,
    person_firstname,
    person_phone,
    person_address,
    person_city,
    person_state,
    person_zip,
    person_ssn,
    person_dob
)
SELECT
    CAST(person_sex AS CHAR(1)),
    CAST(person_lastname AS VARCHAR(20)),
    CAST(person_firstname AS VARCHAR(20)),
    CAST(person_phone AS VARCHAR(15)),
    CAST(person_address AS VARCHAR(100)),
    CAST(person_city AS VARCHAR(30)),
    CAST(person_state AS CHAR(2)),
    CAST(person_zip AS CHAR(5)),
    CAST(person_ssn AS CHAR(11)),
    CAST(person_dob AS DATE)
FROM temp.persona;

INSERT INTO final_colision_persona(
    accident_id,
    person_id,
    vehicle_id,
    person_type,
    person_sex,
    person_injury,
    person_age,
    ejection,
    emotional_status,
    bodily_injury,
    position_in_vehicle,
    safety_equipment,
    ped_location,
    ped_action,
    COMPLAINT,
    ped_role,
    CONTRIBUTING_FACTOR_1,
    CONTRIBUTING_FACTOR_2
)
SELECT
    CAST(accident_id AS varchar(10)),
    CAST(person_id AS varchar(512)),
    CAST(vehicle_id AS varchar(512)),
    CAST(person_type AS VARCHAR(20)),
    CAST(person_sex AS CHAR(1)),
    CAST(person_injury AS VARCHAR(50)),
    CAST(person_age AS SMALLINT),
    CAST(ejection AS BOOLEAN),
    CAST(emotional_status AS VARCHAR(50)),
    CAST(bodily_injury AS VARCHAR(50)),
    CAST(position_in_vehicle AS VARCHAR(50)),
    CAST(safety_equipment AS VARCHAR(50)),
    CAST(ped_location AS VARCHAR(50)),
    CAST(ped_action AS VARCHAR(50)),
    CAST(COMPLAINT AS VARCHAR(255)),
    CAST(ped_role AS VARCHAR(50)),
    CAST(CONTRIBUTING_FACTOR AS VARCHAR(255)),
    CAST(CONTRIBUTING_FACTOR_2 AS VARCHAR(255))
FROM temp.colision_persona;

INSERT INTO final_colision_vehiculos (
    accident_id,
    vehicle_id,
    travel_direction,
    vehicle_occupants,
    driver_sex,
    driver_license_status,
    driver_license_jurisdiction,
    pre_crash,
    point_of_impact,
    public_property_damage,
    public_property_damage_type,
    CONTRIBUTING_FACTOR_1,
    CONTRIBUTING_FACTOR_2
)
SELECT
    CAST(accident_id AS varchar(10)),
    CAST(vehicle_id AS varchar(512)),
    CAST(travel_direction AS VARCHAR(50)),
    CAST(vehicle_occupants AS SMALLINT),
    CAST(driver_sex AS CHAR(1)),
    CAST(driver_license_status AS VARCHAR(20)),
    CAST(driver_license_jurisdiction AS VARCHAR(50)),
    CAST(pre_crash AS VARCHAR(50)),
    CAST(point_of_impact AS VARCHAR(50)),
    CAST(public_property_damage AS VARCHAR(100)),
    CAST(public_property_damage_type AS VARCHAR(100)),
    CAST(CONTRIBUTING_FACTOR AS VARCHAR(255)),
    CAST(CONTRIBUTING_FACTOR_2 AS VARCHAR(255))
FROM temp.colision_vehiculos;