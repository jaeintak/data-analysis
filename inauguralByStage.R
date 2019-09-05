files.list <- list.files()
stage1<- vector()
stage2<- vector()
stage3<- vector()

for(i in grep("^17", files.list, value = T)){
file<- scan(file = i, what = "char", quote = NULL)
stage1 <- c(stage1, file)
}

for(i in grep("^180", files.list, value = T)){
file<- scan(file = i, what = "char", quote = NULL)
stage1 <- c(stage1, file)
}

for(i in grep("^181", files.list, value = T)){
file<- scan(file = i, what = "char", quote = NULL)
stage1 <- c(stage1, file)
}

for(i in grep("^182", files.list, value = T)){
file<- scan(file = i, what = "char", quote = NULL)
stage1 <- c(stage1, file)
}

for(i in grep("^183", files.list, value = T)){
file<- scan(file = i, what = "char", quote = NULL)
stage1 <- c(stage1, file)
}

for(i in grep("^184", files.list, value = T)){
file<- scan(file = i, what = "char", quote = NULL)
stage1 <- c(stage1, file)
}

for(i in grep("^185", files.list, value = T)){
file<- scan(file = i, what = "char", quote = NULL)
stage1 <- c(stage1, file)
}

for(i in grep("^186", files.list, value = T)){
file<- scan(file = i, what = "char", quote = NULL)
stage2 <- c(stage2, file)
}

for(i in grep("^187", files.list, value = T)){
file<- scan(file = i, what = "char", quote = NULL)
stage2 <- c(stage2, file)
}

for(i in grep("^188", files.list, value = T)){
file<- scan(file = i, what = "char", quote = NULL)
stage2 <- c(stage2, file)
}

for(i in grep("^189", files.list, value = T)){
file<- scan(file = i, what = "char", quote = NULL)
stage2 <- c(stage2, file)
}

for(i in grep("^190", files.list, value = T)){
file<- scan(file = i, what = "char", quote = NULL)
stage2 <- c(stage2, file)
}

for(i in grep("^191", files.list, value = T)){
file<- scan(file = i, what = "char", quote = NULL)
stage2 <- c(stage2, file)
}

for(i in grep("^192", files.list, value = T)){
file<- scan(file = i, what = "char", quote = NULL)
stage2 <- c(stage2, file)
}

for(i in grep("^193", files.list, value = T)){
file<- scan(file = i, what = "char", quote = NULL)
stage2 <- c(stage2, file)
}

for(i in grep("^194", files.list, value = T)){
file<- scan(file = i, what = "char", quote = NULL)
stage3 <- c(stage3, file)
}
for(i in grep("^195", files.list, value = T)){
file<- scan(file = i, what = "char", quote = NULL)
stage3 <- c(stage3, file)
}

for(i in grep("^196", files.list, value = T)){
file<- scan(file = i, what = "char", quote = NULL)
stage3 <- c(stage3, file)
}
for(i in grep("^197", files.list, value = T)){
file<- scan(file = i, what = "char", quote = NULL)
stage3 <- c(stage3, file)
}
for(i in grep("^198", files.list, value = T)){
file<- scan(file = i, what = "char", quote = NULL)
stage3 <- c(stage3, file)
}
for(i in grep("^199", files.list, value = T)){
file<- scan(file = i, what = "char", quote = NULL)
stage3 <- c(stage3, file)
}
for(i in grep("^20", files.list, value = T)){
file<- scan(file = i, what = "char", quote = NULL)
stage3 <- c(stage3, file)
}

Keywords <- data.frame(Stage = vector(), Freedom=vector(), Duty=vector())
n = 0
for (j in grep("^17|^180|^181|^182|^183|^184|^185", list.files(), value = T)) {
file <- scan(file=j, what="char", quote=NULL)
n = n + 1
file <- gsub("^[[:punct:]]+|[[:punct:]]$", "", tolower(file))
Keywords[n, ] <- c("Stage1", length(file[grep("^freedom", file)])/length(file), length(file[file=="duty"|file=="duties"])/length(file))
rownames(Keywords)[n] <- j
}

for (j in grep("^186|^187|^188|^189|^190|^191|^192|^193", list.files(), value = T)) {
file <- scan(file=j, what="char", quote=NULL)
n = n + 1
file <- gsub("^[[:punct:]]+|[[:punct:]]$", "", tolower(file))
Keywords[n, ] <- c("Stage2", length(file[grep("^freedom", file)])/length(file), length(file[file=="duty"|file=="duties"])/length(file))
rownames(Keywords)[n] <- j
}

for (j in grep("^194|^195|^196|^197|^198|^199|^20", list.files(), value = T)) {
file <- scan(file=j, what="char", quote=NULL)
n = n + 1
file <- gsub("^[[:punct:]]+|[[:punct:]]$", "", tolower(file))
Keywords[n, ] <- c("Stage3", length(file[grep("^freedom", file)])/length(file), length(file[file=="duty"|file=="duties"])/length(file))
rownames(Keywords)[n] <- j
}

Keywords$Stage <- as.factor(Keywords$Stage)
Keywords$Freedom <- as.numeric(Keywords$Freedom)
Keywords$Duty <- as.numeric(Keywords$Duty)






