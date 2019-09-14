#1
Keywords <- data.frame(Freedom=vector(), Duty=vector())
n = 0
for (j in list.files())
{
file <- scan(file=j, what="char", quote=NULL)
n = n + 1
file <- gsub("^[[:punct:]]+|[[:punct:]]+$", "", 
              tolower(file)) 
Keywords[n, ] <- c(length(file[grep("^freedom", file)])/length(file),
length(file[file=="duty"|file=="duties"])/length(file))
rownames(Keywords)[n] <- j
}


#2
head(Keywords)
str(Keywords)
summary(Keywords)


#3
boxplot(Keywords, main="Freedom vs. Duty",
        col = c("lightblue", "darkorange"))

#4
shapiro.test(Keywords$Freedom)
shapiro.test(Keywords$Duty)


#5
var.test(Keywords$Freedom, Keywords$Duty)


#6
t.test(Keywords$Freedom, Keywords$Duty, var.equal=T)
t.test(Keywords$Freedom, Keywords$Duty, var.equal=F)


#7
wilcox.test(Keywords$Freedom, Keywords$Duty)


#8
plot(substr(rownames(Keywords), 1, 4), 
Keywords$Freedom, type="l", main="Freedom vs. Duty",
xlab="년도", ylab="상대빈도")
points(substr(rownames(Keywords), 1, 4), 
Keywords$Duty, type="l", lty=2)


#9
Keywords <- data.frame(Stage=vector(), Freedom=vector(), Duty=vector())
n = 0
for (j in list.files())
{
file <- scan(file=j, what="char", quote=NULL)
n = n + 1
file <- gsub("^[[:punct:]]+|[[:punct:]]$", "", 
              tolower(file)) 
Year <- as.numeric(substr(j, 1, 4))
if (Year<=1860)
{Stage <- "StageI"}
else if (Year<=1940)
{Stage <- "StageII"}
else
{Stage <- "StageIII"}
Keywords[n, ] <- c(Stage,
length(file[grep("^freedom", file)])/length(file),
length(file[file=="duty"|file=="duties"])/length(file))
rownames(Keywords)[n] <- j
}
Keywords$Stage <- as.factor(Keywords$Stage)
Keywords$Freedom <- as.numeric(Keywords$Freedom)
Keywords$Duty <- as.numeric(Keywords$Duty)


#10
head(Keywords)
str(Keywords)
summary(Keywords)


#11
par(mfrow=c(1,2))
boxplot(Freedom~Stage, data=Keywords, main = "Freedom",
        col = c("blue", "red", "orange"))
boxplot(Duty~Stage, data=Keywords, main = "Duty",
        col = c("blue", "red", "orange"))


#12
shapiro.test(residuals(lm(Freedom~Stage, data=Keywords)))
shapiro.test(residuals(lm(Duty~Stage, data=Keywords)))


#13
bartlett.test(Freedom~Stage, data=Keywords)
bartlett.test(Duty~Stage, data=Keywords)


#14
summary(aov(Freedom~Stage, data=Keywords))
summary(aov(Duty~Stage, data=Keywords))


#15
TukeyHSD(aov(Freedom~Stage, data=Keywords))
TukeyHSD(aov(Duty~Stage, data=Keywords))


#16
kruskal.test(Freedom~Stage, data=Keywords)
kruskal.test(Duty~Stage, data=Keywords)


#17
pairwise.wilcox.test(Keywords$Freedom, Keywords$Stage)
pairwise.wilcox.test(Keywords$Duty, Keywords$Stage)



#18
plot(Keywords$Freedom, Keywords$Duty, 
xlab="Freedom", ylab="Duty")

#19
shapiro.test(residuals(lm(Duty~Freedom, data=Keywords)))


#20
cor.test(Keywords$Freedom, Keywords$Duty, method="pearson")
cor.test(Keywords$Freedom, Keywords$Duty, method="kendall")


#21
Keywords <- data.frame(Stage=vector(), Freedom=vector(), Duty=vector())
n = 0
for (j in list.files())
{
file <- scan(file=j, what="char", quote=NULL)
n = n + 1
file <- gsub("^[[:punct:]]+|[[:punct:]]$", "", 
              tolower(file)) 
Year <- as.numeric(substr(j, 1, 4))
if (Year<=1860)
{Stage <- "StageI"}
else if (Year<=1940)
{Stage <- "StageII"}
else
{Stage <- "StageIII"}
Keywords[n, ] <- c(Stage,
length(file[grep("^freedom", file)]),
length(file[file=="duty"|file=="duties"]))
rownames(Keywords)[n] <- j
}
Keywords$Stage <- as.factor(Keywords$Stage)
Keywords$Freedom <- as.numeric(Keywords$Freedom)
Keywords$Duty <- as.numeric(Keywords$Duty)


#22
Cross.Tab <- xtabs(cbind(Freedom, Duty)~Stage, data=Keywords)
Cross.Tab <- as.data.frame.matrix(Cross.Tab)
Cross.Tab


#23
chisq.test(Cross.Tab)
assocplot(as.matrix(Cross.Tab))


#24
TDM <- data.frame(Words=vector())
for (i in list.files())
{
file <- read.delim(file=i, sep='\t', 
header= T, row.names=1, quote=NULL)
colnames(file)[1]<- 'Words'
TDM <- merge(TDM, file,
by.x="Words", by.y= 'Words', all=T)
colnames(TDM)[length(TDM)]<- i
}
TDM[is.na(TDM)]<-0
head(TDM)

#25
TDM <- data.frame(row.names=TDM$Words, TDM[-1])
head(TDM)


#26
library(wordcloud)
comparison.cloud(TDM, random.order=F,
scale=c(2, 0.8), max.word=300,
colors=brewer.pal(8, "Dark2"), title.size=1.2)


#27
plot(hclust(dist(scale(t(TDM)))))
