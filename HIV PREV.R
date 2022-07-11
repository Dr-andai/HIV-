## HIV PREV 2021

# More than 1.4 million Kenyans are living with HIV as of 2021. 
# Children aged 0-4 years accounted for over 78,000 of the infected population, 
# with the vulnerability of adolescent girls & young women attributed to poverty, 
# lack of education and work opportunities.

# Set working directory
setwd("C:/Users/user/Documents/R/HIV-PREV")

#LOAD LIBRARIES
pacman::p_load(
  rio,        # importing data  
  here,       # relative file pathways  
  janitor,    # data cleaning and tables
  lubridate,  # working with dates
  tidyverse,   # data management and visualization
  naniar   # missing data
)

#Import Data set
hiv <- import('table-2014-adult-hiv-prevalence-rate-by-county-csv-1 (1).csv')
names(hiv)

#missing data %
pct_miss(hiv)
##3.723404

#Summary stats on Adult HIV prevalence
summary(hiv$adult_15_hiv_prevalence)
## results;  Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
##          0.200   3.350   4.300   5.713   5.850  25.700 

#Visualize distribution of HIV prevalence
hiv %>%
  ggplot(aes(adult_15_hiv_prevalence, county_name))+
  geom_col(fill = 'lightblue')
## Homa Bay with Highest Prevalence

#New HIV Infections, Adults >= 15 years
hiv %>% 
  ggplot(aes(new_hiv_infections_adults_15, county_name))+
  geom_col(fill='darkred')

sum(hiv$new_hiv_infections_adults_15)
# 88,632 New Adult Infections 
# Adolescents and young adults aged 15 -29 contribute to 61% 
# of all new adult HIV infections.

#Male Vs Female Prevalence
genderx <- hiv %>%
  pivot_longer(cols = c('hiv_prevalence_men', 'hiv_prevalence_women'),
               names_to = "gender",
               values_to = "prevalence")
genderx

ggplot(genderx, aes(gender, prevalence, fill=gender))+
  geom_boxplot()+
  theme(legend.position = "none")+   # remove legend (redundant)
  labs( title = "HIV Prevalence boxplot by gender") 

