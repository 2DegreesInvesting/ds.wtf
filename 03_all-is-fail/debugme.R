# Make the problem self-contained and portable so you can ask for help --------

# Start by obviously showing all dependencies: Packages, functions, datasets.

library(tidyverse)
library(fs)
library(qs)
library(here)  # Makes paths portable

source(here("R/functions.R"))

dataset <- qread(here("data/dataset.qs"))

# Iterate as fast as possible -------------------------------------------------

result <- dataset %>%
  compute(show_progress = TRUE) %>%
  use_cache("result")  # a) Reuse computations; b) Avoid hard-coding paths

write_rendered_html(url = result$url, path = result$path, overwrite = FALSE)
