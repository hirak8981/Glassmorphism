# server.R - Server logic

server <- function(input, output, session) {
  
  # Reactive values to store current settings
  current_settings <- reactiveValues(
    blur = default_glass_settings$blur,
    opacity = default_glass_settings$opacity,
    color = default_glass_settings$color,
    saturation = default_glass_settings$saturation,
    border_opacity = default_glass_settings$border_opacity
  )
  
  # Observe input changes and update preview card
  observe({
    # Generate CSS rule using helper function
    css_rule <- generate_glass_css(
      blur = input$blur_amount,
      opacity = input$opacity,
      color = input$bg_color,
      saturation = input$saturation,
      border_opacity = input$border_opacity
    )
    
    # Send custom message to JavaScript
    session$sendCustomMessage("updateGlass", list(style = css_rule))
    
    # Update reactive values
    current_settings$blur <- input$blur_amount
    current_settings$opacity <- input$opacity
    current_settings$color <- input$bg_color
    current_settings$saturation <- input$saturation
    current_settings$border_opacity <- input$border_opacity
  })
  
  # Reset button functionality
  observeEvent(input$reset_btn, {
    updateSliderInput(
      session, 
      "blur_amount", 
      value = default_glass_settings$blur
    )
    updateSliderInput(
      session, 
      "opacity", 
      value = default_glass_settings$opacity
    )
    updateColourInput(
      session, 
      "bg_color", 
      value = default_glass_settings$color
    )
    updateSliderInput(
      session, 
      "saturation", 
      value = default_glass_settings$saturation
    )
    updateSliderInput(
      session, 
      "border_opacity", 
      value = default_glass_settings$border_opacity
    )
    
    # Show notification
    showNotification(
      "Settings reset to defaults",
      type = "message",
      duration = 2
    )
  })
  
  # Session disconnect handling
  session$onSessionEnded(function() {
    cat("Session ended at:", format(Sys.time(), "%Y-%m-%d %H:%M:%S"), "
")
  })
  
}
