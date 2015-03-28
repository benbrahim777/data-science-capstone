# http://cran.r-project.org/web/packages/tm/vignettes/tm.pdf

library("tm")
library("RWeka")

options(mc.cores = 1) # SOME ISSUE ON OSX

SK.normalize <- function(texts){
    docs <- VCorpus(VectorSource(texts))
    # Eliminate whitespace
    docs <- tm_map(docs, stripWhitespace)
    # Eliminate punctuations
    docs <- tm_map(docs, removePunctuation)
    # Convert to lowercase
    docs <- tm_map(docs, content_transformer(tolower))
    docs
}

SK.bigramTokenize <- function(x){
    TermDocumentMatrix(x, control = list(tokenize = SK.bigramTokenizer))
}

SK.trigramTokenize <- function(x){
    TermDocumentMatrix(x, control = list(tokenize = SK.trigramTokenizer))
}

SK.bigramTokenizer <- function(x){
    NGramTokenizer(x, Weka_control(min = 2, max = 2))
}

SK.trigramTokenizer <- function(x){
    NGramTokenizer(x, Weka_control(min = 3, max = 3))
}
