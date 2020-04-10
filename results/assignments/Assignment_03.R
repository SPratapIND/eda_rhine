#Navigator’s Tasks 
#1 - Scaterplot

library(data.table)
library(ggplot2)
runoff_stations <- readRDS('data/runoff_stations.rds')
runoff_day <- readRDS('data/runoff_day.rds')
runoff_stats <- runoff_day[, .(mean_day = round(mean(value), 0),
                               med_day = round(median(value), 0),
                               min_day = round(min(value), 0),
                               max_day = round(max(value), 0)), by = sname]
scaterplot <- melt(runoff_stats, id.vars = 'sname')
ggplot(scaterplot, aes(x = sname, y = value)) +
  geom_point(aes(color = variable, shape = variable))

#2 - Estimate the skewness and coefficient of variation for each record (a) as a new column 
#in runoff_stats and (b) as a new data.table.
sp <- ggplot(scaterplot, aes(x = sname, y = value))
sp + geom_boxplot()

In boxplot it can be seen, data is showing positive skewness because mean values are lying near first quartile.

# coefficient of variation


#3 - Can you plot each boxplot (facet) of monthly runoff with different fill colour according to the runoff class?
runoff_month <- runoff_day[, .(value = mean(value)), by = .(month, year, sname)]
runoff_month[, date := as.Date(paste0(year, '-', month, '-1'))]
ggplot(runoff_month, aes(x = factor(month), y = value)) +
  geom_boxplot(fill = colset_4[4]) +
  facet_wrap(~sname, scales = 'free') + 
  theme_bw()


#4- Use boxplot to plot daily runoff per station. What do you observe regarding outliers? Why do you think this happens?
d <- runoff_day[, year := year(date)]
runoff_day[, month := month(date)]
ggplot(d, aes(x = factor(date), y = value)) +
  geom_boxplot(fill = colset_4[4]) +
  facet_wrap(~sname, scales = 'free') + 
  theme_bw()


#5 - Create your own classes for area and altitude and plot them in a scater plot similar to this one.

sps <- runoff_summary[, .(sname, area, alt_class)]
to_plot <- runoff_stats[sps, on = 'sname']
ggplot(to_plot, aes(x = mean_day, y = area, col = area_class, cex = alt_class)) +
  geom_point(aes(color = alt_class, size =  alt_class))

#Explorer’s Questions
#1- Which is the difference between the median and the 0.5 quantile?

median = 0.5 quantile (both are same)

#2- Why the median and the mean are not the same in Rhine runoff?
summary(runoff_stats)
sname       mean_day       med_day        min_day         max_day     
DOMA   : 1   Min.   : 117   Min.   :  85   Min.   : 11.0   Min.   : 1167  
DIER   : 1   1st Qu.:1031   1st Qu.: 954   1st Qu.:259.0   1st Qu.: 4219  
NEUF   : 1   Median :1276   Median :1180   Median :364.0   Median : 5400  
REKI   : 1   Mean   :1305   Mean   :1173   Mean   :334.2   Mean   : 6225  
RHEM   : 1   3rd Qu.:2039   3rd Qu.:1790   3rd Qu.:464.0   3rd Qu.:10400  
BASR   : 1   Max.   :2251   Max.   :1990   Max.   :575.0   Max.   :13000  
(Other):11                                                                
coefficient_of_variation
Min.   : NA             
1st Qu.: NA             
Median : NA             
Mean   :NaN             
3rd Qu.: NA             
Max.   : NA             
NA's   :17 ' 

The region behind the median and the mean are not the same in Rhine runoff, might be the varaiability in the precipitation 
(throughout year) with the variation in the altitute of monitoring station and other geographical and meteorological factor (wind).

#3 - Do you notice something strange regarding the location of the stations LOBI and REES? Can you think of a possible explanation?
LOBI and REES both are nearest stations and showing similar runoff pattern.As these stations are situated near the sea, therefore 
recieves sufficient rainfall throughout year.


#4 - Which were the months, seasons, years with the highest/lowest runoff at each location? Try to present them in comprehensive way.

#Monthly variation
ggplot(runoff_month, aes(x = factor(month), y = value)) +
  geom_boxplot(fill = colset_4[4]) +
  facet_wrap(~sname, scales = 'free') + 
  theme_bw()

#Yearly variation
runoff_year <- runoff_day[, .(value = mean(value)), by = .(year, sname)]
ggplot(runoff_year[year > 1980], aes(x = year, y = value)) +
  geom_line(col =  colset_4[1]) +
  geom_point(col = colset_4[1]) + 
  facet_wrap(~sname, scales = 'free') +
  theme_minimal()

