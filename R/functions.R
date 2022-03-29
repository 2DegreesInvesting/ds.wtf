library(pins)
library(glue)
library(here)
library(fs)

use_cache <- function(x, name, board = board_local(), overwrite = FALSE) {
  if (!pin_exists(board, name) || overwrite) pin_write(board, x, name)
  pin_read(board, name)
}

compute <- function(x, show_progress = FALSE) {
  for (i in 1:3) {
    Sys.sleep(1)
    if (show_progress) message(i)
  }
  x
}

breaks <- function() {
  c(
    "Punta-Medanos",
    "Pinamar",
    "Santa-Clara-del-Mar",
    "Yacht",
    "Offthewall",
    "Chapadmalal",
    "Miramar_2",
    "Quequen"
  )
}

extract_break <- function(url) {
  out <- path_rel(url, start = "https://www.surf-forecast.com/breaks/")
  map_chr(path_split(out), 1)
}

make_html_path <- function(url) {
  path_rel(here("html", glue("{extract_break(url)}.qs")), here())
}
