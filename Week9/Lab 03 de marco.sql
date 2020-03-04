CREATE TABLE employees(
	role text,
	name text,
	years_employed bigint,
	building text);
	
INSERT INTO employees (role, name, years_employed, building)
	VALUES ('Engineer', 'Becky A.', 4, 'Burj Khalifa');
	
SELECT * FROM employees;

INSERT INTO employees (role, name, years_employed, building)
	VALUES ('Engineer', 'Dan B.', 2, 'Burj Khalifa');
	
INSERT INTO employees (role, name, years_employed, building)	
	VALUES ('Engineer', 'Sharon F.', 6, 'Burj Khalifa'),
	('Engineer', 'Dan M.', 4, 'Burj Khalifa'),
	('Engineer', 'Dan B.', 4, 'Burj Khalifa'),
	('Engineer', 'Malcom', 1, 'Burj Khalifa'),
	('Artist', 'Tylar S.', 2, 'Empire State'),
	('Artist', 'Sherman', 8, 'Empire State'),
	('Artist', 'Jakob J.', 6, 'Empire State'),
	('Artist', 'Lillia A.', 7, 'Empire State'),
	('Artist', 'Brandon', 7, 'Empire State'),
	('Manager', 'Scott K.', 9, 'Burj Khalifa'),
	('Manager', 'Shirlee M.', 3, 'Burj Khalifa'),
	('Manager', 'Daria O.', 6, 'Empire State'),
	('Engineer', 'Yancy I.', 0, ''),
	('Artist', 'Oliver P.', 0, '');
	
SELECT * FROM employees;

UPDATE employees set building = NULL
	WHERE building = '';
	
SELECT * FROM employees;

CREATE TABLE role_info (
	role_id bigint,
	role_name text);

CREATE TABLE building_info (
	building_id bigint,
	building_name text,
	building_height bigint);
	
INSERT INTO role_info (role_id, role_name)
	VALUES  (1,'Engineer'),
			(2,'Artist'),
			(3,'Manager');

INSERT INTO building_info (building_id, building_name, building_height)
	VALUES  (1,'Burj Khalifa', 1000),
			(2,'Empire State', 1500);

SELECT * FROM building_info;
SELECT * FROM role_info;
SELECT * FROM employees;

UPDATE employees SET role = 1
	WHERE role = 'Engineer';
UPDATE employees SET role = 2
	WHERE role = 'Artist';
UPDATE employees SET role = 3
	WHERE role = 'Manager';
	
UPDATE employees SET building = 1
	WHERE BUILDING = 'Burj Khalifa';
UPDATE employees SET building = 2
	WHERE BUILDING = 'Empire State';
	
SELECT * FROM building_info;

---- 3.1 UPDATE ORIGINAL TABLE & BRING RESULTS INFO

SELECT employees.role, 
	   employees.name,
	   employees.years_employed,
	   building_info.building_id,
	   building_info.building_height,
	   building_info.building_name,
	   role_info.role_name
	FROM employees
	LEFT JOIN building_info
	ON 
	CAST(employees.building AS bigint) = (building_info.building_id)
	LEFT JOIN role_info
	ON
	CAST (employees.role AS bigint) = (role_info.role_id);
	
---- through join bring role_name, building_name, height.


