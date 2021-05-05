\name{adhanHelsinkiUniTeh}
\alias{adhanHelsinkiUniTeh}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Prayer times in Helsinki and based on the method adapted by Univerisyt of Tehran.
}
\description{
Prayer times for Helsinki and based on the method adapted by Univerisyt of Tehran.
}
\usage{
adhanHelsinkiUniTeh(day, month, year)
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
\code{\link{adhanMapHelsinkiMeccaUniTeh}}
}
\examples{
adhanHelsinkiUniTeh()
}
