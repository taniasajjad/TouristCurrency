install.packages("dplyr")
library("dplyr")
library(tidyr)
install.packages("tidyverse")
library(tidyverse)
library(xlsx)
library(ggthemes)
library(extrafont)
library(ggplot2)
library(readxl)
library(scales)

tour <- read.csv("https://sites.google.com/site/cit137sp19/week-6/tourism.csv", skip=4)
View(tour)

myFinal <- function(){
  country1 <- readline(prompt = "Enter first country")
  country2 <- readline(prompt = "Enter second country")
  country3 <- readline(prompt = "Enter third country")
  
  tourism <- tour %>% select(Country.Name,X1995:X2017) %>%
    filter(Country.Name %in% c(country1, country2, country3 )) 
  tours <-gather(tourism," Year", "Dollars", -1, na.rm = TRUE)
  names(tours)[1]<-"Country"
  names(tours)[2]<-"Year"
  names(tours)[3]<-"Dollar"
  
  p1 <- ggplot() + geom_line(aes(y =Dollar, x =Year, group = Country, colour = Country), size=1,
                             data = tours, stat = "identity")  + labs(title = "Tourism Dollars") 
  p1<- p1 + theme(plot.title = element_text(hjust = 0.5))
  
  p1<- p1 + scale_y_log10(label=dollar)
  
  return (p1)
}
myFinal()



