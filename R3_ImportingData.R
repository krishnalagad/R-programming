#import package
library("readr")

#set working directory
#back slashes need to be replaced with forward slashes in R.
setwd("D:/R/Datasets")
getwd()
text = read.table("dataset1_Text.txt", header = TRUE, fill = TRUE)
class(text)

#View Dataset
View(text)

#View Perticular elements
head(text, 12)
tail(text, 6)

#See Overviews
str(text)
summary(text)

#changing types
text$StockName = as.factor(text$StockName)
text$MaxHolder = as.factor(text$MaxHolder)

#importing csv file
textCSV = read_csv("dataset1_CSV.csv")
summary(textCSV)
class(textCSV)
textCSV$`Stock Name` = as.factor(textCSV$`Stock Name`)

#importing Excel spreadsheet
install.packages("readxl")
library("readxl")
excel = read_excel("dataset1_Excel.xlsx")
class(excel)
excel = as.data.frame(excel)
class(excel$`Stock Name`)
