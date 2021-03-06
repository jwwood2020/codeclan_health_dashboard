
# About -------------------------------------------------------------------

# This script reads in the "Datazone2011lookup.csv" file.

# This file contains identifiers and lookups for the various geographic regions,
# health boards etc. 
#
# Nothing has been done to this data other than clean names. If identifiers,
# lookups, etc are required for other analysis then this csv should be used.


# Load libraries ----------------------------------------------------------

library(tidyverse)
library(janitor)


# Read in .csv ------------------------------------------------------------

id_lookups <- read_csv("data_raw/Datazone2011lookup.csv") %>% 
  clean_names()


# Write .csv  -------------------------------------------------------------

write_csv(id_lookups, "data_clean/id_lookups.csv")



# Get health board names --------------------------------------------------

health_board_id <- id_lookups %>% 
  select(hb_code, hb_name) %>% 
  distinct(hb_code, .keep_all = TRUE)

write_csv(health_board_id, "data_clean/health_board_id.csv")



# Get Council names -------------------------------------------------------

council_id <- id_lookups %>% 
  select(la_code, la_name) %>% 
  distinct(la_code, .keep_all = TRUE)

write_csv(council_id, "data_clean/council_id.csv")
  
