
data(mtcars)
str(mtcars)

#transform some of the variables into factor form
mtcars$cyl  <- factor(mtcars$cyl)
mtcars$vs   <- factor(mtcars$vs)
mtcars$am   <- factor(mtcars$am,labels=c("Auto","Man"))
mtcars$gear <- factor(mtcars$gear)
mtcars$carb <- factor(mtcars$carb)

mpgAuto <- subset(mtcars, mtcars$am == "Auto", select = c(mpg))
mpgMan <- subset(mtcars, mtcars$am == "Man", select = c(mpg))
t.test(mpgAuto$mpg, mpgMan$mpg)
fit <- lm(mpg ~ am, data = mtcars)
fit2 <- lm(mpg ~ am+cyl, data = mtcars)
fit3 <- lm(mpg ~ am+cyl+disp, data = mtcars)
fit4 <- lm(mpg ~ am+cyl+disp+hp, data = mtcars)
fit5 <- lm(mpg ~ am+cyl+disp+hp+wt, data = mtcars)


summary(fit)
pairs(mpg ~ ., data = mtcars)

#library(psych) 
#pairs.panels(mtcars)
# Diagnostic plots
par(mfrow = c(2,2))
plot(fit5)



