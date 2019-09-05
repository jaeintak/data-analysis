files.list <- list.files()
stage1<- vector()
stage2<- vector()
stage3<- vector()

for(i in grep("^17|^180|^181|^182|^183|^184|^185", files.list, value = T)){
file<- scan(file = i, what = "char", quote = NULL)
stage1 <- c(stage1, file)
}

for(i in grep("^186|^187|^188|^189|^190|^191|^192|^193", files.list, value = T)){
file<- scan(file = i, what = "char", quote = NULL)
stage2 <- c(stage2, file)
}

for(i in grep("^194|^195|^196|^197|^198|^199|^20", files.list, value = T)){
file<- scan(file = i, what = "char", quote = NULL)
stage3 <- c(stage3, file)
}






