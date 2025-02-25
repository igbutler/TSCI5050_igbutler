#'---
#' title: "TSCI 5050: Simulating a Data Set"
#' author: 'Zeke Butler ^1^, Author Two ^1^'
#' abstract: |
#'  | Provide a summary of objectives, study design, setting, participants,
#'  | sample size, predictors, outcome, statistical analysis, results,
#'  | and conclusions.
#' documentclass: article
#' description: 'Manuscript'
#' clean: false
#' self_contained: true
#' number_sections: false
#' keep_md: true
#' fig_caption: true
#' output:
#'  html_document:
#'    toc: true
#'    toc_float: true
#'    code_folding: show
#' ---
#'
#+ init, echo=FALSE, message=FALSE, warning=FALSE
# init ----
# This part does not show up in your rendered report, only in the script,
# because we are using regular comments instead of #' comments
debug <- 0;nrows <-200;seed <-2112025
knitr::opts_chunk$set(echo=debug>-1, warning=debug>0, message=debug>0, class.output="scroll-20", attr.output='style="max-height: 150px; overflow-y: auto;"');

library(ggplot2); # visualisation
library(GGally);
library(rio);# simple command for importing and exporting
library(pander); # format tables
#library(printr); # set limit on number of lines printed
library(broom); # allows to give clean dataset
library(dplyr); #add dplyr library

options(max.print=500);
panderOptions('table.split.table',Inf); panderOptions('table.split.cells',Inf);
whatisthis <- function(xx){
  list(class=class(xx),info=c(mode=mode(xx),storage.mode=storage.mode(xx)
                              ,typeof=typeof(xx)))};
#
# import data ----
DataFile0 <- "Data/R test data.xlsx"
Dat0 <- import(DataFile0)
Dat0[1,]#Take the 1st row of the data set
Dat0[1,2]#Row 1, Column 2
Dat0[1,2:5]#Row 1, Columns 2 through 5
Dat0[1,c(2,2)]#Row 1 repeats Column 2 twice #c command is helpful for nonsequential numbers 
Dat0[c(1,1)]# Row 1 twice, all columns
Dat0[rep(1,6)]#Row 1, repeated 6 times, All Cols #Rep command is helpful for repeating large amounts of data
mutate(Dat0)
mutate(Dat0,'CD4 ABS'=c(12,15))
set.seed(seed) #To replicate the same vector of random numbers, set the set seed function where seed was previously defined on line 26
rnorm(200, mean = 900, sd = 250)

Dat0[rep(1,nrows),]
Dat1 <- Dat0[rep(1,nrows),]
#mutate(Dat1, 'CD4 ABS' =12)
#mutate(Dat1,'CD4 ABS'=rnorm(200, mean = 900, sd = 250))
mutate(Dat1,'CD4 ABS'=rnorm(n(), mean = 900, sd = 250))#n() is the number of rows in the current block of data, when you start sum
#Dat1 <- mutate(Dat1,'CD4 ABS'=rnorm(n(), mean = 900, sd = 250))
Dat1 <- mutate(Dat1
               ,'ID' = sprintf("EX-%04d",sample(1:1000,n()))#paste0 removes the space between data
               ,'CD4 ABS'=round(rnorm(n(), mean = 900, sd = 250))#the complete expression for round:rnorm(n(), mean = 900, sd = 250
               ,'WBC'=rnorm(n(), mean = 4.9, sd = .26)
               ,'RBC'=rnorm(n(), mean = 8.7, sd = .24)
               )
sprintf("name=%s, age=%d, percentile=%% %f", "Zeke", 39, 98.5)
#%s means string %d means integer, %f means fraction 