scholar_pubs <- function(id = NULL, file = "publications.qmd") {

  scholar.df <- scholar::get_publications(id)# |>
      #funprog::sort_by(~ list(-year))

  pubs <- do.call("rbind", lapply(split(scholar.df, f = 1:nrow(scholar.df)), format_pub))

  pubs <- paste("- ", format_pubs, collapse = "\n\n")

  writeLines(c("---",
               "title: Publications",
               "---",
               pubs),
             con = "pubs.qmd")


}

format_pub <- function(pub) {
  paste(pub$author, pub$year, pub$title, paste0("*", pub$journal, "*"), pub$number, sep = ". ")
}



id <- "EnClcUMAAAAJ"

scholar_tib <- scholar::get_publications(id) %>%
  tibble::tibble(.) %>% arrange(., --year)


pubs <- do.call("rbind", lapply(split(scholar_tib, f = 1:nrow(scholar_tib)), format_pub))

pubs <- paste("- ", format_pubs, collapse = "\n\n")

writeLines(c("---",
             "title: Publications",
             "---",
             pubs),
           con = "pubs.qmd")


