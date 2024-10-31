
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

/*
CREATE DATABASE IF NOT EXISTS bookstore;
USE bookstore;

CREATE TABLE IF NOT EXISTS author (
                                      id INT AUTO_INCREMENT,
                                      first_name VARCHAR(255),
                                      last_name VARCHAR(255),
                                      birth_date DATE,
                                      PRIMARY KEY (id)
);
*/

/* Del 1
CREATE TABLE IF NOT EXISTS language (
                                        language_id INT AUTO_INCREMENT,
                                        language_name VARCHAR(50) UNIQUE,
                                        PRIMARY KEY (language_id)
);
   /*

 */
/* Del 2
CREATE TABLE IF NOT EXISTS book (
                                    isbn CHAR(13) PRIMARY KEY NOT NULL,
                                    title VARCHAR(255) NOT NULL ,
                                    language_id INT NOT NULL ,
                                    author_id INT NOT NULL ,
                                    price DECIMAL(5,2),
                                    publication_date DATE,
                                    FOREIGN KEY (author_id) REFERENCES author(id),
                                    FOREIGN KEY (language_id) REFERENCES language(language_id)
);
*/

/* Del 3
CREATE TABLE IF NOT EXISTS bookstore (
                                         id INT AUTO_INCREMENT NOT NULL,
                                         store_name VARCHAR(255) NOT NULL,
                                         city VARCHAR(255) NOT NULL,
                                         PRIMARY KEY (id) NOT NULL
);
*/

/* Del 4
CREATE TABLE IF NOT EXISTS inventory (
                                         store_id INT NOT NULL,
                                         isbn CHAR(13) NOT NULL,
                                         amount INT NOT NULL,
                                         PRIMARY KEY (store_id, isbn),
                                         FOREIGN KEY (store_id) REFERENCES bookstore(id),
                                         FOREIGN KEY (isbn) REFERENCES book(isbn)
);
*/

/* Insertar 4 authors. (började med två men insåg att det krävdes 4 för nästa del)
INSERT INTO author (first_name, last_name, birth_date)
VALUES ('John', 'Doe', '1970-01-01'), ('Jane', 'Doe', '1980-01-01');

INSERT INTO language (language_name)
VALUES ('English'), ('Swedish');

INSERT INTO book (isbn, title, language_id, author_id, price, publication_date)
VALUES ('9781234567897', 'Phone Book', 1, 1, 19.99, '2000-01-01'), ('9781234567898', 'Cook Book', 2, 2, 29.99, '2010-01-01');

INSERT INTO bookstore (store_name, city)
VALUES ('Bookstore One', 'City One'), ('Bookstore Two', 'City Two');

INSERT INTO inventory (store_id, isbn, amount)
VALUES (1, '9781234567897', 10), (2, '9781234567898', 20);

INSERT INTO author (first_name, last_name, birth_date)
VALUES
    ('Michael', 'Smith', '1980-01-01'),
    ('Sarah', 'Johnson', '1990-01-01');

INSERT INTO book (isbn, title, language_id, author_id, price, publication_date)
VALUES
    ('9781234567899', 'History Book', 1, 3, 15.99, '2005-01-01'),
    ('9781234567890', 'Science Book', 2, 4, 25.99, '2015-01-01');

INSERT INTO inventory (store_id, isbn, amount)
VALUES
    (1, '9781234567899', 5),
    (2, '9781234567890', 10);
 */


/* Del 5
CREATE VIEW total_author_book_value AS
SELECT CONCAT(a.first_name, ' ', a.last_name) AS name,
       TIMESTAMPDIFF(YEAR, a.birth_date, CURDATE()) AS age,
       COUNT(DISTINCT b.title) AS book_title_count,
       SUM(b.price * i.amount) as inventory_value
FROM author a
         JOIN book b ON a.id = b.author_id
         JOIN inventory i ON b.isbn = i.isbn
GROUP BY a.id;
 */

/* Del 6
CREATE USER 'developer'@'localhost' IDENTIFIED BY 'password1';
GRANT SELECT, INSERT, UPDATE, DELETE, ALTER, CREATE, DROP ON bookstore.* TO 'developer'@'localhost';

CREATE USER 'webserver'@'localhost' IDENTIFIED BY 'password2';
GRANT SELECT, INSERT, UPDATE, DELETE ON bookstore.* TO 'webserver'@'localhost';

FLUSH PRIVILEGES;
 */

/* För att kontrollera att mina ändringar fungerade
SHOW GRANTS FOR 'developer'@'localhost';

SHOW GRANTS FOR 'webserver'@'localhost';
*/
