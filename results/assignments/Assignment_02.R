#Navigator’s Tasks#
#1- Create a new data.table from runoff_stations, containing sname, area, altitude. Then, transform it to tidy format.

library(data.table)
library(ggplot2)
runoff_stations <- fread('./data/raw/runoff_stations.csv')
runoff_stations[, sname := factor(abbreviate(station))]
runoff_stations[, area := round(area, 3)]
runoff_stations[, altitude := round(altitude, 0)]
saveRDS(runoff_stations, './data/runoff_stations_assign.rds')
runoff_stations <- readRDS('./data/runoff_stations_assign.rds')
runoff_day_assign <- data.table()

#2- Create a geom_point plot of area (x axis) vs. altitude (y axis).
sp <- ggplot(runoff_stations, aes( x = area, y = altitude, label = sname))+
  geom_point()
sp + geom_text()

#3- 
sp <- ggplot(runoff_stations, aes( x = area, y = altitude, label = sname, color = sname))+
  geom_point()
sp + geom_text()


#4- Create a graph comparing the periods of available data at each station (assume that there are no missing values).
ggplot(data = runoff_day, aes(x = date, y = value)) +
  geom_line() +
  facet_wrap(~sname) + 
  theme_bw()

#Explorer’s Questions
#1- Which are the units for area and runoff in our records?
Area = Kilometer square
Runoff = Meter cube/second

#2- Which is the average catchment area and runoff of Rhine, according to our data? Write a script that performs the calculation.
library(data.table)
library(ggplot2)
runoff_stations <- readRDS('./data/runoff_stations_raw.rds')
runoff_day <- readRDS('./data/runoff_day_raw.rds')


#average catchment area
mean(runoff_stations$area)
67069.5

#runoff of Rhine
mean(runoff_day$value)
1275.114

#3- Which is the average runoff in each station? Present them in a graph.

average_runoff <-runoff_day[, list(mean(value)), by=sname]
plot(average_runoff)



#4- Is there any relationship between altitude and area? Why?

Area and Altitude both are height dependent.



