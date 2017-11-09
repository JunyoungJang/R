library("base64enc")
library("RCurl")
library("twitteR")
library("ROAuth")
library(KoNLP)
library(wordcloud)
library(plyr)
library(tm)
library(WriteXLS)

reqURL <- "https://api.twitter.com/oauth/request_token"
accessURL <- "https://api.twitter.com/oauth/access_token"
authURL <- "https://api.twitter.com/oauth/authorize"

consumerKey <- "29DngJlyQB27e6QGocnEKIL3l"
consumerSecret <- "sIHbF5cpUNSNo8d5PwWW4AudydKJEBtOeLC3sc9jAYhKRjGM4E"
accesstoken <- "1699685276-fzlIhqfSjmjLviRxDj4IbEXKytuw8LmrwRZQ7Id"
accesstokensecret <- "irOgq3tVy5i2X84AZr2ySMRRthiRVWKmsb4ChmgkMijcl"

cred <- OAuthFactory$new(consumerKey=consumerKey,
                         consumerSecret=consumerSecret,
                         requestURL="https://api.twitter.com/oauth/request_token",
                         accessURL="https://api.twitter.com/oauth/access_token",
                         authURL="https://api.twitter.com/oauth/authorize")
cred$handshake(cainfo = system.file("CurlSSL", "cacert.pem", package = "RCurl"))   
setup_twitter_oauth(consumerKey,consumerSecret,accesstoken,accesstokensecret)

keyword <- enc2utf8("È«ÁØÇ¥") 
twitter <-  searchTwitter(keyword,since='2017-03-10',until='2017-05-08', lang="ko",geocode='35.874,128.246,400km',n=10000) 
twitter.df <- twListToDF(twitter) 
names(twitter.df)
twitter.df <- twitter.df[twitter.df$retweetCount!=0,]
twitter.text <- twitter.df$text  

twitter.text <- gsub("\n", "", twitter.text)
twitter.text <- gsub("\r", "", twitter.text)
twitter.text <- gsub("RT", "", twitter.text)
twitter.text <- gsub("http", "", twitter.text)
twitter.text <- gsub("/", "", twitter.text)

sink('Red.txt')
twitter.text
sink()
