
df <- data.frame(
  group = c("p", "q"),
  value = c(5, 95)
)

df

library(ggplot2)
# Barplot
bp<- ggplot(df, aes(x="", y=value, fill=group))+
  geom_bar(width = 1, stat = "identity")
bp

pie<- bp + coord_polar("y", start=0)
pie


library(sunburstR)
library(dplyr)

df %>%
  sunburst(., count = TRUE, colors = c("green", "red"), percent = T, legend = T)

df <- data.frame(
  x= rnorm(100),
  y= rnorm(100) + rnorm(100)
)

head(df)


# 2018-08-02 13:18:18 ------------------------------

library(dplyr)

set.seed(100)

df2 <- data.frame(
  site = rep(c("A", "B", "C", "D"), 20),
  value = c(rnorm(20, 0, 10), rnorm(20, 9, 5), rnorm(20, 1, 10) , rnorm(20, 5, 10))
)
head(df2)


df2 = dataset

library(dplyr)
fit <- aov(value ~ site, data = df2)
summary(fit)
a <- unlist(summary(fit))
p <- as.vector(a[9])
q <- 1- p

df_p <- data.frame(
  group = c("p-value", "Acceptance"),
  value = c(p, q)
)

df_p

# Pie Chart with Percentages
slices <- df_p$value
lbls <- df_p$group
pct <- round(slices/sum(slices)*100)
lbls <- paste(lbls, pct) # add percents to labels 
lbls <- paste(lbls,"%",sep="") # ad % to labels 
par(oma=c(0,0,0,0))
pie(slices,labels = lbls, col=c("red", "green"),
    main="Significant difference, if p < 5%", cex = 1.2)



# 2018-08-03 09:20:12 ------------------------------

setwd('C:/Users/srahee01/Documents/Github/site_raheems/content/R')
source('data.R')

# Demonstrate using R script to data transformation

library(dplyr)

df <- data.frame(
  name = c("John", "Arif","Samira"),
  sex = c(1, 1, 2),
  gpa = c(4, 3.9, 3.95)
)

# We would like to recode the sex variable to indicate Male for 1 and Female for 2

df
