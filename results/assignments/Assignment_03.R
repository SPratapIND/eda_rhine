#Navigator’s Tasks - 1

library(data.table)
library(ggplot2)
my_col <-  c("#D35C37", "#FC4E07", "#D6C6B9", "#97B8C2")
runoff_stations <- readRDS('data/runoff_stations.rds')
runoff_day <- readRDS('data/runoff_day.rds')
runoff_stats <- runoff_day[, .(mean_day = round(mean(value), 0),
                               med_day = round(median(value), 0),
                               min_day = round(min(value), 0),
                               max_day = round(max(value), 0)), by = sname]
scaterplot <- melt(runoff_stats, id.vars = 'sname')
ggplot(scaterplot, aes(x = sname, y = value)) +
  geom_point(aes(color = variable, shape = variable))
