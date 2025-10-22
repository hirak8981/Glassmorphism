# R/theme.R - Application theme configuration

#' Bootstrap 5 theme for the application
app_theme <- bs_theme(
  version = 5,
  bg = "#0a192f",
  fg = "#ffffff",
  primary = "#4a9eff",
  secondary = "#2d5a87",
  success = "#10b981",
  info = "#3b82f6",
  warning = "#f59e0b",
  danger = "#ef4444"
)

#' Default glassmorphism settings
default_glass_settings <- list(
  blur = 15,
  opacity = 0.15,
  color = "#ffffff",
  saturation = 180,
  border_opacity = 0.3
)
