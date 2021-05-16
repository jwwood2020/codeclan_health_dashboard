
# About -------------------------------------------------------------------

# This script reads in the "low_birthweight" csv file, cleans names and then
# gets the health board name from the "id_lookups" file by joining on the 
# feature_id = XXXX variables.
# 
# The only manual intervention occurs where feature_id = S92000003
# This code corresponds to the country_name = "Scotland", not a health board.
# Therefore the health board for these cases is set to "Scotland"


# Load libraries ----------------------------------------------------------

library(tidyverse)
library(janitor)


# Read raw data -----------------------------------------------------------

low_birthweight <- read_csv("data_raw/low_birthweight.csv") %>% 
  clean_names() %>% 
  mutate(year = str_sub(date_code,1,4))



# Get Health Board names --------------------------------------------------

lookups <- read_csv("data_clean/id_lookups.csv")

health_board_id <- read_csv("data_clean/id_lookups.csv") %>% 
  select(iz2011_code, hb_name) %>% 
  distinct(iz2011_code, .keep_all = TRUE)


# Join tables to add health board names -----------------------------------

### feature_code corresponds to more than one column in the
### health_board_id dataset. Need to find a way of getting hb_name

low_birthweight <- low_birthweight %>% 
  left_join(health_board_id,
            by = c("feature_code" = "iz2011_code")) %>% 
  # feature_code = S92000003 corresponds to country_name "Scotland"
  mutate(hb_name = case_when(
                    feature_code == "S92000003" ~ "Scotland",
                    TRUE ~ hb_name))




# write csv ---------------------------------------------------------------

write_csv(low_birthweight, "data_clean/low_birthweight")



