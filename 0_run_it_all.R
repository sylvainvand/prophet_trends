## Libraries
library(lubridate)
library(dplyr)
library(prophet)
library(plotly)
library(here)
library(tidyr)
library(quantmod)
library(readr)
library(gtrendsR)
library(tidytext)
library(ggplot2)

# list  functions in 'functions'
my_R_files <- list.files(path='functions',
                         pattern = '*.R',
                         full.names=TRUE)

# Load all functions in R
sapply(my_R_files, source)

# Import data script
source('1_import_data.R')

# run models and report results
source('2_run.R')
