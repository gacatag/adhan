\name{adhanMapMonth}
\alias{adhanMapMonth}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Mapping prayer times for a month.
}
\description{
Mapping prayer times of a city to another city (for an entire month), based on a reference time. This is useful for those who live in cities with very long nights/days and wish to follow prayer times of another city.
}
\usage{
adhanMapMonth(method, city, country, month, year, mapCity, mapCountry, mapBy)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{city}{
 Character string with a city name. Defining this parameter is mandatory!
}
  \item{country}{
 Character string that includes a country's name. see \code{cointries()} for full list of countries ! Defining this parameter is mandatory!}
  \item{month}{
The month. either a number of a character string, e.g. "12". If missing, the current date (obtained from your system) will be used.
}
  \item{year}{
The year. either a number of a character string, e.g. "2021". If missing, the current date (obtained from your system) will be used.
}
  \item{mapCity}{
The city which its prayer time you want to follow.
}
  \item{mapCountry}{
The country where its prayer time you want to follow.
}
  \item{mapBy}{
The reference time to map. It can be either "Fajr", "Sunrise",  "Dhuhr", "Asr",  "Sunset",  "Maghrib",  "Isha", or "Imsak" !
}
}
\details{
If \code{mapBy} is to set "Dhur", the "Dhur" prayer times in the 'map' location (e.g. Mecca, Saudi Arabia) is mapped to the "Dhur" prayer time in your location of interest (e.g. Helsinki, Finland). Then all the other prayer times in your location of interest (i.e. Helsinki) are calculated according to the differecne of other prayer times from "Dhur" in the mapping location (i.e. Mecca). 
}
\value{
Data frame showing the prayer times.
}
\author{
Ali Oghabian
}


\seealso{
\code{\link{adhanMonth}}
\code{\link{adhanMap}}
}
\examples{
adhanMapMonth(
  method="7",
  city="Helsinki",
  country="Finland",
  mapCity="Mecca",
  mapCountry="Saudi Arabia", mapBy="Dhuhr")
}