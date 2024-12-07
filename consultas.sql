----------------- Ejercicios consultas a la base de datos
---Ejercicio 1
SELECT vehicle_id, COUNT(*) as accident_count
FROM final_colision_vehiculos
GROUP BY vehicle_id
HAVING COUNT(*) > 1;
---Ejercicio 2
SELECT *
FROM final_vehiculos
WHERE vehicle_year ~ '^\d{4}$' -- Solo números de 4 dígitos
  AND CAST(vehicle_year AS INTEGER) <= EXTRACT(YEAR FROM CURRENT_DATE) - 35;
---Ejercicio 3
SELECT vehicle_make, COUNT(*) as count
FROM final_vehiculos
GROUP BY vehicle_make
ORDER BY count DESC
LIMIT 5;
---Ejercicio 4
SELECT
    p.person_id,
    p.person_sex,
    p.person_lastname,
    p.person_firstname,
    p.person_phone,
    p.person_address,
    p.person_city,
    p.person_state,
    p.person_zip,
    p.person_ssn,
    p.person_dob
FROM
    final_persona p
WHERE
    p.person_id IN (
        SELECT cp.person_id
        FROM final_colision_persona cp
        GROUP BY cp.person_id
        HAVING COUNT(cp.accident_id) > 1
    );
---Ejercicio 5
SELECT p.person_id, p.person_sex, p.person_lastname, p.person_firstname, p.person_phone, p.person_address, p.person_city, p.person_state, p.person_zip, p.person_ssn, p.person_dob
FROM final_persona p, final_colision_persona cp
WHERE p.person_id = cp.person_id
  AND (p.person_dob <= CURRENT_DATE - INTERVAL '65 years'
    OR p.person_dob >= CURRENT_DATE - INTERVAL '26 years')
ORDER BY p.person_dob ;
---Ejercicio 6
SELECT DISTINCT
    p.person_id,
    p.person_firstname,
    p.person_lastname,
    p.person_sex,
    p.person_phone,
    p.person_address,
    p.person_city,
    p.person_state,
    p.person_zip,
    v.vehicle_type
FROM
    final_persona p
        INNER JOIN
    final_colision_persona cp ON p.person_id = cp.person_id
        INNER JOIN
    final_vehiculos v ON cp.vehicle_id = v.vehicle_id
WHERE
    TRIM(LOWER(v.vehicle_type)) = 'pick-up';
---Ejercicio 7
SELECT vehicle_make, COUNT(*) as accident_count
FROM final_vehiculos v
WHERE EXISTS (
    SELECT 1
    FROM final_colision_vehiculos cv
    WHERE v.vehicle_id = cv.vehicle_id
)
GROUP BY vehicle_make
ORDER BY accident_count
LIMIT 3;
-- Tipos de vehículo con menos accidentes
SELECT vehicle_type, COUNT(*) as accident_count
FROM final_vehiculos v
WHERE EXISTS (
    SELECT 1
    FROM final_colision_vehiculos cv
    WHERE v.vehicle_id = cv.vehicle_id
)
GROUP BY vehicle_type
ORDER BY accident_count
LIMIT 3;
---Ejercicio 8
SELECT vehicle_make, COUNT(*) as accident_count
FROM final_vehiculos v
WHERE EXISTS (
    SELECT 1
    FROM final_colision_vehiculos cv
    WHERE v.vehicle_id = cv.vehicle_id
)
GROUP BY vehicle_make;
---Ejercicio 9
SELECT p.person_city, p.person_state, COUNT(*) as accident_count
FROM final_persona p, final_colision_persona cp
WHERE p.person_id = cp.person_id
GROUP BY p.person_city, p.person_state;
---Ejercicio 10
SELECT
    v.state_registration,
    COUNT(*) AS accident_count
FROM
    final_vehiculos v
        INNER JOIN
    final_colision_vehiculos cv ON v.vehicle_id = cv.vehicle_id
GROUP BY
    v.state_registration;