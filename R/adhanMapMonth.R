#mapBy= c("Fajr", "Sunrise",  "Dhuhr", "Asr",  "Sunset",  "Maghrib",  "Isha", "Imsak")
adhanMapMonth<- function(
  method,
  city,
  country,
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
  
  if(missing(month)|missing(year)){
    now<- unlist(strsplit(date(), split=" "))
    names(now)<- c("weekday", "month", "blank", "day", "time", "year")
  
  
  month<- match(now["month"], month.name)
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
  
  
  res<- data.frame("date"=call$data$date$gregorian$date, 
          call$data$timings)
  outRes<-res
  if(mapCity!=""&mapCountry!=""){
    callMapStr<-paste("http://api.aladhan.com/v1/calendarByCity?",
                   "city=", mapCity, "&",
                   "country=", mapCountry, "&",
                   "month=", month, "&",
                   "year=", year, "&",
                   "method=", method, sep="")
    
    callMap<- jsonlite::fromJSON(gsub(" ", "", callMapStr, fixed=TRUE))
    resMap<- data.frame("date"=callMap$data$date$gregorian$date, 
                     callMap$data$timings)

    # outRes<- tapply(as.POSIXct(rep(gsub(" .*","", res[,""]), each=(ncol(res)-2)), format="%H:%M"),  rep(1:nrow(res),each=(ncol(res)-2)), c) + 
    diffT<- apply(resMap[,-c(1, length(resMap))], 2, function(x) return(difftime(as.POSIXct(gsub(" .*","",x), format="%H:%M"),as.POSIXct(gsub(" .*","",resMap[,mapBy]), format="%H:%M"), units = "secs")))
  outRes<- resMap[,-c(1, length(resMap))]
  for(j in 1:ncol(outRes))
    outRes[,j]<-diffT[,j]+as.POSIXct(gsub(" .*","", res[,mapBy]), format="%H:%M")
                 
    outRes<- data.frame("date"=res[,1], apply(outRes,2,as.character))
    outRes<- apply(outRes,2,as.character)
    outRes[,-1]<- apply(gsub(":00$", "", gsub(".* ", "", outRes[,-1])), 2, function(x) paste(x, gsub(".* ","",resMap[1,"Dhuhr"]) ) )
               
  }
  return(outRes)
}