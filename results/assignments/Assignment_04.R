
library(data.table)
library(ggplot2)
runoff_summary <- readRDS('data/runoff_summary.rds')
runoff_summary_key <- readRDS('data/runoff_summary_key.rds')
runoff_stats <- readRDS('data/runoff_stats.rds')
runoff_month_key <- readRDS('data/runoff_month_key.rds')
runoff_summer_key <- readRDS('data/runoff_summer_key.rds')
runoff_winter_key <- readRDS('data/runoff_winter_key.rds')
runoff_summer <- readRDS('data/runoff_summer.rds')
runoff_winter <- readRDS('data/runoff_winter.rds')
runoff_year_key <- readRDS('data/runoff_year_key.rds')
runoff_day <- readRDS("./data/runoff_day_raw.rds")
runoff_month <- readRDS('data/runoff_month.rds')


colset_4 <-  c("#D35C37", "#BF9A77", "#D6C6B9", "#3366FF")
theme_set(theme_bw())

year_thres <- 2000

runoff_year_key[year < year_thres, period := factor('pre_2000')]
runoff_year_key[year >= year_thres, period := factor('aft_2000')]
runoff_month_key[year < year_thres, period := factor('pre_2000')]
runoff_month_key[year >= year_thres, period := factor('aft_2000')]


# Navigator’s Tasks

#Annual data

ggplot(runoff_year_key, aes(year, value, fill = period)) +
  geom_boxplot() +
  facet_wrap(~sname, scales = 'free_y') +
  scale_fill_manual(values = colset_4[c(1, 4)]) +
  xlab(label = "Year") +
  ylab(label = "Runoff (m3/s)") +
  theme_bw()

#Monthly data

ggplot(runoff_month_key[year >= 1983], aes(x = factor(month), value, fill = period)) +
  geom_boxplot() +
  facet_wrap(~sname, scales = 'free_y') +
  scale_fill_manual(values = colset_4[c(1, 4)]) +
  xlab(label = "Month") +
  ylab(label = "Runoff (m3/s)") +
  theme_bw()
  
DOMA, BASR  - max_runoff - May, June, July
KOEL - max_runoff - Jan, Feb, Mar, Apr 

After 2000 DOMA show - Decrease runoff
while BASR and KOEL show - Increase runoff


# 2 --- 


ggplot(runoff_month, aes(sname, value)) + 
  geom_point() + 
  stat_quantile(formula = y~x, quantiles=c(0.1, 0.50, 0.9, 1)) + 
  theme_bw()




# 3 ---

runoff_winter[, value_norm := scale(value), sname]
runoff_summer[, value_norm := scale(value), sname]
n_stations <- nrow(runoff_summary)

ggplot(runoff_winter[year > 1950], aes(x = year, y = value_norm, col = sname)) +
  geom_point(shape=19) +    
  geom_smooth(method=lm, formula = y~x, se=F)+
  ggtitle('Winter runoff') +
  xlab(label = "Year") +
  ylab(label = "Runoff (m3/s)") +
  theme_bw()

ggplot(runoff_summer[year > 1950], aes(x = year, y = value_norm, col = sname)) +
  geom_point(shape=19) +    
  geom_smooth(method=lm, formula = y~x, se=F)+
  ggtitle('Summer runoff') +
  xlab(label = "Year") +
  ylab(label = "Runoff (m3/s)") +
  theme_bw()


#Explorer’s questions

#1 -

The behaviour of DOMA is different than the other stations because-
 - Situated in Alps area, located before a large water reservoir  



#2 - 
precip_day <- readRDS('./data/precip_day.rds')
ggplot(precip_day, aes(x = date, y = value) +
         geom_boxplot() +
         facet_wrap(~date, scales = 'free') +
         xlab(label = "Time") +
         ylab(label = "Rainfall (mm)") +
         theme_bw()
       
ggplot(precip_day, aes(x = date, y = value)) +
         geom_point(shape=19) +    
         geom_smooth(method=lm, formula = y~x, se=F)+
         xlab(label = "Time") +
         ylab(label = "Runoff (m3/s)") +
         theme_bw()


#3

As the study sugests a clear shift in the median and the 25-75% range after the yaer 2000 (Middelkoop et al). however study also 
       suggets that winter runoff has been increased and summer runoff has been decreased over Rhine river basin. study over the 
       upstream catchments (DOMA) with comparision to lowland regions (KOEL) are necessory to track variation in runoff.


