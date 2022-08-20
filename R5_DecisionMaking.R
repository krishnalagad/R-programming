#multiline commemts achieved by
if(FALSE){
  "Here is the content of multiline comment
  here is content of multiline commnet.."
}
print("Hello Krishna")

#if-else in R
x <- c("krishna", "dilip", "lagad")
y <- c("geeta", "varsha")
if("krishna1" %in% x){
  cat("krishna is found..")
}else{
  cat("krishna is not found..")
}

#if-else-if in R
if("varsha" %in% x){
  cat("varsha is found..", x)
}else if("varsha" %in% y){
  cat("varsha is found...", y)
}else{
  print("varsha is not found...")
}

#Switch case statement
result <- switch(3,
                 "case1",
                 "case2",
                 "case3",
                 "case4"
                 )
cat(result)  
  
  
  
  