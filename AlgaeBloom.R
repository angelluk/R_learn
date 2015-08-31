install.packages("DMwR") # install package
library(DMwR)

head(algae)

summary(algae)   # statistics

hist(algae$mxPH,prob=T)  # examine prob of mxPH in probability scale

install.packages("car")   # load package car for nice graph tools
library(car)

par(mfrow=c(1,2))  # group of graph 

hist(algae$mxPH, prob=T,xlab='',main="Histogram of maximum pH value",ylim=0:1)  # basic histogramm
lines(density(algae$mxPH,na.rm = T))  # density of prob
rug(jitter(algae$mxPH))
qq.plot(algae$mxPH,main='Normal  QQ plot of maximum pH')

par(mfrow=c(1,1))  # restore 1 group of graph 

boxplot(algae$oPO4, ylab='oPO4')   # barplot foe oPO4
rug(jitter(algae$oPO4),side=2)
abline(h= mean(algae$oPO4, na.rm=T), lty= 2)  # line of mean

plot(algae$NH4, xlab='')
abline(h=mean(algae$NH4,na.rm=T),lty=1)
abline(h=mean(algae$NH4,na.rm=T) + sd(algae$NH4,na.rm=T),lty=2)
abline(h=median(algae$NH4,na.rm=T),lty=3)
identify(algae$NH4)

algae[!is.na(algae$NH4) & algae$NH4  > 19000 , ] # show big value and not NA

library(lattice)
bwplot(size ~ a1 , data=algae , ylab = 'River size' , xlab =  'Algal A1' ) # show multifactor graph

install.packages("Hmisc")
library(Hmisc)
bwplot( size ~ a1 , data = algae, panel = panel.bpplot , probs = seq(.01 ,.49, by=.01), datadensity = TRUE,  ylab ='River size', xlab = 'Algae A1')
