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

