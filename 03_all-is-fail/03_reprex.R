# Reproduce the bug as simply as possible and share it with the package reprex

library(here)
source(here("03_all-is-fail/01_debugme.R"))

reprex::reprex(wd = ".", {
  library(here)
  source(here("R/functions.R"))
  write_rendered_html("", "...qs")
})
