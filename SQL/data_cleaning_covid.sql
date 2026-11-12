CREATE TABLE raw_covid as
SELECT * 
FROM 
read_csv('/Users/mac/Downloads/time_series_covid19_confirmed_global.csv'); 

SELECT * FROM raw_covid 

CREATE table COVID_19 AS 
SELECT *
FROM (
    UNPIVOT raw_covid
    ON COLUMNS(* EXCLUDE (
        "Province/State",
        "Country/Region",
        "Lat",
        "Long"
    ))
    INTO
        NAME date
        VALUE confirmed_cases
); 
SELECT * from COVID_19 

CREATE TABLE Covid_death as
SELECT * 
FROM 
read_csv('/Users/mac/Downloads/time_series_covid19_deaths_global.csv'); 

CREATE  table COVID_DEATH1 AS 
SELECT *
FROM (
    UNPIVOT Covid_death
    ON COLUMNS(* EXCLUDE (
        "Province/State",
        "Country/Region",
        "Lat",
        "Long"
    ))
    INTO
        NAME date
        VALUE confirmed_cases
); 

CREATE TABLE Covid_REC as
SELECT * 
FROM 
read_csv('/Users/mac/Downloads/time_series_covid19_Recovered_global.csv'); 

CREATE  table COVID_RECOVERY AS 
SELECT *
FROM (
    UNPIVOT Covid_REC
    ON COLUMNS(* EXCLUDE (
        "Province/State",
        "Country/Region",
        "Lat",
        "Long"
    ))
    INTO
        NAME date
        VALUE confirmed_cases
); 

DROP TABLE raw_covid 

DROP TABLE Covid_REC 

DROP TABLE Covid_death 

ALTER TABLE COVID_DEATH1 RENAME COLUMN confirmed_cases TO Death_cases 

ALTER TABLE COVID_recovery RENAME COLUMN confirmed_cases TO  Recovered_cases 
