library(pins)
library(glue)
library(here)
library(progress)
library(fs)
# devtools::install_github("rstudio/chromote")
library(chromote)

use_pin <- function(x, name, board = board_local(), overwrite = FALSE) {
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

# Write the dom as html -- generated from a headless browser
write_rendered_html <- function(url, path, overwrite = FALSE, show_progress = FALSE) {
  browser()
  session <- start_chrome_session()

  if (show_progress) pb <- progress::progress_bar$new(total = length(url))
  for (i in seq_along(url)) {
    if (show_progress) pb$tick()
    Sys.sleep(1)

    if (!overwrite && file_exists(path[[i]])) {
      next()
    }
    html <- render_html(url[[i]], path[[i]], session)
    qsave(html, path[[i]])
  }

  end_chrome_session(session)

  invisible(url)
}

start_chrome_session <- function() {
  chromote::ChromoteSession$new()
}

end_chrome_session <- function(session) {
  session$close()
}

render_html <- function(url, path, session) {
  session$Page$navigate(url)
  session$Page$loadEventFired()
  session$Runtime$evaluate("document.documentElement.outerHTML")$result$value
}
