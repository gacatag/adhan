\name{adhanMapHelsinkiMeccaUniTeh}
\alias{adhanMapHelsinkiMeccaUniTeh}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Helsinki prayer times resulted by mapping Mecca's prayer times to those of Helsinki (by "Dhur" praying time). It uses the method used by Institute of Geophysics (University of Tehran) to caclculate the Adhan times.
}
\description{
Returns Helsinki Adhan times that are calculated based on mekka's Adhan times.
}
\usage{
adhanMapHelsinkiMeccaUniTeh(day, month, year)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
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
\code{\link{adhanHelsinkiUniTeh}}
}
\examples{
adhanMapHelsinkiMeccaUniTeh()
}
