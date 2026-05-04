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


iris <- iris

ui <- page_navbar( 
  title = "L'OBSEVATOIRE DU FOOTBALL",
  theme = bs_theme(bg = "white", fg = "black", primary = "#FCe",
                   base_font = font_google("Space Mono"),
                   code_font = font_google("Space Mono")),
  
  nav_panel("Statistiques générales",
            
            p( sidebarPanel( width = 2, 
                             
                             selectInput(
                               "var",
                               label = "Choisir une zone",
                               choices = c("Nord","Sud","Est", "Ouest", "Plusieurs zones"),
                               selected =  c("Nord", "Sud", "Est","Ouest", "Plusieurs zones")),
                             
                             checkboxGroupInput(inputId = "species", label = "Sélectionner une espèce", choices = levels(iris$Species)),
                             
                             selectInput(
                               "var",
                               label = "Choisir une zone",
                               choices = c("Nord","Sud","Est", "Ouest", "Plusieurs zones"),
                               selected =  c("Nord", "Sud", "Est","Ouest", "Plusieurs zones")),
                             
                             checkboxGroupInput(inputId = "species", label = "Sélectionner une espèce", choices = levels(iris$Species))
                             
            )
            
            )),
  
  plotOutput('plot1'),
  
  nav_panel("Rayon produits frais", p("Content for Page 2")),
  
  nav_panel("Page 3", p("Content for Page 3")))


server <- function(input, output) {
  output$plot1 <- renderPlot({
    # Plot code here
  })
}

shinyApp(ui, server)








