files.list <- list.files()
p17 <- vector()
p18 <- vector()
p19 <- vector()
p20 <- vector()

for(i in grep("^17", files.list, value =T)){
file <- scan(file = i, what = "char", quote = NULL)
p17 <- c(p17, file)
}

for(i in grep("^18", files.list, value =T)){
file <- scan(file = i, what = "char", quote = NULL)
p18 <- c(p18, file)
}

for(i in grep("^19", files.list, value =T)){
file <- scan(file = i, what = "char", quote = NULL)
p19 <- c(p19, file)
}

for(i in grep("^20", files.list, value =T)){
file <- scan(file = i, what = "char", quote = NULL)
p20 <- c(p20, file)
}