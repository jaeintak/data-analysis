library(wordcloud)
wordcloud(TEXT.Freq$TEXT, TEXT.Freq$Freq, scale = c(1.5, 0.9), max.words = 100,
col = brewer.pal(8, "Dark2"))