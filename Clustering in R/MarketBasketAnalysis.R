#Setting Working Diretory
setwd("D:/R/Datasets")
getwd()

RTxn <- read.table("1068374-MARKET_BASKET_ANALYSIS.csv", sep = ",", header = T)
nrow(RTxn)

View(RTxn)

#View Stricture of dataset
str(RTxn)

RTxn$Invoice_No = as.factor(RTxn$Invoice_No)

##Aggregate the invoice at transaction level.
##We want one row per transaction.
##One row should have all the information of product.
?split
Aggr.RTxn = split(RTxn$Item_Desc, RTxn$Invoice_No)
View(Aggr.RTxn)
class(Aggr.RTxn)

##To see the specific row number transaction.
Aggr.RTxn[400]

install.packages("arules")
library(arules)

#Logic to remove duplicate data
agg.RTxn_DD <- list()
for (i in 1:length(Aggr.RTxn)) {
  agg.RTxn_DD[[i]] <- as.character(Aggr.RTxn[[i]][!duplicated(Aggr.RTxn[[i]])])
}


#Converting transaction from list format to transaction.
Txns <- as(agg.RTxn_DD, "transactions")
Txns
summary(Txns)

inspect(Txns[110])

#Let us see the support
freq <- itemFrequency(Txns)
class(freq)
freq <- freq[order(-freq)]
freq
freq["Bread"]

barplot(freq[1:20])

?itemFrequencyPlot
itemFrequencyPlot(Txns, support=0.10)
itemFrequencyPlot(Txns, topN = 10)

install.packages("arulesviz")
library(arulesViz)

?apriori
arules1 <- apriori(data = Txns)
summary(arules1)

##See the associate rules
inspect(arules1)

inspect(sort(arules1, by = "lift"))


arules2 <- apriori(data = Txns, 
                   parameter = list(support = 0.05, confidence = 0.5, maxlen = 2)
                   )
summary(arules2)

inspect(sort(arules2, by = "lift")[1:30])

rules_df = as(arules2, "data.frame")
View(rules_df)

rules_df$lhs_support <- rules_df$support / rules_df$confidence
rules_df$rhs_support <- rules_df$confidence / rules_df$lift
View(rules_df)

#Exporting Dataset
write.table(rules_df, file = "ExportedDatasets/mba_output.csv", sep = ",", append = F, row.names = F)
unlink("mba_output.csv")




