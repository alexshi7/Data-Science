fatrat=read.csv(file.choose(), header = T)
View(fatrat)
attach(fatrat)


attach(rathipro)
View(rathipro)
View(fatrat)
boxplot(Gain[Protein == "Hi"]~Source[Protein == "Hi"], col = "deeppink")
help(par)
par(mfrow = c(1,2))
stripchart(Gain[Protein == "Hi"]~Source[Protein == "Hi"], vertical = "True", col = "deeppink")


n=tapply(Gain, Source, length) 
mean=tapply(Gain, Source, mean) 
SD=tapply(Gain, Source, sd) 

cbind(n, mean, SD) 
