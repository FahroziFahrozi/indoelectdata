#this scripts creates the emotion data frame from twitter tweets with keywords "pemilu legislative"
#I used the latest data updated in twitter
#this sentiment analysis used official twitter API's to collect the data
#https://developer.twitter.com/en/apps/16630729

library(twitteR)
library(RSentiment)
library(sentiment)
library(tm)
library(NLP)
library(Rstem)
library(plyr)
library(ggplot2)
library(wordcloud)
library(RColorBrewer)

#use twitter APIs to get the data
api_key <-""
api_secret<-""
access_token<-""
access_token_secret<-""

#remove the hastags and other twitter handles
setup_twitter_oauth(api_key, api_secret,access_token, access_token_secret)
some_tweets = searchTwitter("pemilu legislatif", n=10000, lang="id")

save(some_tweets, file = "data/some_tweets.rdata")
