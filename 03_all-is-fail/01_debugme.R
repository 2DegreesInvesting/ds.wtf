# Make the problem self-contained and portable
# Iterate quickly: Use cache to reuse computations and use portable paths
# Show progress

library(tidyverse)
library(fs)
library(qs)
library(here)

# Portable path
source(here("R/functions.R"))

# Portable path
dataset <- qread(here("data/dataset.qs"))



# Iterate quickly: Use cache to reuse computations and use portable paths
# Show progress

result <- dataset %>%
  compute(show_progress = TRUE) %>%
  # https://bit.ly/use_pin
  use_pin("result")

# FIXME
write_rendered_html(
  result$url,
  result$path,
  show_progress = TRUE
)

# TODO
# Find bad data with a binary search
# Create the smallest reproducible example
