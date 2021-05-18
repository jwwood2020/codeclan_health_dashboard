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

write_csv(survey, "data_clean/survey.csv")

survey %>%   
  group_by(feature_code) %>% 
  summarise()

# Alcohol Consumption

alcohol <- survey %>% 
  filter(str_detect(scottish_health_survey_indicator, "Alcohol")) %>% 
  rename(alcohol_consumption = scottish_health_survey_indicator) %>% 
  mutate(alcohol_consumption = str_sub(alcohol_consumption, 22))

alcohol

write_csv(alcohol, "data_clean/alcohol.csv")

# E-cigarette

e_cig <- survey %>% 
  filter(str_detect(scottish_health_survey_indicator, "cigarette")) %>% 
  rename(e_cigarette_use = scottish_health_survey_indicator) %>% 
  mutate(e_cigarette_use = str_sub(e_cigarette_use, 18))

e_cig

write_csv(e_cig, "data_clean/e_cig.csv")

# Fruit and Veg

fruit_and_veg <- survey %>% 
  filter(str_detect(scottish_health_survey_indicator, "Fruit")) %>% 
  rename(fruit_and_veg_consumption = scottish_health_survey_indicator) %>% 
  mutate(fruit_and_veg_consumption = str_sub(fruit_and_veg_consumption, 32))

fruit_and_veg

write_csv(fruit_and_veg, "data_clean/fruit_and_veg.csv")

# General Health

general_health <- survey %>% 
  filter(str_detect(scottish_health_survey_indicator, "General")) %>% 
  rename(general_health_questionnaire_ghq_12 = scottish_health_survey_indicator) %>% 
  mutate(general_health_questionnaire_ghq_12 = str_sub(general_health_questionnaire_ghq_12, 46))

general_health

write_csv(general_health, "data_clean/general_health.csv")

# Life Satisfaction

life_satisfaction <- survey %>% 
  filter(str_detect(scottish_health_survey_indicator, "satisfaction")) %>% 
  rename(life_satisfaction_level = scottish_health_survey_indicator) %>% 
  mutate(life_satisfaction_level = str_sub(life_satisfaction_level, 20))

life_satisfaction

write_csv(life_satisfaction, "data_clean/life_satisfaction.csv")

# Obesity

obesity <- survey %>% 
  filter(str_detect(scottish_health_survey_indicator, "Obesity")) %>% 
  rename(obesity = scottish_health_survey_indicator) %>% 
  mutate(obesity = str_sub(obesity, 10))

obesity

write_csv(obesity, "data_clean/obesity.csv")

# Smoking Status

smoking_status <- survey %>% 
  filter(str_detect(scottish_health_survey_indicator, "Smoking")) %>% 
  rename(smoking_status = scottish_health_survey_indicator) %>% 
  mutate(smoking_status = str_sub(smoking_status, 17))

smoking_status

write_csv(smoking_status, "data_clean/smoking_status.csv")

# Summary Activity

summary_activity <- survey %>% 
  filter(str_detect(scottish_health_survey_indicator, "Summary")) %>% 
  rename(summary_activity_levels = scottish_health_survey_indicator) %>% 
  mutate(summary_activity_levels = str_sub(summary_activity_levels, 26))

summary_activity

write_csv(summary_activity, "data_clean/summary_activity.csv")
