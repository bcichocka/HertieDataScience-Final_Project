library(quanteda)
library(tidyverse)
library(readxl)
library(DBI)
library(RMySQL) 
library(httr)
library(jsonlite)
library(haven)
library(RColorBrewer)

View(chinaaid)

commonwords <- c("china", "Chinese", "china's", "project",
                 "signed","agreement", "government",
                 "million", "billion", "one", "two", "worth","used",
                 "also", "years", "month", 
                 stopwords("english"))

myDfm <- quanteda::dfm(corpus(chinaaid, text_field = "description"),
                       remove = commonwords,
                       remove_punct = TRUE,  
                       remove_numbers =TRUE
                       ) 

wordcloud <- quanteda::textplot_wordcloud(myDfm,
                             min.freq = 450,
                             random.order = FALSE, 
                             rot.per = .25, 
                             colors = RColorBrewer::brewer.pal(8,"Dark2")) 


