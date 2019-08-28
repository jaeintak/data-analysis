Keywords <- data.frame(Freedom=vector(), Duty=vector())
n = 0
for (j in list.files()) {
file <- scan(file=j, what="char", quote=NULL)
n = n + 1
file <- gsub("^[[:punct:]]+|[[:punct:]]$", "", tolower(file))
Keywords[n, ] <- c(length(file[grep("^freedom", file)])/length(file), length(file[file=="duty"|file=="duties"])/length(file))
rownames(Keywords)[n] <- j
}
