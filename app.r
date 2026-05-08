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
library(jsonlite)


shapefile <-read_sf("communes/communesPolygon.shp")

ui <- page_navbar( 
  title =  "STAta_FOOT974 by Michaël",
  theme = bs_theme(bg = "white", fg = "black", primary = "blue",
                   base_font = font_google("Space Mono"),
                   code_font = font_google("Space Mono")),
  
 sidebar =  sidebarPanel(
               
               width = 200,
               
               imageOutput("image", height = 150), 
               
               checkboxGroupInput(
                 "checkGroup",
                 "Sélectionnez la division",
                 choices = list("Division 1" = 1, "Division 2" = 2, "Division 3" = 3, "Division 4" = 4),
                 selected = 1),
               
               checkboxGroupInput(
                 "checkGroup",
                 "Sélectionnez la division",
                 choices = list("Nord" = 1, "Est" = 2, "Ouest" = 3, "Sud" = 4),
                 selected = 1),
               
               plotOutput("map", width = 185, height = 200)
               
               
               ),
 

 
 # Première page
 
  nav_panel("Classements", p(
    
    layout_column_wrap(
    value_box(title = "Nombre de club", value = "", height = 50),
    value_box(title = "Nombre de club", value = ""),
    value_box(title = "Nombre de club", value = ""),
    ),
    
    layout_column_wrap(
    
    card(
      card_header("Classement division 1"),
    
    ),
    
    card(
      card_header("Classement division 2")
    ),
    
    card(
      card_header("Classement division 3")
    ),
    
    card(
      card_header("Classement division 4")
    )
    
                             
                             ))),
  
 # Deuxième page
 
  nav_panel("Top joueurs", p("Content for Page ")),
 
 # Troisième page
  
  nav_panel("Nos footballeurs dans le monde", p(
    

    
  ))

 # fin corps
 
 
)
  

server <- function(input, output) {
  
  output$map <- renderPlot({ 
  
ggplot(shapefile) + geom_sf(aes()) + theme_minimal() +
       theme(plot.margin = margin(0,0,0,0),axis.text.x = element_blank(), axis.text.y = element_blank())
  
    }) 
  
  
  output$image <- renderImage( 
    { 
      list(src = "balloon-fill.svg", height = "25%") 
    }, 
    deleteFile = FALSE 
   ) 
  
}

shinyApp(ui, server)





