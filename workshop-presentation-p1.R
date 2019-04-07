## ----setup, include = FALSE----------------------------------------------
library(tidyverse)


## ----add-----------------------------------------------------------------
a <- 3
b <- 5

a + b * (exp(a)/b)



## ----plotExample, echo = FALSE, fig.width = 11---------------------------
data(mtcars)
with(mtcars, plot(mpg, hp, 
  xlab = "Miles Per Gallon", 
  ylab = "Horsepower",
  main = "Relation between Miles Per Gallon and Horsepower"))


## ----loadggplot, include = FALSE-----------------------------------------
library(ggplot2)
theme_set(theme_minimal())


## ----ggplotWarning2, warning = FALSE, fig.height = 5---------------------
ggplot(msleep, aes(sleep_rem, sleep_total)) + 
  geom_point()


## ----ggplotWarning1, fig.height = 6, warning = TRUE----------------------
ggplot(msleep, aes(sleep_rem, sleep_total)) + 
  geom_point()


## ----showErrors, fig.show = "hide", error = TRUE-------------------------
ggplot(msleep, aes(sleep, sleep_total)) + 
  geom_point()


## ----messages2, message = FALSE, fig.height = 4--------------------------
ggplot(msleep, aes(sleep_total)) +
  geom_histogram()


## ----messages1, fig.height = 5, message = TRUE---------------------------
ggplot(msleep, aes(sleep_total)) +
  geom_histogram()



## ----tinytex-----------------------------------------------
install.packages("tinytex")
tinytex::install_tinytex()

