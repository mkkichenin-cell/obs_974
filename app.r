library(tidyverse)
library(plotly)
library(reactable)
library(bslib)
library(bsicons)
library(shiny)
library(reticulate)
library(rnaturalearth)
library(rnaturalearthdata)
library(maps)
library(mapdata)
library(treemap)
library(treemapify)
library(cowplot)


ui <- page_navbar( 
  title = "STATS FOOTBALL974 by Michaël KICHENIN",
  theme = bs_theme(bg = "white", fg = "black", primary = "blue",
                   base_font = font_google("Space Mono"),
                   code_font = font_google("Space Mono")),
  
 sidebar =  sidebarPanel(width = 12,
               
               checkboxGroupInput(
                 "checkGroup",
                 "Sélectionnez la division",
                 choices = list("Division 1" = 1, "Division 2" = 2, "Division 3" = 3, "Division 4" = 4),
                 selected = 1)),

  
  nav_panel("Classements", p(
    
    
    card(
      card_header("Classement division 1"),
      
    ),
    
    card(
      card_header("Classement division 2"),
      
    ),
   
                             
                             )),
  
  nav_panel("Top joueurs", p("Content for Page ")),
  
  nav_panel("Nos footballeurs dans le monde", p("Content for Page 2")),
  
)
  

server <- function(input, output) {
  output$plot1 <- renderPlot({
    # Plot code here
  })
}

shinyApp(ui, server)








