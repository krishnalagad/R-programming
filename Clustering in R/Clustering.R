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

#Hierarchical Clustering data
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

#k Means Clustering
KRCDF = read.csv("1068377-Cust_Spend_Data.csv", header = TRUE)
View(KRCDF)

#Scaling dataset
Scaled.RCDF = scale(KRCDF[, 3:7])
View(Scaled.RCDF)

#Identifying the optimal number of clusters from wss.
wssplot <- function(data, nc=15, seed=1234){
  wss <- (nrow(data) - 1)*sum(apply(data, 2, var))
  for(i in 2:nc){
    set.seed(seed)
    wss[i] <- sum(kmeans(data, centers = i)$withinss)}
  plot(1:nc, wss, type = "b", xlab = "Number of clusters",
       ylab = "within groups sum of squares")}

wssplot(Scaled.RCDF, nc=5)

#Installing nbClust Library
#Identifying the optimal number of clusters
library(NbClust)
?NbClust

set.seed(1234)
nc <- NbClust(KRCDF[, c(-1, -2)], min.nc = 2, max.nc = 4, method = "kmeans")

?kmeans
kmeans.clus <- kmeans(x = Scaled.RCDF, centers = 2, nstart = 25)
kmeans.clus

#Plotting the clusters
install.packages("fpc")
library(fpc)
plotcluster(Scaled.RCDF, kmeans.clus$cluster)

plotcluster(Scaled.RCDF, kmeans.clus$cluster,
            color=TRUE, shade=TRUE, labels = 2, lines=1)

#Profiling Clusters
KRCDF$Clisters <- kmeans.clus$cluster
View(KRCDF)
aggr = aggregate(KRCDF[, -c(1,2,8)], list(KRCDF$Clisters), mean)
clus.profile = data.frame(Clusters = aggr[, 1],
                          Freq = as.vector(table(KRCDF$Clisters)),
                          aggr[, -1])

View(clus.profile)
