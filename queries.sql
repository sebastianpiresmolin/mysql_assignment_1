
/* Uppgift 1

CREATE TABLE `successful_mission`
AS SELECT *
FROM `moon_mission`
WHERE outcome='Successful';
 */

/* Uppgift 2, Must run ADD PRIMARY KEY before AUTO_INCREMENT block

ALTER TABLE `successful_mission`
ADD PRIMARY KEY(`mission_id`);

ALTER TABLE `successful_mission`
MODIFY COLUMN mission_id INT NOT NULL AUTO_INCREMENT;
 */

/* Uppgift 3, Got warnings that I shouldn't use UPDATE without a WHERE statement, but in this instance I am actually
   looking to update EVERY table so I guess it's fine?

UPDATE `moon_mission`
SET `operator` = REPLACE(`operator`, ' ', '');

UPDATE `successful_mission`
SET `operator` = REPLACE(`operator`, ' ', '');
 */

/* Uppgift 4

DELETE FROM `successful_mission`
WHERE `launch_date` >= '2010-01-01';
 */

/* Uppgift 5

SELECT
    CONCAT(first_name, ' ', last_name) AS name,
    CASE
        WHEN CAST(SUBSTR(ssn, LENGTH(ssn) - 1, 1) AS UNSIGNED) % 2 = 0 THEN 'Female'
        ELSE 'Male'
        END AS gender
FROM account;
 */

/* Uppgift 6

SELECT
    CONCAT(first_name, ' ', last_name) AS name,
    ssn
FROM account
WHERE CAST(SUBSTR(ssn, LENGTH(ssn) - 1, 1) AS UNSIGNED) % 2 = 0
  AND CAST(SUBSTR(ssn, 1, 2) AS UNSIGNED) > 70;
 */

/* Uppgift 7
SELECT
    CASE
        WHEN CAST(SUBSTR(ssn, LENGTH(ssn) - 1, 1) AS UNSIGNED) % 2 = 0 THEN 'Female'
        ELSE 'Male'
        END AS gender,
    AVG(2024 - (1900 + CAST(SUBSTR(ssn, 1, 2) AS UNSIGNED))) as average_age
FROM account
GROUP BY gender;
 */


