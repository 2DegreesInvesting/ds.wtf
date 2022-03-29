# Wrie the dom as html -- generated from a headless browser
write_rendered_html <- function(url, path, overwrite = FALSE) {
  session <- start_chrome_session()

  for (i in seq_along(url)) {
    if (!overwrite && file_exists(path[[i]])) {
      next()
    }
    html <- render_html(url[[i]], path[[i]], session)
    qsave(html, path[[i]])
  }

  end_chrome_session()

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
