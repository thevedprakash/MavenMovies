create schema country;
-- create database country_test;

use country;
-- select the dataqbase or schema we want to work with.

drop database country_test;
-- drop database commands drops or deletes your database.





use country;

-- create a country_detail table.

-- country_detail table
--     id  integer primary key, 
--     name varchar(20) not null,
--     capital varchar(20) ,
--     currency varchar(3),
--     size(km2) decimal(10,5),
--     is_democracy boolean

create table country_detail (
 id  integer primary key,
 name varchar(30) not null,
 capital varchar(30),
 currency varchar(20),
 size_km_square decimal(10,5),
 is_democracy boolean
);

drop schema country;
-- this removes the database and all tables 

truncate table country_detail;
-- this removes the data but database and table will still exists.

desc country_detail;
-- shows the structure of country_details.

alter table country_detail modify currency varchar(30);
-- change the structure of your schema or tables.

alter table country_detail add continent varchar(20);

alter table country_detail drop capital;


insert into country_detail (id, name, currency , size_km_square , is_democracy ,continent)
					values(1,"USA", "US-Dollar", 12793.789 , 1,"North America");

-- id , name , currency, size_km_square, is_democracy, continent
insert into  country_detail( id , name , currency, size_km_square, is_democracy, continent )
						value( 2, 'INDIA', 'Indian Rupee' , 80000.234, 1, 'Asia');
                        
-- Error Code: 1062. Duplicate entry '1' for key 'country_detail.PRIMARY'

insert into  country_detail( id , name , currency, size_km_square, is_democracy, continent )
						value( 3, 'Nepal', 'Nepali Rupee' , 8000.234, 1, 'Asia');

insert into  country_detail( id , name , currency, size_km_square, is_democracy, continent )
					  value (4, 'Argentina', 'Peso' , 78965.234, 1, 'South America'),
							(5, 'Canada', 'Canadian Dollar' , 23888.234, 1, 'North America');
                            
insert into  country_detail( id , name , currency, size_km_square, is_democracy, continent )
					  value (6, 'Singapore', 'Singapore Dollar' , 789.234, 1, 'Africa');
insert into  country_detail( id , name , currency, size_km_square, is_democracy, continent )
					  value (7, 'Spain', 'Euro' , 7895.234, 1, 'Euproe'),
							(8, 'France', 'Rupee' , 23888.234, 1, 'Asia');
                            
update  country_detail  
	set continent="Asia" where id =6;
    
update country_detail
	set currency="Euro" where id=8 and name="France";
    
-- Error Code: 1175. You are using safe update mode and you tried to update a table without a WHERE that uses a KEY column. 
-- To disable safe mode, toggle the option in Preferences -> SQL Editor and reconnect.

-- Egypt , Egyptian Pound, 56337.45, 1, Africa
insert into  country_detail( id , name , currency, size_km_square, is_democracy, continent )
					  value (9, 'Egypt', 'Egyptian Pound', 56337.45 , 1, "Africa");

-- France continent should be europe.
update country_detail
	set continent="Europe" where id=8;
    
delete from country_detail where id=7;
----------------------------------------------------------------------------------------
-- Analytical part of SQL.

select * from country_detail;
-- print or display all the data that is with the table specified.

-- select  - choose or select something
-- * -- select all or choose all that is available 
-- from -- choose from here ?
-- country_detail - table name 

/* 
Q. Find all the country that exists in table and their corresponding continent.
print or display all country name and the their continent.
*/

-- select column1, column2 from table_name;

select
	name,
    continent
from country_detail;


select
	  name,
      continent,
	from country_detail;

/* Error Code: 1064. You have an error in your SQL syntax; check the manual that corresponds 
to your MySQL server version for the right syntax to use near 'from country_detail' at line 4
*/

/*
Q. Get all the country name and their currency along with the continent.
-- print or display all countty name, currency and continent.

-- pandas df[[column1, column2, column3,.....columnN]]
-- sql
 select 
		column1, 
        column2,
        column3,
        ....
        columnN
	from table_name;
*/

select 
		name,
		currency,
		continent
	from country_detail;
    

/*
Q1. Find out all the unique continents that is present in the data.
Q2. fIND OUT HOW MANY Unique continents are there.
-- pandas unique()  and nunique() 
-- sql distinct and count()
*/

/*
-- unique()
select 
		distinct column1
    from table_name;

--nunique()
select 
		count(distinct column1 )
    from table_name;

*/

select
		distinct continent
	from country_detail;


select 
		count( distinct continent)
    from country_detail;
    
  
  -- Q. count of no. of records or rows in the table.
select count(*) from country_detail;

insert into  country_detail( id , name , currency, size_km_square, is_democracy, continent )
					  value (10, 'Sauida Arabia', 'Riyad', 56337.45 , 0, "Asia"),
							(11, 'Thailand', 'Bhat', 5737.45 , 0, "Asia"),
							(7, 'North Korea', 'Won', 6537.45 , 0, "Asia");
                            
/* 
Q1-  Find out all the countries that has area less than 1000 sq km .
Q2 - Find out all the countries that are in the continet Europe.
Q3 - Find out all the countries that has area between 2000 sq km and 5000 sq km .
Q4 - Find out all countries in Asia which is non democratic.
*/

-- We have to select the data based on some criteria.

/* select
		column1,
        column2,
        ...
        columnN
	from table_name
		where condition;
*/

-- Q1-  Find out all the countries that has area less than 1000 sq km .
select
		name
    from country_detail
		where size_km_square < 1000 ;
        
-- Q2 - Find out all the countries that are in the continent Europe.
select
		name
    from country_detail
		where continent = "Europe";
        
-- Q2 - Find out all the countries that are in the continent Europe or Asia or africa.
-- OR operator
select
		name,
        continent
    from country_detail
		where continent = "Europe"
			or continent = "Asia"
            or continent = "Africa";

-- IN operator

select
		name,
        continent
    from country_detail
		where continent in ("Europe","Asia","Africa");

-- Q4 - Find out all countries in Asia which is non democratic.

-- Alternate version Find out all countries that are in Asia or non democratic ?

select 
		name
	from country_detail
		where continent ="Asia" 
			and  is_democracy  = 0 ;
            
-- Error Code: 1054. Unknown column 'is_democratic' in 'where clause'

--  Q3 - Find out all the countries that has area between 20000 sq km and 50000 sq km .

select 
		name
	from country_detail
		where size_km_square between 20000 and 50000;

/*        
select
		column1,
        column2,
        ...
        columnN
	from table_name
		where condition1 and/or condition2 ....;
        
*/
                        
                        
/*
Q5 - Find all countries which has Dollar in the currency name?
Q6 - Find all the countries that starts with 'N' ?
Q7 - find all the countries that ends with 'A'  ?
*/                
 
/*
-- LIKE operator
 Matching a string 
 
 Wild Cards  
 -- "%" it can match n number of characters in the string.  
 E.g. titanic  -- tan
	 TAN
     TANK
     BHUTAN
     tANKISHA 
     Titan
     
like "%tan%" 
	-- search for any word that has tan in them before or after there could be any letter.
     titanic  
	 TAN
     TANK
     BHUTAN
     tANKISHA 
     Titan
     

like "Tan%" 
	-- search for thoise word which starts with tan but can end with any letter.
    TAN
	TANK
    tANKISHA 
    

like "%tan"
	-- search for those word which ends with tan but can start with any letter.
	TAN
    BHUTAN
    Titan 

    
 -- "_"  it can search for just one character
 
	SUN  - un
    Uninstall
    Unlock 
    
1.   "_un_"
2.   "un_"
3.   "_un"    

*/ 
    
-- Q5 - Find all countries and currency which has Dollar in the currency name?

select
		name,
        currency
	from country_detail
		where currency like  "%Dollar%";
        
-- Q6 - Find all the countries that starts with 'N' ?
-- "N%"

select
		name
	from country_detail
		where name like "N%";
        
-- Wouldn't work as followed by N there is no cou8ntry which has just 1 letter.        
select
		name
	from country_detail
		where name like "N_";


-- Q7 - find all the countries that ends with 'A'  ?     

select 
		name
	from country_detail
		where name like "%A";
		
        
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
                        
                        
                        
                        
                        
                        