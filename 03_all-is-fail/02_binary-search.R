# Reduce the size of the problem with a binary search

library(here)

try( # Go past errors
  source(here("03_all-is-fail/01_debugme.R"))
)

nrow(result)

result %>%
  slice(5:9) %>%
  slice(1:3) %>%
  slice(1:2) %>%
  slice(2)
