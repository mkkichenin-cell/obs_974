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
library(tidyverse)
library(ggplot2)
library(leaflet)

world_coord <- map_data("world")
as.data.frame(world_coord)

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

 
 # Première page
 
  nav_panel("Classements", p(
    
    
    card(
      card_header("Classement division 1")
    
    ),
    
    card(
      card_header("Classement division 2")
    )
    
   
                             
                             )),
  
 # Deuxième page
 
  nav_panel("Top joueurs", p("Content for Page ")),
 
 # Troisième page
  
  nav_panel("Nos footballeurs dans le monde", p(
    
    leafletOutput("map") 
    
  ))

 # fin corps
 
 
)
  

server <- function(input, output) {
  output$map <- renderLeaflet({ 
    leaflet() |> 
      addTiles() |> 
      setView(0.34580993652344, 50.6252978589571, zoom = 3) 
  }) 
}

shinyApp(ui, server)






