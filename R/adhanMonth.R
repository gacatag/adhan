adhanMonth<- function(
  method,
  city,
  country,
  month,
  year){
  
  if(is.numeric(method))
    method<-as.character(method)
  
  if(missing(month)|missing(year)){
    now<- unlist(strsplit(date(), split=" "))
    now<- now[which(now!="")]
    names(now)<- c("weekday", "month", "day", "time", "year")
    
  
  
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

  
  res<- data.frame("date"=call$data$date$gregorian$date, 
          call$data$timings)
  return(res)
}