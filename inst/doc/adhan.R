## ----adhanCityDate, out.width = 500, echo=TRUE, eval=TRUE---------------------
library(adhan)
adhan( 
    method=7,
    city="Helsinki",
    country="Finland",
    day=5, 
    month=5, 
    year=2021)

## ----adhanCityNoDate, out.width = 500, echo=TRUE, eval=TRUE-------------------
adhan( 
    method=7,
    city="Helsinki",
    country="Finland")

## ----adhanCityNoDateMonth, out.width = 500, echo=TRUE, eval=TRUE--------------

# Get prayer times of the current month
adhanMonth(
  method="7",
  city="Helsinki",
  country="Finland")

# Get prayer times of a month
adhanMonth(
  method="7",
  city="Helsinki",
  country="Finland", 
  month=3, 
  year=2021)

## ----adhanMapNoDate, out.width = 500, echo=TRUE, eval=TRUE--------------------

# The current day's prayer times in Helsinki based on aligning Dhuhr and prayer times in Mecca
adhanMap(
    method="7",
    city="Helsinki",
    country="Finland",
    mapCity="Mecca",
    mapCountry="Saudi Arabia",
    mapBy="Dhuhr")

# The prayer times of a day in Helsinki based on aligning Dhuhr and prayer times in Mecca
adhanMap(
    method="7",
    city="Helsinki",
    country="Finland",
    mapCity="Mecca",
    mapCountry="Saudi Arabia",
    mapBy="Dhuhr", 
    day=21, 
    month=3, 
    year=2021)

# The current month's prayer times in Helsinki based on aligning Dhuhr and prayer times in Mecca
adhanMapMonth(
  method="7",
  city="Helsinki",
  country="Finland",
  mapCity="Mecca",
  mapCountry="Saudi Arabia", mapBy="Dhuhr")

# The prayer times of a defined month in Helsinki based on aligning Dhuhr and prayer times in Mecca
adhanMapMonth(
    method="7",
    city="Helsinki",
    country="Finland",
    mapCity="Mecca",
    mapCountry="Saudi Arabia",
    mapBy="Dhuhr", 
    month=3, 
    year=2021)

