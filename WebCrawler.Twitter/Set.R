library("base64enc")
library("RCurl")
library("twitteR")
library("ROAuth")
library(wordcloud)
library(plyr)
library(tm)
options(max.print=100000000)
reqURL <- "https://api.twitter.com/oauth/request_token"
accessURL <- "https://api.twitter.com/oauth/access_token"
authURL <- "https://api.twitter.com/oauth/authorize"

consumerKey <- "1lBMCWK1bDUA5YIu6QaMLArLM"
consumerSecret <- "IwM2gx00s6ZKbuI2dIrkLLFdQiPOTJIJCNSbwijQmsRaaGqsuM"
accesstoken <- "1699685276-BB1ZVTP4wpr8H57BHfsqqpEbdRRoWQRU527gUvg"
accesstokensecret <- "Z1fLkhNRQF5d6DFtb3g5aNjvcSHU9xoVnoVfsi2itleD1"

cred <- OAuthFactory$new(consumerKey=consumerKey,
                         consumerSecret=consumerSecret,
                         requestURL="https://api.twitter.com/oauth/request_token",
                         accessURL="https://api.twitter.com/oauth/access_token",
                         authURL="https://api.twitter.com/oauth/authorize")
cred$handshake(cainfo = system.file("CurlSSL", "cacert.pem", package = "RCurl"))   
setup_twitter_oauth(consumerKey,consumerSecret,accesstoken,accesstokensecret)

keyword <- enc2utf8("@¹®ÀçÀÎ") 
twitter <-  searchTwitter(keyword,since='2017-01-01',until='2017-05-08', lang="ko",geocode='35.874,128.246,400km',n=100000) 
twitter.df <- twListToDF(twitter) 
names(twitter.df)
twitter.df <- twitter.df[twitter.df$retweetCount!=0,]
twitter.text <- twitter.df$text  

twitter.text <- gsub("\n", "", twitter.text)
twitter.text <- gsub("\r", "", twitter.text)
twitter.text <- gsub("RT", "", twitter.text)
twitter.text <- gsub("http", "", twitter.text)
twitter.text <- gsub("/", "", twitter.text)

sink('moon.txt')
twitter.text
sink()

keyword <- enc2utf8("@¾ÈÃ¶¼ö") 
twitter <-  searchTwitter(keyword,since='2017-03-10',until='2017-05-08', lang="ko",geocode='35.874,128.246,400km',n=100000) 
twitter.df <- twListToDF(twitter) 
names(twitter.df)
twitter.df <- twitter.df[twitter.df$retweetCount!=0,]
twitter.text <- twitter.df$text  

twitter.text <- gsub("\n", "", twitter.text)
twitter.text <- gsub("\r", "", twitter.text)
twitter.text <- gsub("RT", "", twitter.text)
twitter.text <- gsub("http", "", twitter.text)
twitter.text <- gsub("/", "", twitter.text)

sink('v3.txt')
twitter.text
sink()

keyword <- enc2utf8("@È«ÁØÇ¥") 
twitter <-  searchTwitter(keyword,since='2017-03-10',until='2017-05-08', lang="ko",geocode='35.874,128.246,400km',n=100000) 
twitter.df <- twListToDF(twitter) 
names(twitter.df)
twitter.df <- twitter.df[twitter.df$retweetCount!=0,]
twitter.text <- twitter.df$text  

twitter.text <- gsub("\n", "", twitter.text)
twitter.text <- gsub("\r", "", twitter.text)
twitter.text <- gsub("RT", "", twitter.text)
twitter.text <- gsub("http", "", twitter.text)
twitter.text <- gsub("/", "", twitter.text)

sink('red.txt')
twitter.text
sink()


