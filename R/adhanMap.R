#mapBy= c("Fajr", "Sunrise",  "Dhuhr", "Asr",  "Sunset",  "Maghrib",  "Isha", "Imsak")
adhanMap<- function(
  method,
  city,
  country,
  day,
  month,
  year,
  mapCity,
  mapCountry, mapBy){
# Check params
  if(missing(method))
    stop('
Method parameter is missing !
Please clarify the method. You can choose numbers 0 to 14 which stand for:
  0 - Shia Ithna-Ansari
  1 - University of Islamic Sciences, Karachi
  2 - Islamic Society of North America
  3 - Muslim World League
  4 - Umm Al-Qura University, Makkah
  5 - Egyptian General Authority of Survey
  7 - Institute of Geophysics, University of Tehran
  8 - Gulf Region
  9 - Kuwait
  10 - Qatar
  11 - Majlis Ugama Islam Singapura, Singapore
  12 - Union Organization islamic de France
  13 - Diyanet İşleri Başkanlığı, Turkey
  14 - Spiritual Administration of Muslims of Russia')
    
  if(missing(mapBy))
    stop('mapBy parameter is missing ! Choose a value in "Fajr", "Sunrise",  "Dhuhr", "Asr",  "Sunset",  "Maghrib",  "Isha" and "Imsak"')
  
  if(is.numeric(method))
    method<-as.character(method)
  
  if(missing(day)|missing(month)|missing(year)){
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
  
  call<- jsonlite::fromJSON(callStr)
  
  ind<- which(call$data$date$gregorian$date == paste(sprintf("%02s", day),sprintf("%02s",month),year, sep="-"))
  
  res<- c("date"=call$data$date$gregorian$date[ind], 
          call$data$timings[ind,])
  outRes<-res
  if(mapCity!=""&mapCountry!=""){
    callMapStr<-paste("http://api.aladhan.com/v1/calendarByCity?",
                   "city=", mapCity, "&",
                   "country=", mapCountry, "&",
                   "month=", month, "&",
                   "year=", year, "&",
                   "method=", method, sep="")
    
    callMap<- jsonlite::fromJSON(gsub(" ", "", callMapStr, fixed=TRUE))
    resMap<- c("date"=callMap$data$date$gregorian$date[ind], 
                     callMap$data$timings[ind,])

    outRes<- as.POSIXct(rep(gsub(" .*","", res[mapBy]), length(res)-2), format="%H:%M")+ as.numeric(lapply(resMap[-c(1, length(resMap))], function(x){difftime(as.POSIXct(gsub(" .*","",x), format="%H:%M"), as.POSIXct(gsub(" .*","",resMap$Dhuhr), format="%H:%M"), units ="secs")} ))
    outRes<- c(res[1], as.character(outRes))
    outRes[-1]<- paste(gsub(":00$", "", unlist(gsub(".* ", "", outRes[-1]))), gsub(".* ","",resMap["Dhuhr"]) )
    outRes<- unlist(outRes)
    names(outRes)<- names(res[-c(length(res))])
               
  }
  return(outRes)
}