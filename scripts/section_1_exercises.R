# This cleaning script should read in the raw data file, and output an analysis ready dataset

# Load Libraries needed for cleaning ----
library(here)
library(snakecase)
library(tidyverse)
#library(tidylog)

# Import the raw data and clean it up ----

# Start by importing the data
# I'm using the here::here() function to make the file path relative to the project directory
