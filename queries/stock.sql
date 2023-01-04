/*+------------------------------------------+*/
/*|      QUERIES FOR CREATING THE STOCK      |*/
/*+------------------------------------------+*/

/*------ CREATE DATABASE FOR STOCK ------*/
DROP DATABASE IF EXISTS stock;
CREATE DATABASE IF NOT EXISTS stock;
USE stock;

/*------ CREATE TABLE FOR THE STRUCTURE OF THE STOCK ------*/
CREATE TABLE IF NOT EXISTS structure(
		id int not null auto_increment,
      section varchar(1) not null,
      shelf varchar(2) not null,
      location varchar(5) not null,
      PRIMARY KEY(id)
)engine = InnoDB default charset = utf8;

/*------ CREATE TABLE FOR THE PARTS OF THE STOCK ------*/
CREATE TABLE IF NOT EXISTS part (
	pCode int not null,
   location int not null,
   amount int(3) not null,
   minAmount int(3) not null,
   description tinytext,
   PRIMARY KEY (pCode),
   FOREIGN KEY (location) REFERENCES structure (id)
)engine = InnoDB default charset = utf8;

/*------ CREATE TABLE FOR THE PARTS RELATORY ------*/
CREATE TABLE IF NOT EXISTS relatory(
	id int not null auto_increment,
   pCode int not null,
   situation enum('NOTED', 'NOT NOTED') not null default 'NOT NOTED',
   delivery date,
   PRIMARY KEY(id),
   FOREIGN KEY(pCode) REFERENCES part(pCode)
)engine = InnoDB default charset = utf8;