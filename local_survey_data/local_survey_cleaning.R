library(tidyverse)
library(janitor)
library(stringr)

survey <- read_csv("local_survey.csv") %>% 
  clean_names()

survey %>% 
  group_by(scottish_health_survey_indicator) %>% 
  summarise()

# Alcohol Consumption

alcohol_consumption <- survey %>% 
  filter(str_detect(scottish_health_survey_indicator, "Alcohol"))

alcohol_consumption

# Cardiovascular Condition

cardiovascular_condition <- survey %>% 
  filter(str_detect(scottish_health_survey_indicator, "cardiovascular"))

cardiovascular_condition

# Asthma

asthma <- survey %>% 
  filter(str_detect(scottish_health_survey_indicator, "asthma"))

asthma

# E-cigarette

e_cig <- survey %>% 
  filter(str_detect(scottish_health_survey_indicator, "cigarette"))

e_cig

# Fruit and Veg

fruit_and_veg <- survey %>% 
  filter(str_detect(scottish_health_survey_indicator, "Fruit"))

fruit_and_veg

# General Health

general_health <- survey %>% 
  filter(str_detect(scottish_health_survey_indicator, "General"))

general_health

# Life Satisfaction

life_satisfaction <- survey %>% 
  filter(str_detect(scottish_health_survey_indicator, "satisfaction"))

life_satisfaction

# Long-term Illness

long_term_illness <- survey %>% 
  filter(str_detect(scottish_health_survey_indicator, "illness"))

long_term_illness

# Mental Wellbeing

mental_wellbeing <- survey %>% 
  filter(str_detect(scottish_health_survey_indicator, "wellbeing"))

mental_wellbeing

# Obesity

obesity <- survey %>% 
  filter(str_detect(scottish_health_survey_indicator, "Obesity"))

obesity

# Overweight

overweight <- survey %>% 
  filter(str_detect(scottish_health_survey_indicator, "Overweight"))

overweight

# Provide help

provide_help <- survey %>% 
  filter(str_detect(scottish_health_survey_indicator, "Provide"))

provide_help

# Self-assessed General Health

self_assessed <- survey %>% 
  filter(str_detect(scottish_health_survey_indicator, "Self"))

self_assessed

# Smoking Status

smoking_status <- survey %>% 
  filter(str_detect(scottish_health_survey_indicator, "Smoking"))

smoking_status

# Summary Activity

summary_activity <- survey %>% 
  filter(str_detect(scottish_health_survey_indicator, "Summary"))

summary_activity


