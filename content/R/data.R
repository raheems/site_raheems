
library(dplyr)

set.seed(100)

df10 <- data.frame(
  site = rep(c("A", "B", "C", "D"), 20),
  value = c(rnorm(20, 0, 10), rnorm(20, 9, 5), rnorm(20, 1, 10) , rnorm(20, 5, 10))
)



# df2 = dataset

library(dplyr)
fit <- aov(value ~ site, data = df10)
summary(fit)
a <- unlist(summary(fit))
p <- as.vector(a[9])
q <- 1- p

df11 <- data.frame(
  group = c("p-value", "Testing"),
  value = c(p, q)
)


df12 <- df10 %>%
  filter(site == "B")