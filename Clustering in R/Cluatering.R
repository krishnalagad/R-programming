#setting path of current working directory
setwd("D:/R/Datasets")
getwd()

#importing data
RCDF <- read.csv("1068377-Cust_Spend_Data.csv", header = TRUE)
View(RCDF)

#Scaling Data
Scaled.RCDF <- scale(RCDF[, 3:7])
View(Scaled.RCDF)

#Calculate the distance
d.euc <- dist(x = Scaled.RCDF, method = "euclidean")
print(d.euc, digits = 2)

#Clustering data
?hclust
clus2 = hclust(d.euc, method = "average")
plot(clus2, labels = as.character(RCDF[, 2]))
rect.hclust(clus2, k = 3, border = "red")
View(RCDF)

print(clus2)
View(clus2)

clus2$height
#Profiling the clusters
RCDF$Cluster <- cutree(clus2, k=3)
aggr = aggregate(RCDF[, -c(1,2,8)], list(RCDF$Cluster), mean)
print(aggr)
cluster.profile <- data.frame(Cluster = aggr[, 1],
                              Freq = as.vector(table(RCDF$Cluster)),
                              aggr[, -1])
View(cluster.profile)
summary(cluster.profile)
str(cluster.profile)

