DATA_PATH = './datas'

downloadedFilePath = paste(DATA_PATH, "final", sep = "/")

SK.download <- function(){
    if(!file.exists(DATA_PATH)){
        dir.create(DATA_PATH)
    }

    localPath <- paste(DATA_PATH, "data.zip", sep = "/")
    sourceUrl <- "https://d396qusza40orc.cloudfront.net/dsscapstone/dataset/Coursera-SwiftKey.zip"
    download.file(sourceUrl, localPath, method="curl")
to
    unzip(localPath, exdir = DATA_PATH)
}

SK.file <- function(locale, channel){
    filePath <- SwiftKey.filePath(locale, channel)
    if(!file.exists(filePath)){
        SK.download
    }

    file(filePath)
}

SK.filePath <- function(locale, channel){
    paste(downloadedFilePath, locale, SK.fileName(locale, channel), sep = "/")
}

SK.fileName <- function(locale, channel){
    if(!SK.checkChannel(channel) || !SK.checkLocale(locale)){
        stop('It is not valid channel or locale')
    }
    paste(locale, channel, "txt", sep = ".")
}

SK.checkLocale <- function(locale){
    allowedLocales <- c("de_DE", "en_US", "fi_FI", "ru_RU")
    locale %in% allowedLocales
}

SK.checkChannel <- function(channel){
    allowedChannel <- c("blogs", "news", "twitter")
    channel %in% allowedChannel
}
