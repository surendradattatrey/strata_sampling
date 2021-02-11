rm(list=ls())
try(require(text2vec) || install.packages("text2vec"))
try(require(data.table) || install.packages("data.table"))
try(require(stringr) || install.packages("stringr"))
try(require(tm) || install.packages("tm"))
try(require(RWeka) || install.packages("RWeka"))
try(require(tokenizers) || install.packages("tokenizers"))
try(require(slam) || install.packages("slam"))
try(require(wordcloud) || install.packages("wordcloud"))
try(require(ggplot2) || install.packages("ggplot2"))
try(require(data.table) || install.packages("data.table"))

library(text2vec)
library(data.table)
library(stringr)
library(tm)
library(RWeka)
library(tokenizers)
library(slam)
library(wordcloud)
library(ggplot2)
library(data.table)
library(dplyr)

#install.packages("dplyr", dependencies = TRUE)

file.spglobal=read.csv("C:/Users/surendra_dattatrey/OneDrive - S&P Global/Desktop/S&P Data/Sampling/Stra Sampling/sample_file.csv")

set.seed(1)
d <- data.frame(file.spglobal)

library(dplyr)

#obtain stratified sample
strat_sample <- d %>%
  group_by(EmployeeID, Country, Grade, GradeGroup, Gender, Race)  %>% 
  #sample_n(size=6100)
  #sample_n(0.3, replace = FALSE) %>% 
  #inner_join(d, .)
  sample_frac(0.3)

#find frequency of students from each grade
table(strat_sample$Grade)

strat_sample <- d %>% ungroup() %>% sample_n(6807)

write.csv(strat_sample, "C:/Users/surendra_dattatrey/OneDrive - S&P Global/Desktop/S&P Data/Sampling/sample_data.csv")




