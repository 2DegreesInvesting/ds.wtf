library(tidyverse)
library(glue)
library(here)
library(qs)
source(here("R", "functions.R"))

set.seed(2)

url <- glue("https://www.surf-forecast.com/breaks/{breaks()}/forecasts/latest")

data <- tibble(url) %>%
  mutate(path = here("html", glue("{breaks()}.qs"))) %>%
  bind_rows(tibble(url = "", path = "...qs"))

data <- slice_sample(data, n = 9)

qsave(data, here("data", "dataset.qs"))
