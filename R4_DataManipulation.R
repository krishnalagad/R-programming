#settting path of current working directory
setwd("D:/R/Datasets")

#import library(readr)
library("readr")
textCSV = read_csv("dataset1_CSV.csv")
View(textCSV)

#Get info about functions.
?colnames()
?make.names()

#Retrieve column names from dataframe
class(textCSV)
textCSV = as.data.frame(textCSV)
colnames(textCSV)

#Give dataframes column a proper name
colnames(textCSV) = make.names(colnames(textCSV))
colnames(textCSV)

#Set column name in right format
summary(textCSV)
textCSV$Stock.Name = as.factor(textCSV$Stock.Name)
textCSV$Max.Holder = as.factor(textCSV$Max.Holder)

###FILTERING/SUBSETTING
#focos on first rows
first.stock.pop = head(textCSV$Stock.Price, 10)
first.stock.pop

#using logical operator to filter data
textCSV[textCSV$Stock.Price > 32.4,]
expensive.stocks <- textCSV[textCSV$Stock.Price > 32.4,]
small.stocks <- textCSV[textCSV$Stock.Price < 32.4,]

#Two logical conditions
#AND
vip.stocks = textCSV[textCSV$Stock.Price >30 & textCSV$Stock.Price <= 42,]
View(vip.stocks)

#OR
mid.stocks = textCSV[textCSV$Stock.Price >30 | textCSV$Stock.Price <= 22,]
View(mid.stocks)

###BINDING
#Appending datasets
all.stocks = rbind(expensive.stocks, small.stocks)
View(all.stocks)

#Binding Colums
all.stocks.flag = all.stocks$Stock.Price > 32.4
all.stocks = cbind(all.stocks, all.stocks.flag)
View(all.stocks)
summary(all.stocks)

#TRANSFORMSTION
all.stocks$stocks.10 = all.stocks$Stock.Price * 10

#Logarithm
expensive.stocks$log.trans = log(expensive.stocks$Stock.ID)
head(expensive.stocks,10)

#Revert back with exponential
expensive.stocks$log.trans = exp(expensive.stocks$log.trans)
head(expensive.stocks)

#SORTING
#ascendign Order
textCSV = textCSV[order(textCSV$Max.Holder),]
View(textCSV)

textCSV = textCSV[order(textCSV$Stock.ID),]
View(textCSV)

#Descending Order
textCSV = textCSV[order(-textCSV$Max.Holder),]
View(textCSV)

textCSV = textCSV[order(-textCSV$Stock.Price),]
View(textCSV)
