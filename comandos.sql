----------------- Ejercicios consultas a la base de datos
---Ejercicio 1
SELECT vehicle_id, COUNT(*) as accident_count
FROM pecl2.final.collision_vehicles_def
GROUP BY vehicle_id
HAVING COUNT(*) > 1;
---Ejercicio 2
SELECT *
FROM pecl2.final.vehicles_def
WHERE vehicle_year <= EXTRACT(YEAR FROM CURRENT_DATE) - 35;
---Ejercicio 3
SELECT vehicle_make, COUNT(*) as count
FROM pecl2.final.vehicles_def
GROUP BY vehicle_make
ORDER BY count DESC
    LIMIT 5;
---Ejercicio 4
SELECT p.*
FROM personas2_def p
         JOIN collision_person_def cp ON p.person_id = cp.person_id
GROUP BY p.person_id
HAVING COUNT(cp.accident_id) > 1;
---Ejercicio 5
SELECT p.*
FROM personas2_def p
         JOIN collision_person_def cp ON p.person_id = cp.person_id
WHERE p.person_dob <= CURRENT_DATE - INTERVAL '65 years'
   OR p.person_dob >= CURRENT_DATE - INTERVAL '26 years'
ORDER BY p.person_dob ASC;
