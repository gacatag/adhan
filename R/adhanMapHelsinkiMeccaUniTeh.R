adhanMapHelsinkiMeccaUniTeh<- function(
  day,
  month,
  year){
  # Get date from system if it is missing
  if(missing(day)|missing(month)|missing(year)){
    now<- unlist(strsplit(date(), split=" "))
    now<- now[which(now!="")]
    names(now)<- c("weekday", "month", "day", "time", "year")
    
    
    month<- grep(now["month"], month.name)
    day<- now["day"]
    year<- now["year"]
  }  
  # return prayer times
  return(adhanMap(
    month=month,
    day=day,
    year=year,
    method="7",
    city="Helsinki",
    country="Finland",
    mapCity="Mecca",
    mapCountry="Saudi Arabia",
    mapBy="Dhuhr"))
 
}