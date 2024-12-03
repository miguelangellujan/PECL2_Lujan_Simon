set datestyle to 'MDY';

create database PECL2;

create schema if not exists final;

create schema if not exists temp;

CREATE TABLE IF NOT EXISTS accidentes (
    CRASH_DATE TEXT,
    CRASH_TIME TEXT,
    borough TEXT,
    zip_code TEXT,
    latitude TEXT,
    longitude TEXT,
    location TEXT,
    on_street_name TEXT,
    cross_street_name TEXT,
    off_street_name TEXT,
    persons_injured TEXT,
    persons_killed TEXT,
    pedestrians_injured TEXT,
    pedestrians_killed TEXT,
    cyclists_injured TEXT,
    cyclists_killed TEXT,
    motorists_injured TEXT,
    motorists_killed TEXT,
    CONTRIBUTING_FACTOR_VEHICLE_1 TEXT,
    CONTRIBUTING_FACTOR_VEHICLE_2 TEXT,
    CONTRIBUTING_FACTOR_VEHICLE_3 TEXT,
    CONTRIBUTING_FACTOR_VEHICLE_4 TEXT,
    CONTRIBUTING_FACTOR_VEHICLE_5 TEXT,
    accidente_id TEXT,
    vehicle_type_code_1 TEXT,
    vehicle_type_code_2 TEXT,
    vehicle_type_code_3 TEXT,
    vehicle_type_code_4 TEXT,
    vehicle_type_code_5 TEXT
);

CREATE TABLE IF NOT EXISTS vehiculos (
    vehicle_id TEXT,
    vehicle_year TEXT,
    vehicle_type TEXT,
    vehicle_model TEXT,
    vehicle_make TEXT
);

CREATE TABLE IF NOT EXISTS persona(
    person_id TEXT,
    person_sex TEXT,
    person_lastname TEXT,
    person_firstname TEXT,
    person_phone TEXT,
    person_address TEXT,
    person_city TEXT,
    person_state TEXT,
    person_zip TEXT,
    person_ssn TEXT,
    person_dob TEXT
);

CREATE TABLE IF NOT EXISTS colision_persona(
    unique_id TEXT,
    collision_id TEXT,
    crash_date TEXT,
    crash_time TEXT,
    person_id TEXT,
    person_type TEXT,
    person_injury TEXT,
    vehicle_id TEXT,
    person_age TEXT,
    ejection TEXT,
    emotional_status TEXT,
    bodily_injury TEXT,
    position_in_vehicle TEXT,
    safety_equipment TEXT,
    ped_location TEXT,
    ped_action TEXT,
    COMPLAINT TEXT,
    ped_role TEXT,
    CONTRIBUTING_FACTOR TEXT,
    CONTRIBUTING_FACTOR_2 TEXT,
    person_sex TEXT
);

CREATE TABLE IF NOT EXISTS colision_vehiculos (
    unique_id TEXT,
    collision_id TEXT,
    crash_date TEXT,
    crash_time TEXT,
    vehicle_id TEXT,
    state_registration TEXT,
    vehicle_type TEXT,
    vehicle_make TEXT,
    vehicle_model TEXT,
    vehicle_year TEXT,
    travel_direction TEXT,
    vehicle_occupants TEXT,
    driver_sex TEXT,
    driver_license_status TEXT,
    driver_license_jurisdiction TEXT,
    pre_crash TEXT,
    point_of_impact TEXT,
    vehicle_damage TEXT,
    vehicle_damage_2 TEXT,
    vehicle_damage_3 TEXT,
    vehicle_damage_4 TEXT,
    public_property_damage TEXT,
    public_property_damage_type TEXT,
    CONTRIBUTING_FACTOR TEXT,
    CONTRIBUTING_FACTOR_2 TEXT
);

COPY accidentes FROM 'C:\Collisions_Crashes_20241020.csv'
    WITH CSV HEADER NULL '' DELIMITER ',';

COPY vehiculos FROM 'C:\Vehicles.csv'
    WITH CSV HEADER NULL '' DELIMITER ';';

COPY persona FROM 'C:\personas2.csv'
    WITH CSV HEADER NULL '' DELIMITER ';';

COPY colision_persona FROM 'C:\Collisions_Person_20241020.csv'
    WITH CSV HEADER NULL '' DELIMITER ',';

COPY colision_vehiculos FROM 'C:\Collisions_Vehicles_20241020.csv'
    WITH CSV HEADER NULL '' DELIMITER ',';