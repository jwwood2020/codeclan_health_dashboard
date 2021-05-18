
# About -------------------------------------------------------------------

# This script reads in and cleans the various datasets associated with
# early-year health.
#
# Records have a "feature_code" identifier which links to local council area, 
# health board, electoral ward etc.
#
# feature_code = S92000003 corresponds to the country_name = "Scotland; records 
# with this code correspond to the overall national level data in the dataset.



# Load libraries ----------------------------------------------------------
library(tidyverse)
library(janitor)



# BMI dataset -------------------------------------------------------------
bmi_clinical <- read_csv("data_raw/bmi_p1_clinical.csv") %>% 
  clean_names() %>% 
  mutate(year = str_sub(date_code,6,9))

# get Health Board names
health_board_id <- read_csv("data_clean/id_lookups.csv") %>% 
  select(hb_code, hb_name) %>% 
  distinct(hb_code, .keep_all = TRUE)

# join table to add Health Board names
bmi_clinical <- bmi_clinical %>% 
  left_join(health_board_id,
            by = c("feature_code" = "hb_code")) %>% 
# feature_code = S92000003 corresponds to country_name "Scotland"
  mutate(hb_name = case_when(
    feature_code == "S92000003" ~ "Scotland",
    TRUE ~ hb_name))

write_csv(bmi_clinical, "data_clean/bmi_clinical.csv")



# Low Birthweight dataset -------------------------------------------------
low_birthweight <- read_csv("data_raw/low_birthweight.csv") %>% 
  clean_names() %>% 
  mutate(year = str_sub(date_code,6,9)) %>% 
  left_join(council_id,
            by = c("feature_code" = "la_code"))

write_csv(low_birthweight, "data_clean/low_birthweight.csv")



# Ante-natal smoking ------------------------------------------------------
antenatal_smoking <- read_csv("data_raw/antenatal_smoking.csv",
                              skip = 7) %>% 
  clean_names() %>% 
  rename(feature_id = 1) %>% 
  mutate(feature_id = str_sub(feature_id, -9)) %>% 
  pivot_longer(cols = 3:20, 
               names_to = "date_code", 
               values_to = "ratio") %>% 
  mutate(year = str_sub(date_code,-4)) %>% 
  select(feature_id, reference_area, year, ratio)

write_csv(antenatal_smoking, "data_clean/antenatal_smoking.csv")
 


# Breastfeeding dataset ---------------------------------------------------
breastfeeding <- read_csv("data_raw/breastfeeding.csv") %>% 
  clean_names() %>% 
  mutate(year = str_sub(date_code,6,9)) %>% 
  left_join(council_id,
            by = c("feature_code" = "la_code"))

write_csv(breastfeeding, "data_clean/breastfeeding.csv")



# Dental Health dataset ---------------------------------------------------
dental_health <- read_csv("data_raw/dental_health.csv") %>% 
  clean_names() %>% 
  filter(feature_code == "S92000003")

write_csv(dental_health, "data_clean/dentalhealth.csv")



# First Time mothers over 35 ----------------------------------------------
older_mothers <- read_csv("data_raw/mothers_over35.csv",
                          skip = 7) %>% 
  clean_names() %>% 
  rename(feature_id = 1) %>% 
  mutate(feature_id = str_sub(feature_id, -9)) %>% 
  pivot_longer(cols = 3:20, 
               names_to = "date_code", 
               values_to = "ratio") %>% 
  mutate(year = str_c("20",str_sub(date_code,-2))) %>% 
  select(feature_id, reference_area, year, ratio)

write_csv(older_mothers, "data_clean/older_mothers.csv")



# Immunisation dataset ----------------------------------------------------
immunisation <- read_csv("data_raw/immunisation.csv") %>% 
  clean_names() %>% 
  filter(feature_code == "S92000003")

write_csv(immunisation, "data_clean/immunisation.csv")
  
  