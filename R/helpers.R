# R/helpers.R - Helper functions

#' Create a glass card component
#'
#' @param title Character. The card title
#' @param description Character. The card description
#' @param icon_class Character. CSS class for the icon
#'
#' @return A div containing the glass card
create_glass_card <- function(title, description, icon_class) {
  div(
    class = "glass-card",
    div(
      class = "card-icon",
      tags$i(class = icon_class)
    ),
    h3(title),
    p(description)
  )
}

#' Convert hex color to RGB values
#'
#' @param hex Character. Hex color code (e.g., "#ffffff")
#'
#' @return Numeric vector of RGB values (0-255)
hex_to_rgb <- function(hex) {
  hex <- gsub("#", "", hex)
  rgb <- c(
    strtoi(substr(hex, 1, 2), 16L),
    strtoi(substr(hex, 3, 4), 16L),
    strtoi(substr(hex, 5, 6), 16L)
  )
  return(rgb)
}

#' Generate CSS rule for glassmorphism effect
#'
#' @param blur Numeric. Blur amount in pixels
#' @param opacity Numeric. Background opacity (0-1)
#' @param color Character. Hex color code
#' @param saturation Numeric. Saturation percentage
#' @param border_opacity Numeric. Border opacity (0-1)
#'
#' @return Character string with CSS rule
generate_glass_css <- function(blur, opacity, color, saturation, border_opacity) {
  rgb <- hex_to_rgb(color)
  
  css_rule <- sprintf(
    "backdrop-filter: blur(%dpx) saturate(%d%%); background: rgba(%d, %d, %d, %.2f); border: 1px solid rgba(255, 255, 255, %.2f);",
    blur,
    saturation,
    rgb[1], rgb[2], rgb[3],
    opacity,
    border_opacity
  )
  
  return(css_rule)
}
