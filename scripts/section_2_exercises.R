# Load libraries ---------

library(tidyverse)
library(readxl)

# Import data set --------
data_sleep_depriv <- readxl::read_xlsx(here("data","Copy of journal.pone.0103513.s002.XLSX"))

# Tidying the Data ----------

# Trying to take the Week number and put it into a column to create a tidy data set

# Step 1: convert data into long format ( grouping all variable starting with "Week")
# Step 2: break the new column into a variable for the Week, and another variable for the type of measure taken
#   a: find a regular expression to break the columns at the right spot
#   b: remove the prefix "Week" because I only want the number of weeks


data_sleep_depriv %>% 
  
