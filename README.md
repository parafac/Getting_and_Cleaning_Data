---
title: "README"
output: html_document
---

### Introduction

This repository contains the input/output data, document (README.md and CodeBook.md), and R code (run_analysis.R) for the assignment of the DataScience track's "Getting and Cleaning Data" course at Coursera.

The purpose of this project is to demonstrate the ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. 

### Files and Instructions

README.md - this file.

`run_analysis.R` - the script that was written for this work. It can be loaded in R/Rstudio and executed without any additional input or parameters. It performs the following functions

1. Download data in zip format from source URL, unzip the file in the current directory. The unzipped data can be located in the folder './UCI HAR Dataset/'.
2. Perform all analysis steps per project instruction (see CodeBook.md for details) 
3. Write the tidy data to tidy_data.txt in the current directory 

CodeBook.md - describes the data, the variables, and the work that has been performed to obtain a tidy data set for later use.

tidy_data.txt - the output from the execution of 'run_analysis.R', that stores the mean of each measurement for each subject and each activity. This tidy data set can be loaded into R using the following command.


```{r}
tidyData <- read.table('./tidy_data.txt', header = TRUE)
```



### Data Set

The data for the project was downloaded from

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

A full description is available at the site where the data was originally posted:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 


### Credit and Citation of Data Set

- Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

