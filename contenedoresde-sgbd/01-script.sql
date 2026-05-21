CREATE DATABASE pruebabd;

CREATE TABLE tbl1 ( id INT,
nombre varchar(30));

INSERT INTO tbl1
VALUES (1, 'PEPITO'),
       (2, 'LUIS'),
       (3, 'LUAR');
SELECT *
FROM tbl1;