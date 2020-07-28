# This cleaning script should read in the raw data file, and output an analysis ready dataset

# Load Libraries needed for cleaning ----
library(here)
library(snakecase)
library(tidyverse)
#library(tidylog)

# Import the raw data and clean it up ----
# Start by importing the data
# I'm using the here::here() function to make the file path relative to the project directory
# Replace "-" values with NA
data_superhero <- read_csv(file = here("data",
                                       "heroes_information.csv"),
                           na = c("NA","","-",".")) %>%
  # rename the first column as "id"
  rename("id" = X1) %>%
  # rename variables to make them easier to use
  rename_with(.fn = to_snake_case) %>%
  # replace -99 with NA
  mutate(height = na_if(height, y= -99),
         weight = na_if(weight, y = -99)) %>%
  # convert all character vectors (except name)
  # into lower case
  mutate_at(.vars = c("gender", "eye_color", "race",
                      "hair_color", "skin_color",
                      "alignment", "publisher"),
            .funs = str_to_lower) %>% 
  mutate(gender_fct =  parse_factor(gender,
                                    levels = c("male","female")),
         alignment_fct = parse_factor(alignment,
                                      levels = c("good","neutral","bad")),
         # edit eye_color
         eye_color =  if_else(condition = eye_color == "bown",
                              true = "brown",
                              false = eye_color),
         # edit skin_color
         skin_color =  if_else(condition = skin_color == "gray",
                               true = "grey",
                               false = skin_color))