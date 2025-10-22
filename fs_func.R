library(fs)
library(here)

#' Create a file/folder structure inside the current project
#'
#' @param structure Named list defining folder structure.
#'        Character vectors = files, lists = subfolders.
#' @param base_path Base directory (default: here::here()).
#'
#' @example
#' create_structure(
#'   list(
#'     "global.R", "ui.R", "server.R", "README.md",
#'     "R" = list("helpers.R", "theme.R", "data.R"),
#'     "www" = list("styles.css", "script.js")
#'   )
#' )
create_structure <- function(structure, base_path = here::here()) {
  
  create_recursive <- function(node, parent_path) {
    # Loop through each element safely
    for (i in seq_along(node)) {
      name <- names(node)[i]
      contents <- node[[i]]
      
      # Case 1: unnamed element → treat as a file in current folder
      if (is.null(name) || name == "") {
        file_create(file.path(parent_path, contents))
      }
      
      # Case 2: named element → treat as subfolder
      else {
        dir_path <- file.path(parent_path, name)
        dir_create(dir_path)
        
        # Recurse for subfolders or create files inside
        if (is.list(contents)) {
          create_recursive(contents, dir_path)
        } else if (is.character(contents)) {
          file_create(file.path(dir_path, contents))
        }
      }
    }
  }
  
  create_recursive(structure, base_path)
  message("✅ Structure created inside: ", base_path)
}


create_structure(
  list(
    "global.R", "ui.R", "server.R", "app.R", "README.md",
    "R" = list("helpers.R", "theme.R", "data.R"),
    "www" = list("styles.css", "script.js")
  )
)



