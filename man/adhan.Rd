\name{adhan}
\alias{adhan}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Adhan (prayer) times.
}
\description{
Retreive Adhan (prayer) times, according to city, country and method input. Defining the method, city and country parameters is mandatory.
}
\usage{
adhan(method , city, country, day, month, year)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{method}{
 The method used for estimatong the prayer times. Acceptable values are 0-14. The corrspond to 0-Shia Ithna-Ansari, 1-University of Islamic Sciences (Karachi), 2-Islamic Society of North America, 3-Muslim World League, 4-Umm Al-Qura University (Makkah), 5-Egyptian General Authority of Survey, 7-Institute of Geophysics (University of Tehran), 8-Gulf Region, 9-Kuwait, 10-Qatar, 11-Majlis Ugama Islam Singapura (Singapore), 12-Union Organization islamic de France, 13-Diyanet İşleri Başkanlığı (Turkey) and 14-Spiritual Administration of Muslims of Russia. Defining this parameter is mandatory!
}
  \item{city}{
 Character string with a city name. Defining this parameter is mandatory!
}
  \item{country}{
 Character string that includes a country's name. see \code{cointries()} for full list of countries ! Defining this parameter is mandatory!}
  \item{day}{
The day. either a number of a character string, e.g. "21". If missing, the current date (obtained from your system) will be used.
}
  \item{month}{
The month. either a number of a character string, e.g. "12". If missing, the current date (obtained from your system) will be used.
}
  \item{year}{
The year. either a number of a character string, e.g. "2021". If missing, the current date (obtained from your system) will be used.
}
}

\value{
vector of character strings showing the prayer times.
}

\author{
Ali Oghabian
}


\seealso{
\code{\link{adhanMonth}}
\code{\link{adhanMap}}
}
\examples{
adhan( 
    method="7",
    city="Helsinki",
    country="Finland")
}

