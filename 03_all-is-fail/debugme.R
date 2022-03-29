# Make the problem self-contained and portable so you can ask for help --------

# Start by obviously showing all dependencies: Packages, functions, datasets.

library(tidyverse)
library(fs)
library(qs)
library(here)  # Makes paths portable

source(here("R/functions.R"))

dataset <- qread(here("data/dataset.qs"))

# Iterate as fast as possible -------------------------------------------------


# FIXME
result <- dataset %>%
  compute(show_progress = TRUE) %>%
  use_cache("result")  # a) Reuse computations; b) Avoid hard-coding paths

result

library(tidyverse)
devtools::load_all()

uniq <- europages_bs_summary %>%
  group_by(url_info) %>%
  filter(row_number() == 1L) %>%
  ungroup() %>%
  mutate(path_info = path_info(url_info)) %>%
  use_pin("uniq")

uniq <- tail(uniq, 1000)
dir_create(unique(path_dir(uniq$path_info)))
write_rendered_html(url = uniq$url_info, path = uniq$path_info, overwrite = FALSE)
