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
library(ggplot2)
library(sf)
library(viridisLite)
library(here)



here("obs_974", "communesPolygon.shp")

ile <- read_sf("~/obs_974/communesPolygon.shp")


ui <- page_navbar( 
  title = "STAta_FOOT974 by Michaël KICHENIN",
  theme = bs_theme(bg = "white", fg = "black", primary = "blue",
                   base_font = font_google("Space Mono"),
                   code_font = font_google("Space Mono")),
  
 sidebar =  sidebarPanel(width = 20,
               
               checkboxGroupInput(
                 "checkGroup",
                 "Sélectionnez la division",
                 choices = list("Division 1" = 1, "Division 2" = 2, "Division 3" = 3, "Division 4" = 4),
                 selected = 1),
               
               plotOutput("map"),
               
               
               ),
 

 
 # Première page
 
  nav_panel("Classements", p(
    
    
    card(
      card_header("Classement division 1"),
    
    ),
    
    card(
      card_header("Classement division 2")
    )
    
   
                             
                             )),
  
 # Deuxième page
 
  nav_panel("Top joueurs", p("Content for Page ")),
 
 # Troisième page
  
  nav_panel("Nos footballeurs dans le monde", p(
    

    
  ))

 # fin corps
 
 
)
  

server <- function(input, output) {
  output$map <- renderPlot({ 
  
map <- ggplot(ile) + geom_sf(aes()) + scale_fill_viridis() + theme_minimal() +
       theme(plot.margin = margin(0.05,0.05,0.05,0.05, "cm"),axis.text.x = element_blank(), axis.text.y = element_blank())
map   
    
  }) 
}

shinyApp(ui, server)






