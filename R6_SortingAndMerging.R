#settting path of current working directory
setwd("D:/R/Datasets")

#import library(readr)
library("readr")
library("readxl")

#import first dataset
Countries = read_csv("739143-Countries+Population.csv")
summary(Countries)

#Clean column names and set right datatypes
colnames(Countries) = make.names(colnames(Countries))
Countries$Country.Name = as.factor(Countries$Country.Name)
Countries$Country.Code = as.factor(Countries$Country.Code)
summary(Countries)

#import second dataset
Countries_map = read_excel("739171-Countries+Region+Mapping.xlsx")
summary(Countries_map)

Countries_map$Country.Code = as.factor(Countries_map$Country.Code)
Countries_map$Region = as.factor(Countries_map$Region)
Countries_map$IncomeGroup = as.factor(Countries_map$IncomeGroup)
summary(Countries_map$IncomeGroup)
View(Countries_map)

#set to ordered factors and give orders
Countries_map$IncomeGroup = ordered(Countries_map$IncomeGroup, levels = c("Low income",
                                                                          "Lower middle income",
                                                                          "Upper middle income",
                                                                          "High income"))
class(Countries_map$IncomeGroup)
summary(Countries_map)

#import third dataset
Countries_info = read_csv("739178-Countries+Indicators.csv")
summary(Countries_info)
Countries_info$Country.Code = as.factor(Countries_info$Country.Code)
summary(Countries_info)

##Merging Data sets Together

#Left join
temp = merge(Countries, Countries_map, by = "Country.Code", all.x = TRUE)

#inner join
Countries_all = merge(Countries, Countries_map, by = "Country.Code")

#full outer join
temp2 = merge(Countries_all, Countries_info, by = "Country.Code", all = TRUE)

#Correct left join
Countries_all = merge(Countries_all, Countries_info, by = "Country.Code", all.x = TRUE)

#Remove unwanted objects from global environment
rm(temp, temp2)


#Summary tables

#table()
Region_vs_Income_Cat = table(Countries_all$Region, Countries_all$IncomeGroup)
print(Region_vs_Income_Cat)

prop.table(Region_vs_Income_Cat, 1)

prop.table(Region_vs_Income_Cat, 2)


#installing dplyr package
library(dplyr)

#Extract different regions
Region_sum = Countries_all %>% group_by(Region) %>% summarise()
View(Region_sum)

Region_Income_sum = Countries_all %>% group_by(Region, IncomeGroup) %>% summarise()
View(Region_Income_sum)

Region_Income_sum = Countries_all %>% group_by(Region, IncomeGroup) %>% summarise(Number.of.Countries = n())
View(Region_Income_sum)

Region_sum = Countries_all %>% group_by(Region) %>% summarise(Diff.Income.Group = n_distinct(IncomeGroup))
View(Region_sum)

Region_sum = Countries_all %>% group_by(Region) %>% summarise(No.of.Countries = n(),
                                                              Total.population.in.millions = sum(Total.Population.2017) / 1000000,
                                                              Countries.with.low.income = sum(IncomeGroup == "Low income"),
                                                              Avrg.GDP.per.capita = mean(GDP.per.capita.2017, na.rm = TRUE),
                                                              median.GDP.Per.Capita = median(GDP.per.capita.2017, na.rm = TRUE),
                                                              Std.Daviation.GDP.Per.Capita = sd(GDP.per.capita.2017, na.rm = TRUE),
                                                              Min.Under.5.Mortality.Rate = min(Under.5.Mortality.Rate.2017, na.rm = TRUE),
                                                              Max.Under.5.Mortality.rate = max(Under.5.Mortality.Rate.2017, na.rm = TRUE))
View(Region_sum)

#Exporting Data
#Text File
write.table(Region_sum, "D:/R/Datasets/Region_sum.txt")

#Excel File
library(xlsx)
write.xlsx(Region_sum, "D:/R/Datasets/Region_sum.xlsx")

vec1 <- c(1,TRUE, "a")
class(vec1)
