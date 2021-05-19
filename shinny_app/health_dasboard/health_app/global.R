library(shiny)
library(tidyverse)
library(shinydashboard)
library(dplyr)
library(ggplot2)
library(here)
library(skimr)

# John's Data (not working need to get some more context interms of the data used)

smokers <- read_csv(here("data_clean/antenatal_smoking.csv")) %>% 
  arrange(year) %>% 
  rename (la_name = reference_area)

low_birthweight <- read_csv(here("data_clean/low_birthweight.csv")) %>% 
  arrange(year)

smokers_n <- smokers %>% 
  select(-la_name)

low_birthweight <- low_birthweight %>% 
  left_join(smokers_n,
            by = c("feature_code", "year")) 

mothers_ages <- read_csv(here("data_clean/mothers_ages.csv")) %>% 
  arrange(year) %>% 
  mutate(year = as.character(year))

mothers_ages_m <- mothers_ages %>% 
  rename (la_name = reference_area)


mothers_ages_n <- mothers_ages %>% 
  mutate(year = as.numeric(year))
  

low_birthweight <- low_birthweight %>%
  left_join(mothers_ages_n,
            by = c("year", "feature_code")) %>%
  rename(older_ratio = ratio)


breastfeeding <- read_csv(here("data_clean/breastfeeding.csv")) 

# Emilies Data 

