df <- read.csv('/Users/neilangra/Desktop/DATA/Data final visualizatoin network/detroitcrash.csv')
library(dplyr)
library(ggplot2)
library(ggthemes)


#Aggregate all the data points by Year so graph isn't super clustered
yearly <- df %>%
  group_by(Year) %>%
  summarise(avg_severity = mean(severity, na.rm = TRUE))

#Graph scatterplot + lin_reg line + interval
ggplot(yearly, aes(x = Year, y = avg_severity)) +
  geom_point() +
  geom_smooth(method = "lm", se = TRUE) +
  theme_wsj() + 
  labs(
    title = "Trend of Crash Severity Over Time",
    x = "Year",
    y = "Average Severity Score"
  ) + 
  theme(
    axis.title.x = element_text(),
    axis.title.y = element_text()
  )
