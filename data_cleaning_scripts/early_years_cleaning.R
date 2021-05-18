
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



# Reference areas ---------------------------------------------------------

council_id <- read_csv("data_clean/council_id.csv")
health_board_id <- read_csv("data_clean/health_board_id.csv")

# Create vectors of all health board/local council id numbers
# These can then be used in filtering out data
health_vector <- health_board_id %>% 
  pull(hb_code)

council_vector <- council_id %>% 
  pull(la_code)


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
            by = c("feature_code" = "la_code")) %>% 
  filter(feature_code == "S92000003" | feature_code %in% council_vector) %>% 
  filter(measurement == "Ratio") %>% 
  mutate(la_name = case_when(
    feature_code == "S92000003" ~ "Scotland",
    TRUE ~ la_name)) %>% 
  rename(weight_ratio = value) %>% 
  select(feature_code, weight_ratio, year, la_name)

write_csv(low_birthweight, "data_clean/low_birthweight.csv")



# Ante-natal smoking ------------------------------------------------------
antenatal_smoking <- read_csv("data_raw/antenatal_smoking.csv",
                              skip = 7) %>% 
  clean_names() %>% 
  rename(feature_code = 1) %>% 
  mutate(feature_code = str_sub(feature_code, -9)) %>% 
  filter(feature_code == "S92000003" | feature_code %in% council_vector) %>% 
  pivot_longer(cols = 3:20, 
               names_to = "date_code", 
               values_to = "smoker_ratio") %>% 
  mutate(year = str_sub(date_code,-4)) %>% 
  select(feature_code, reference_area, year, smoker_ratio)

write_csv(antenatal_smoking, "data_clean/antenatal_smoking.csv")
 


# Breastfeeding dataset ---------------------------------------------------
breastfeeding <- read_csv("data_raw/breastfeeding.csv") %>% 
  clean_names() %>% 
  filter(feature_code == "S92000003" | feature_code %in% council_vector) %>% 
  filter(measurement == "Ratio" & 
           population_group == "Breastfed" &
           breastfeeding_data_collection_time == "6 To 8 Week Review") %>% 
  mutate(year = str_sub(date_code,6,9)) %>% 
  left_join(council_id,
            by = c("feature_code" = "la_code")) %>% 
  mutate(la_name = case_when(
    feature_code == "S92000003" ~ "Scotland",
    TRUE ~ la_name)) %>% 
  rename(feeding_ratio = value) %>% 
  select(feature_code, feeding_ratio, year, la_name)

write_csv(breastfeeding, "data_clean/breastfeeding.csv")



# Dental Health dataset ---------------------------------------------------
dental_health <- read_csv("data_raw/dental_health.csv") %>% 
  clean_names() %>% 
  left_join(health_board_id,
            by = c("feature_code" = "hb_code")) %>% 
  mutate(hb_name = case_when(
    feature_code == "S92000003" ~ "Scotland",
    TRUE ~ hb_name)) %>% 
  rename(dental_ratio = value,
         year = date_code) %>% 
  select(feature_code, dental_ratio, year, hb_name)

write_csv(dental_health, "data_clean/dentalhealth.csv")



# First Time mothers over 35 ----------------------------------------------
older_mothers <- read_csv("data_raw/mothers_over35.csv",
                          skip = 7) %>% 
  clean_names() %>% 
  rename(feature_code = 1) %>% 
  mutate(feature_code = str_sub(feature_code, -9)) %>% 
  filter(feature_code == "S92000003" | feature_code %in% council_vector) %>% 
  pivot_longer(cols = 3:20, 
               names_to = "date_code", 
               values_to = "ratio") %>% 
  mutate(year = str_c("20",str_sub(date_code,-2)),
         age_band = "over 35") %>% 
  select(feature_code, reference_area, year, ratio, age_band)

write_csv(older_mothers, "data_clean/older_mothers.csv")



# First time mothers under 19 ---------------------------------------------
younger_mothers <- read_csv("data_raw/younger_mothers.csv",
                          skip = 7) %>% 
  clean_names() %>% 
  rename(feature_code = 1) %>% 
  mutate(feature_code = str_sub(feature_code, -9)) %>% 
  filter(feature_code == "S92000003" | feature_code %in% council_vector) %>% 
  pivot_longer(cols = 3:20, 
               names_to = "date_code", 
               values_to = "ratio") %>% 
  mutate(year = str_c("20",str_sub(date_code,-2)),
         age_band = "under 19") %>% 
  select(feature_code, reference_area, year, ratio, age_band)

write_csv(older_mothers, "data_clean/younger_mothers.csv")



# Mothers Age -------------------------------------------------------------
mothers_ages <- bind_rows(older_mothers, younger_mothers) %>% 
  arrange(feature_code, year)

write_csv(older_mothers, "data_clean/mothers_ages.csv")


# Immunisation dataset ----------------------------------------------------
immunisation <- read_csv("data_raw/immunisation.csv") %>% 
  clean_names() %>% 
  filter(feature_code == "S92000003")

write_csv(immunisation, "data_clean/immunisation.csv")
  
  