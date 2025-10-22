# global.R - Package loading and sourcing

# Install pacman if not available
if (!require("pacman")) install.packages("pacman")

# Load required packages
pacman::p_load(
  fs,
  here,
  shiny,
  bslib,
  colourpicker,
  stringi,
  stringr
)

# Source helper files
source("R/helpers.R")
source("R/theme.R")
source("R/data.R")
