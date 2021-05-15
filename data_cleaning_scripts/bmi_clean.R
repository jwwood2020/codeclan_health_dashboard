
# About -------------------------------------------------------------------

# This script reads in the "BMI Clinical" csv file, cleans names and then
# gets the health board name from the "id_lookups" file by joining on the 
# feature_id and hb_code variables.
# 
# The only manual intervention occurs where feature_id = S92000003
# This code corresponds to the country_name = "Scotland", not a health board.
# Therefore the health board for these cases is set to "Scotland"


# Load libraries ----------------------------------------------------------

library(tidyverse)
library(janitor)


# Read raw data -----------------------------------------------------------

bmi_clinical <- read_csv(here("data_raw/bmi_p1_clinical.csv")) %>% 
  clean_names() %>% 
  mutate(year = str_sub(date_code,1,4))


# Get Health Board names --------------------------------------------------

health_board_id <- read_csv(here("data_clean/id_lookups.csv")) %>% 
  select(hb_code, hb_name) %>% 
  distinct(hb_code, .keep_all = TRUE)


# Join tables to add health board names -----------------------------------

bmi_clinical <- bmi_clinical %>% 
  left_join(health_board_id,
            by = c("feature_code" = "hb_code")) %>% 
  # feature_code = S92000003 corresponds to country_name "Scotland"
  mutate(hb_name = case_when(
                    feature_code == "S92000003" ~ "Scotland",
                    TRUE ~ hb_name))


# write csv ---------------------------------------------------------------

write_csv(bmi_clinical, "data_clean/bmi_clinical")



