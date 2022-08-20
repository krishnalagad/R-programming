#Data Structure
#Vector
my_vector = c(12,23,34,45)
class(my_vector)
my_vector1 = c(10, 20, 30, TRUE)
class(my_vector1)
my_vector[1:4]

#Matrix
data = c(10,20,30,90,80,70,12,23,34)
data1 = c(21,32,43,54,12,23,34,34,43)
my_matrix = matrix(data, nrow = 3, ncol = 3, byrow = TRUE)
print(my_matrix)
print(my_matrix[1:2, 1:2])
my_matrix1 = matrix(data1, nrow = 3, ncol = 3, byrow = TRUE)
my_matrix2 <- my_matrix + my_matrix1
print(my_matrix2)

#Dataframe
my_dataframe = data.frame(
  stockId = c(3245, 4532,5467,1234),
  stockName = c("Jamnaauto", "Geojit", "BHEl", "Mastek"),
  stockPrice = c(42.35, 36.25, 29.65, 885.80)
)
print(my_dataframe)
str(my_dataframe)
summary(my_dataframe)
print(my_dataframe$stockName)
my_dataframe[1:2,]
my_dataframe$MaxHolderName <- c("Chakradhar", "Krishna", "Ghute", "Lagad")

#List
my_list = list(my_vector, my_matrix2, my_dataframe, my_list1 = list("john", "barbra"))
print(my_list)
print(my_list[[3]])

#Array
arr <- array(c(12,23,"krishna"), dim = c(2,2,3))
class(arr)
print(arr)

#Factor
vec <- c("a", "b", "c", "a")
fac <- factor(vec)
print(fac)
summary(fac)
print(ls())
