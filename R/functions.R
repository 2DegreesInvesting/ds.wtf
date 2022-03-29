library(pins)

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
