library(tidyverse)
library(glue)
library(here)
library(qs)
source(here("R", "functions.R"))

set.seed(2)

url <- glue("https://www.surf-forecast.com/breaks/{breaks()}/forecasts/latest")

data <- tibble(url) %>%
  mutate(path = make_html_path(url)) %>%
  bind_rows(tibble(url = "", path = "...qs")) %>%
  slice_sample(n = nrow(.))

qsave(data, here("data", "dataset.qs"))
