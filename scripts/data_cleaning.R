library(tidyverse)
library(here)

# This script is a work in progress

# Data Quality Checklist --------------------------------------------------

# I used the following blog by Omar Elgabry from Towards Data Science, Omar used a wikipedia entry as a good basis for the blog. We will follow their structure

# https://towardsdatascience.com/the-ultimate-guide-to-data-cleaning-3969843991d4
# https://en.wikipedia.org/wiki/Data_cleansing#Data_quality

# Validity (not the construct kind) ---------------------------------------

# Generally speaking these are a series of checks for assessing the overall validity of your data.

# Data-Type Constraints ---------------------------------------------------

# Ensure that R understands exactly what type of data is in each column, and notify you if there are problems
data_superhero <- read_csv(file = here("data","heroes_information.csv"))

View(data_superhero)


# R does a decent job guessing what type of data are in a file
spec(data_superhero)

# Range Constraints (numerical variables) ----------------------------------------------
# Add quality check variables

data_superhero <- data_superhero %>% 
  mutate(qc_Weight_range = Weight < 0 | Weight > 200,
         qc_Height_range = Height < 0 | Height > 200) %>% 
  View

# Mandatory Constraints ---------------------------------------------------


# Unique Constraints ------------------------------------------------------
# check if there are duplicates across all columns
nrow(distinct(data_superhero)) == nrow(data_superhero)

# count unique values to check for duplicates
data_superhero %>% 
  summarise_all(funs(sum(is.na(.)))) %>% 
  summarise_all(.funs = list(n_distinct)) %>%
  View

naniar::vis_miss(data_superhero,show_perc_col = TRUE,sort_miss = TRUE)
naniar::miss_var_summary(data_superhero)
naniar::miss_case_table(data_superhero)

data_superhero %>% 
  ggplot(aes(x = Weight, y = Height)) +
  naniar::geom_miss_point() +
  scale_y_log10()

naniar::gg_miss_var(data_superhero)

# Set-Membership Constraints ----------------------------------------------
# aka factors
data_superhero$Gender


# Foreign-key Constraints -------------------------------------------------


# Regular Expression Patterns ---------------------------------------------


# Cross-field validation --------------------------------------------------


