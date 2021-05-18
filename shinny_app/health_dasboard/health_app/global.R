library(shiny)
library(tidyverse)
library(shinydashboard)
library(dplyr)
library(ggplot2)
library(here)


# John's Data (not working need to get some more context interms of the data used)

smokers <- read_csv(here("data_clean/antenatal_smoking.csv")) %>% 
  arrange(year)

low_birthweight <- read_csv(here("data_clean/low_birthweight.csv")) %>% 
  arrange(year)

low_birthweight <- low_birthweight %>% 
  left_join(smokers,
            by = c("feature_code", "year")) 

mothers_ages <- read_csv(here("data_clean/mothers_ages.csv")) %>% 
  arrange(year) %>% 
  mutate(year = as.character(year))

# low_birthweight_full <- low_birthweight %>%
#   left_join(mothers_ages,
#             by = c("year", "feature_code")) %>%
#   rename(older_ratio = ratio)


breastfeeding <- read_csv(here("data_clean/breastfeeding.csv")) 

# Emilies Data 

