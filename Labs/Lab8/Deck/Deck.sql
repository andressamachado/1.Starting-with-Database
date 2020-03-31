--- Script: deck.sql
--- Author: S Terai
--- 7 Oct 2014
--- modified 13 Oct 2014, changed '1' to 'A'
--- modified 16 Nov, adjusted length of fields to varchar(7) & varchar(2)
--- Andressa Machado 040923007 Lab8
--- modified 14 March, new queries. 


---create database deck;

DROP DATABASE "Deck";

CREATE DATABASE "Deck"
  WITH OWNER = postgres
       ENCODING = 'UTF8'
       TABLESPACE = pg_default
       LC_COLLATE = 'English_United States.1252'
       LC_CTYPE = 'English_United States.1252'
       CONNECTION LIMIT = -1;

--the table has just one column:
drop table if exists suit;
create table suit (suit varchar(7));

---show columns from suit;
SELECT * FROM suit; 

drop table if exists rank;
create table rank(
	rank varchar(2)
	);
---show columns from rank;
SELECT * FROM rank;

---truncate table suit;
insert into suit (suit) values ('Diamond');
insert into suit (suit) values ('Spade');
insert into suit (suit) values ('Club');
insert into suit (suit) values ('Heart'); 

---truncate table rank;
insert into rank (rank) 
values ('A'), ('2'), ('3'), ('4'), ('5'), ('6'), ('7'), ('8'), ('9'), ('10'), ('J'), ('Q'), ('K');

--- CROSS JOIN Rank X Suit. CROSS JOIN is not commutative, R X S is not equal to S X R
select * from rank, suit;
select * from suit, rank;

--- CROSS JOIN 
SELECT * 
FROM suit
CROSS JOIN rank;

SELECT * 
FROM rank
CROSS JOIN suit; 

--- eof: deck.sql