library(tidyverse)
library(janitor)
library(stringr)

survey <- read_csv("data_raw/local_survey.csv") %>% 
  clean_names() %>% 
  filter(measurement == "Percent")

survey %>% 
  group_by(scottish_health_survey_indicator) %>% 
  summarise()

survey %>% 
  group_by(feature_code) %>% 
  summarise()

health_board_id <- read.csv("data_clean/health_board_id.csv")

survey <- left_join(survey, health_board_id, by = c("feature_code" = "hb_code"))

survey <- survey %>% 
  drop_na()

# Alcohol Consumption

alcohol <- survey %>% 
  filter(str_detect(scottish_health_survey_indicator, "Alcohol")) %>% 
  rename(alcohol_consumption = scottish_health_survey_indicator) %>% 
  mutate(alcohol_consumption = str_sub(alcohol_consumption, 22))

alcohol

# Cardiovascular Condition

cardiovascular <- survey %>% 
  filter(str_detect(scottish_health_survey_indicator, "cardiovascular")) %>% 
  rename(cardiovascular_condition = scottish_health_survey_indicator) %>% 
  mutate(cardiovascular_condition = str_sub(cardiovascular_condition, 31))

cardiovascular

# Asthma

asthma <- survey %>% 
  filter(str_detect(scottish_health_survey_indicator, "asthma")) %>% 
  rename(doctor_diagnosed_asthma = scottish_health_survey_indicator) %>% 
  mutate(doctor_diagnosed_asthma = str_sub(doctor_diagnosed_asthma, 26))

asthma

# E-cigarette

e_cig <- survey %>% 
  filter(str_detect(scottish_health_survey_indicator, "cigarette")) %>% 
  rename(e_cigarette_use = scottish_health_survey_indicator) %>% 
  mutate(e_cigarette_use = str_sub(e_cigarette_use, 18))

e_cig

# Fruit and Veg

fruit_and_veg <- survey %>% 
  filter(str_detect(scottish_health_survey_indicator, "Fruit")) %>% 
  rename(fruit_and_veg_consumption = scottish_health_survey_indicator) %>% 
  mutate(fruit_and_veg_consumption = str_sub(fruit_and_veg_consumption, 32))

fruit_and_veg

# General Health

general_health <- survey %>% 
  filter(str_detect(scottish_health_survey_indicator, "General")) %>% 
  rename(general_health_questionnaire_ghq_12 = scottish_health_survey_indicator) %>% 
  mutate(general_health_questionnaire_ghq_12 = str_sub(general_health_questionnaire_ghq_12, 46))

general_health

# Life Satisfaction

life_satisfaction <- survey %>% 
  filter(str_detect(scottish_health_survey_indicator, "satisfaction")) %>% 
  rename(life_satisfaction_level = scottish_health_survey_indicator) %>% 
  mutate(life_satisfaction_level = str_sub(life_satisfaction_level, 20))

life_satisfaction

# Long-term Illness

long_term_illness <- survey %>% 
  filter(str_detect(scottish_health_survey_indicator, "illness")) %>% 
  rename(long_term_illness = scottish_health_survey_indicator) %>% 
  mutate(long_term_illness = str_sub(long_term_illness, 20))

long_term_illness

# Obesity

obesity <- survey %>% 
  filter(str_detect(scottish_health_survey_indicator, "Obesity")) %>% 
  rename(obesity = scottish_health_survey_indicator) %>% 
  mutate(obesity = str_sub(obesity, 10))

obesity

# Overweight

overweight <- survey %>% 
  filter(str_detect(scottish_health_survey_indicator, "Overweight")) %>% 
  rename(overweight = scottish_health_survey_indicator) %>% 
  mutate(overweight = str_sub(overweight, 13))

overweight

# Provide help

provide_help <- survey %>% 
  filter(str_detect(scottish_health_survey_indicator, "Provide"))

provide_help

# Self-assessed General Health

self_assessed <- survey %>% 
  filter(str_detect(scottish_health_survey_indicator, "Self")) %>% 
  rename(self_assessed_general_health = scottish_health_survey_indicator) %>% 
  mutate(self_assessed_general_health = str_sub(self_assessed_general_health, 31))

self_assessed

# Smoking Status

smoking_status <- survey %>% 
  filter(str_detect(scottish_health_survey_indicator, "Smoking")) %>% 
  rename(smoking_status = scottish_health_survey_indicator) %>% 
  mutate(smoking_status = str_sub(smoking_status, 17))

smoking_status

# Summary Activity

summary_activity <- survey %>% 
  filter(str_detect(scottish_health_survey_indicator, "Summary")) %>% 
  rename(summary_activity_levels = scottish_health_survey_indicator) %>% 
  mutate(summary_activity_levels = str_sub(summary_activity_levels, 26))

summary_activity


