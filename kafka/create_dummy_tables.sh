#!/bin/bash

# MySQL credentials
MYSQL_USER="root"
MYSQL_PASSWORD="password"
MYSQL_HOST="127.0.0.1"
MYSQL_PORT="3306"

# SQL script
SQL_SCRIPT=$(cat <<EOF
CREATE DATABASE IF NOT EXISTS dummydb1;
USE dummydb1;

CREATE TABLE IF NOT EXISTS dummytable1 (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50),
    age INT
);

INSERT INTO dummytable1 (name, age) VALUES
('John Doe', 30),
('Jane Smith', 25),
('Michael Johnson', 40),
('Emily Brown', 35),
('David Lee', 28),
('Sarah Wilson', 33),
('Chris Evans', 45),
('Amanda White', 29),
('Robert Martinez', 38),
('Jennifer Taylor', 42);

SELECT * FROM dummytable1;
EOF
)

# Execute the SQL script using mysql command
mysql -u"$MYSQL_USER" -p"$MYSQL_PASSWORD" -h"$MYSQL_HOST" -P"$MYSQL_PORT" --execute "$SQL_SCRIPT"
