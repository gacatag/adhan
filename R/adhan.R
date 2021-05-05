adhan<- function(
  method,
  city,
  country,
  day,
  month,
  year){
  
  if(is.numeric(method))
    method<-as.character(method)
  
  if(missing(day)|missing(month)|missing(year)){
    now<- unlist(strsplit(date(), split=" "))
    names(now)<- c("weekday", "month", "blank", "day", "time", "year")
  
  
  month<- match(now["month"], month.name)
  day<- now["day"]
  year<- now["year"]
  }
  callStr<-"http://api.aladhan.com/v1/calendar?latitude=51.508515&longitude=-0.1254872&method=2&month=4&year=2017"
  
  callStr<-paste("http://api.aladhan.com/v1/calendarByCity?",
                 "city=", city, "&",
                 "country=", country, "&",
                 "month=", month, "&",
                 "year=", year, "&",
                 "method=", method, sep="")
  
  call<- jsonlite::fromJSON(gsub(" ", "", callStr))
  
  ind<- which(call$data$date$gregorian$date == paste(sprintf("%02s", day),sprintf("%02s",month),year, sep="-"))
  
  res<- unlist(c("date"=call$data$date$gregorian$date[ind], 
          call$data$timings[ind,]))
  return(res)
}