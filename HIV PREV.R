# HIV PREV 
# Set working directory
setwd("C:/Users/user/Documents/R/HIV-PREV")

#LOAD LIBRARIES
pacman::p_load(
  rio,        # importing data  
  here,       # relative file pathways  
  janitor,    # data cleaning and tables
  lubridate,  # working with dates
  epikit,     # age_categories() function
  tidyverse,   # data management and visualization
  naniar   # missing data
)

#Import Data set
hiv <- import('table-2014-adult-hiv-prevalence-rate-by-county-csv-1 (1).csv')
names(hiv)

#missing data %
pct_miss(hiv)
##3.723404

#Visualize distribution of HIV prevalence
hiv %>%
  ggplot(aes(adult_15_hiv_prevalence, county_name))+
  geom_col(fill = 'lightblue')

