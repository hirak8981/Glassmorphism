# ui.R - User Interface

ui <- page_fillable(
  theme = app_theme,
  
  # Load external CSS and JS
  tags$head(
    tags$link(rel = "stylesheet", href = "styles.css"),
    tags$script(src = "script.js")
  ),
  
  # Main container
  div(class = "app-container",
      
      # Header section
      div(class = "glass-header",
          h1("Glassmorphism Dashboard", class = "header-title"),
          p("A modern Shiny application with glassmorphism design", class = "header-subtitle")
      ),
      
      # Feature cards grid
      div(class = "glass-grid",
          # Generate cards from data
          lapply(feature_cards, function(card) {
            create_glass_card(
              title = card$title,
              description = card$description,
              icon_class = card$icon_class
            )
          })
      ),
      
      # Interactive demo section
      div(class = "glass-demo",
          h2("Interactive Glassmorphism Controls"),
          p("Adjust the parameters below to customize the glassmorphism effect in real-time.", 
            style = "text-align: center; color: rgba(255, 255, 255, 0.8); margin-bottom: 30px;"),
          
          div(class = "demo-content",
              # Input controls
              div(class = "input-section",
                  h4("Adjust Parameters", style = "color: white; margin-bottom: 20px;"),
                  
                  sliderInput(
                    inputId = "blur_amount",
                    label = "Blur Amount (px):",
                    min = 0,
                    max = 30,
                    value = default_glass_settings$blur,
                    step = 1
                  ),
                  
                  sliderInput(
                    inputId = "opacity",
                    label = "Background Opacity:",
                    min = 0,
                    max = 1,
                    value = default_glass_settings$opacity,
                    step = 0.05
                  ),
                  
                  colourInput(
                    inputId = "bg_color",
                    label = "Background Tint:",
                    value = default_glass_settings$color,
                    palette = "limited",
                    allowedCols = color_palette
                  ),
                  
                  sliderInput(
                    inputId = "saturation",
                    label = "Saturation (%):",
                    min = 100,
                    max = 200,
                    value = default_glass_settings$saturation,
                    step = 10
                  ),
                  
                  sliderInput(
                    inputId = "border_opacity",
                    label = "Border Opacity:",
                    min = 0,
                    max = 1,
                    value = default_glass_settings$border_opacity,
                    step = 0.05
                  ),
                  
                  actionButton(
                    inputId = "reset_btn",
                    label = "Reset to Defaults",
                    class = "btn-reset"
                  )
              ),
              
              # Preview card
              div(class = "preview-section",
                  div(id = "preview-card", class = "glass-card preview-card",
                      div(class = "card-icon",
                          tags$i(class = "icon-preview")
                      ),
                      h3("Live Preview"),
                      p("This card updates in real-time as you adjust the glassmorphism parameters."),
                      p("Notice how the blur, transparency, and tint affect the visual appearance.",
                        style = "margin-top: 15px; font-size: 0.9rem;")
                  )
              )
          )
      ),
      
      # Footer
      div(class = "glass-footer",
          p("Built with ", tags$strong("Shiny"), ", ", 
            tags$strong("bslib"), ", and ", tags$strong("glassmorphism CSS"),
            style = "margin: 0; color: rgba(255, 255, 255, 0.7);")
      )
  )
)
