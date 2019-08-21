#this scripts creates the emotion data frame from twitter tweets with keywords "pemilu legislative"
#I used the latest data updated in twitter
#this sentiment analysis used official twitter API's to collect the data
#https://developer.twitter.com/en/apps/16630729

library(twitteR)
library(RSentiment)
#library(sentiment)
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
some_txt = sapply(some_tweets, function(x) x$getText())
some_txt = gsub("(RT|via)((?:\\b\\W*@\\w+)+)", "", some_txt)
some_txt = gsub("@\\w+", "", some_txt)
some_txt = gsub("[[:punct:]]", "", some_txt)
some_txt = gsub("[[:digit:]]", "", some_txt)
some_txt = gsub("http\\w+", "", some_txt)
some_txt = gsub("[ \t]{2,}", "", some_txt)
some_txt = gsub("^\\s+|\\s+$", "", some_txt)
try.error = function(x)
{
  y = NA
  try_error = tryCatch(tolower(x), error=function(e) e)
  if (!inherits(try_error, "error"))
    y = tolower(x)
  return(y) }
some_txt = sapply(some_txt, try.error)
some_txt = some_txt[!is.na(some_txt)]
names(some_txt) = NULL
class_emo = classify_emotion(some_txt, algorithm="bayes", prior=1.0)
emotion = class_emo[,7]
emotion[is.na(emotion)] = "unknown"
class_pol = classify_polarity(emotion, algorithm="bayes")
polarity = class_pol[,4]

#contains tweets about the keyword"pemilu legislatif"
sentiment_df = data.frame(text=some_txt, emotion=emotion,
                     polarity=polarity, stringsAsFactors=FALSE)
sentiment_df = within(sentiment_df,
                 emotion <- factor(emotion, levels=names(sort(table(emotion), decreasing=TRUE))))


save(sentiment_df, file = "data/sentiment_df.rdata")