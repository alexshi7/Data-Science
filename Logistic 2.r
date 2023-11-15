#Load MedGPA
gpa=read.csv(file.choose(), header=T)
attach(gpa)
names(gpa)
table(Acceptance)

#A GLM (generalized linear model) is a very flexible 
#and general statistical method for fitting models 
#to response-explanatory variable situations that do not 
#conform to the somewhat strict conditions of the linear 
#model or lm function. So, if error terms are non-normal 
#or if variance is not constant, one will often find the 
#glm function to be useful.

#We use the glm function with the family=binomial argument 
#to obtain the logistic regression model for predicting 
#the probability of acceptance to medical school (the 
#response variable) from the student's GPA (the explanatory 
#variable). Note: For the response variable we use the 
# numeric 0-1 variable Acceptance rather than the character 
#variable Accept. The glm function demands a numeric 
#response variable.

#Scatterplot
plot(GPA, MCAT)
abline(lm(MCAT~GPA))

gpa.glm1=glm(Acceptance~GPA, family=binomial)
Beta0=coef(gpa.glm1)[1]
Beta1=coef(gpa.glm1)[2]

#logit(Probability of Acceptance)=-19.21 + 5.45*GPA
#odds(Acceptance)=e^(-19.21 + 5.45*GPA)
#Probability of Acceptance=(e^(-19.21 + 5.45*GPA))/(1 +e^(-19.21 + 5.45*GPA)))

plot(GPA,Acceptance, ylab="Acceptance")

plot(GPA, jitter(Acceptance, amount=.05), ylab="Acceptance")
curve(exp(Beta0+Beta1*x)/(1+exp(Beta0+Beta1*x)),add=T)
#Jitter adds noise to a dataset in order to break "ties"
#In this case, without using jitter, our scatterplot
#would look like an ANOVA plot
#The "amount" controls the level of vertical variation
      