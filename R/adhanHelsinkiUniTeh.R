adhanHelsinkiUniTeh<- function(
  day,
  month,
  year){
  # Get date from system if it is missing
  if(missing(day)|missing(month)|missing(year)){
    now<- unlist(strsplit(date(), split=" "))
    names(now)<- c("weekday", "month", "blank", "day", "time", "year")
    
    
    month<- match(now["month"], month.name)
    day<- now["day"]
    year<- now["year"]
  }
  # return prayer times
  return(adhan( 
    month=month,
    day=day,
    year=year, 
    method="7",
    city="Helsinki",
    country="Finland"))
}