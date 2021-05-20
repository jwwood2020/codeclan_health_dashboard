library(shiny)
library(tidyverse)
library(shinydashboard)
library(dplyr)
library(ggplot2)
library(here)
library(skimr)
library(DT)
library(sf)
library(leaflet)
library(rmapshaper)

# John's Data ()

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
  mutate(year = as.numeric((year))) %>% 
  rename (la_name = reference_area)


mothers_ages_n <- mothers_ages %>% 
  mutate(year = as.numeric(year))
  

low_birthweight <- low_birthweight %>%
  left_join(mothers_ages_n,
            by = c("year", "feature_code")) %>%
  rename(older_ratio = ratio)


breastfeeding <- read_csv(here("data_clean/breastfeeding.csv")) 

# Emily's Data 

# scotland_simple <- st_read("data_clean/scotland_simple.shp")

scotland <- read_sf(here("data_raw/SG_NHS_HealthBoards_2019/SG_NHS_HealthBoards_2019.shp"))

scotland_simple <- ms_simplify(scotland)

alcohol <- read_csv("../data_clean/alcohol.csv") %>% 
  filter(alcohol_consumption == "Hazardous/Harmful drinker")

obesity <- read_csv("../data_clean/obesity.csv") %>% 
  filter(obesity == "Obese")

smoking_status <- read_csv("../data_clean/smoking_status.csv") %>% 
  filter(smoking_status == "Current smoker")

e_cig <- read_csv("../data_clean/e_cig.csv") %>% 
  filter(e_cigarette_use == "Currently using")

