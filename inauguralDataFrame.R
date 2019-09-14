files.list <- list.files()
for(i in files.list){
TEXT <- scan(file = i, what = "char", quote = NULL)
TEXT <- gsub("^[[:punct:]]+|[[:punct:]]+$", "", tolower(file))
}

Freq.TEXT <- sort(table(TEXT), T)
Freq.Data <- data.frame(Freq.TEXT)
Freq.Data <- data.frame(row.names=Freq.Data$Data$TEXT, Freq = Freq.data$Freq)
Freq.Data <- data.frame(Freq.Data, Rel.Freq = Freq.Data$Freq / sum(Freq.Data$Freq))


