DATA_PATH = './datas'

downloadedFilePath = paste(DATA_PATH, "final", sep = "/")

SwiftyKey.download <- function(){
    if(!file.exists(DATA_PATH)){
        dir.create(DATA_PATH)
    }

    localPath <- paste(DATA_PATH, "data.zip", sep = "/")
    sourceUrl <- "https://d396qusza40orc.cloudfront.net/dsscapstone/dataset/Coursera-SwiftKey.zip"
    download.file(sourceUrl, localPath, method="curl")
to
    unzip(localPath, exdir = DATA_PATH)
}

SwiftyKey.file <- function(locale, channel){
    filePath <- SwiftKey.filePath(locale, channel)
    if(!file.exists(filePath)){
        SwiftyKey.download
    }

    file(filePath)
}

SwiftKey.filePath <- function(locale, channel){
    paste(downloadedFilePath, locale, SwiftyKey.fileName(locale, channel), sep = "/")
}

SwiftyKey.fileName <- function(locale, channel){
    if(!SwiftyKey.checkChannel(channel) || !SwiftyKey.checkLocale(locale)){
        stop('It is not valid channel or locale')
    }
    paste(locale, channel, "txt", sep = ".")
}

SwiftyKey.checkLocale <- function(locale){
    allowedLocales <- c("de_DE", "en_US", "fi_FI", "ru_RU")
    locale %in% allowedLocales
}

SwiftyKey.checkChannel <- function(channel){
    allowedChannel <- c("blogs", "news", "twitter")
    channel %in% allowedChannel
}
