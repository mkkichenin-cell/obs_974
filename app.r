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
library(rsconnect)
library(shinymanager)



shapefile <-read_sf("communes/communesPolygon.shp")
coord <- read_sf ("qpv/quartiers-prioritaires-de-la-politique-de-la-ville-qpv.shp")
point1 <- read_sf("iris-millesime-france/georef-france-iris-millesime.shp") 

shapefile1 <- as.data.frame(shapefile)

shapefile1 <- select(shapefile1, 7, 12)

shapefile1

# define some basic credentials (on data.frame)
credentials <- data.frame(
  user = c("shiny", "shinymanager"), # mandatory
  password = c("azerty", "12345"), # mandatory
  start = c("2019-04-15"), # optinal (all others)
  expire = c(NA, "2040-12-31"),
  admin = c(FALSE, TRUE),
  comment = "Simple and secure authentification mechanism 
  for single ‘Shiny’ applications.",
  stringsAsFactors = FALSE
)


ui <- page_navbar(
  title =  "Michaël KICHENIN - DATA ANALYSssssssT 2",
  theme = bs_theme(version = 5, bootswatch = "minty"),
  
  tags$h2("My secure application"),
  verbatimTextOutput("auth_output"),
  
 
 # Première page
 
  nav_panel("CV",
            
            p(
    
    layout_column_wrap(
      
      width = 5,
      
      card(
        
        width = 10,
        
        layout_column_wrap(
        
        imageOutput("image", height = 140),
      
        
  
          
        value_box( title ="Email",
                   value = uiOutput("mail"), height = 1, 
                   theme = "blue",
                   showcase = bs_icon("envelope-at", size = 20)),
        
        value_box("Téléphone", 
                  value = uiOutput("0693 21 63 90"), height = 1,
                  theme = "blue",
                  showcase = bs_icon("phone", size = 50))
    
        ),
      
        layout_column_wrap(
          
        imageOutput("r", height = 140),
        
        value_box("Saint-Denis",
                  value = "8 chemin de la comète", height = 0.7 ,
                  theme = "blue",
                  showcase = bs_icon("house", size = 40),
                  showcase_layout = "top right" ),
        
        value_box("Naissance", 
                  value = "09/05/1988", height = 0.7, 
                  theme = "blue",
                  showcase = bs_icon("cake", size = 40),
                  showcase_layout = "top right")
        ),
      ),

      
    card (card_header("Expériences professionnelles"),
          value_box("2026: Maison De l'Emploi du Nord ", 
                    value = "Chargé de mission d'observatoire", height = 5,
                    theme = ""),
          
          value_box("2019 à 2025: Run Conseil, SAGIS, Etude et Marketing Réunion... ", 
                    value = "Agent de collecte de données", height = 5,
                    theme = ""),
          
          value_box("2012 à 2015: RSMA de la Réunion  ", 
                    value = "Aide moniteur agent administratif", height = 5,
                    theme = ""),
          
          
          ),
    ),
    
    
    layout_column_wrap(
    
      card( card_header("Diplôme"), 
                             value_box( 
                             value = "Master Economie Appliquée", height = 40, 
                             showcase = bs_icon("mortarboard"),
                             theme = "",
                             p("Université de la Réunion"),
                             p("Spécialité: Méthode quantitative et modélisation pour l'entreprise")),
            
            value_box( 
              value = "Licence Admnistration Economie et Sociale  ", height = 40, 
              showcase = bs_icon("dash"),
              p("Université de la Réunion"),
              theme = ""),
        ),
    
 
      card (card_header("Compétences"),
            
            value_box( 
              value = "sondage et stockage  ", height = 38, 
              showcase = bs_icon("database-check", size = 40),
              p("Collecte de données"),
              theme = "orange"),
            
            value_box( 
              value = "Tri, tableaux et graphiques", height = 38, 
              showcase = bs_icon("graph-up", size = 40),
              p(" Traitement de données"),
              theme = "orange"),
           
             value_box( 
              value = "Tableau de bord et cloud   ", height = 38, 
              showcase = bs_icon("cloud-check", size=40),
              p("Diffusion de données"),
              theme = "orange"),
      
            value_box( 
              value = "R studio, Shiny, Github, Posit cloud and IA ", height = 58, 
              p("Utilisation de R et de ses extensions"),
              theme = "orange" ),
            
      ),
                             
                             ))),
  
 # Deuxième page
 
 
 nav_panel("Tableaux", p(
   

   
   layout_column_wrap(
     
       navset_card_tab(
         nav_panel(title = "Présentation", p( layout_column_wrap(dataTableOutput("dynamic"),textOutput("text")))),
         nav_panel(title = "Projet 1", p("contenu")),
       
     ),
     
     card(
       card_header("Classement division 2")
     )
     
   ))),
 

 # Troisième page
 
 
 nav_panel("Graphiques", p(
   
   
   
   layout_column_wrap(
     
     card(
       card_header(title = "Classement division 1"),
       
     ),
     
     card(
       card_header("Classement division 2")
     )
     
   ))),
 
 # Quatrième page
 
 
 nav_panel("Cartes", p(
   
   
   
   layout_column_wrap(
     
     card(
       card_header(title = "Classement division 1"),
       
     ),
     
     card(
       card_header("Classement division 2")
     )
     
   ))),
 
 
 # fin corps
 
 
)
  
ui <- secure_app(ui)


server <- function(input, output) {
  
  # call the server part
  # check_credentials returns a function to authenticate users
  res_auth <- secure_server(
    check_credentials = check_credentials(credentials)
  )
  
  output$auth_output <- renderPrint({
    reactiveValuesToList(res_auth)
  })
  

zone_x <- reactive(input$zone)  


  
  output$image <- renderImage( 
    { 
      list(src = "photo.jpg", height = "130%") 
    }, 
    deleteFile = FALSE 
   ) 
  
  output$r <- renderImage( 
    { 
      list(src = "r.png", height = "120%") 
    }, 
    deleteFile = FALSE 
  ) 
  
  output$txt <- renderText("Naissance: 09/05/1988 Adresse: 8 chemin de la comète, Saint-Denis")
  

output$static <- renderTable(head(coord))

output$text <- renderText("Influencers: The role of Ronaldo in Dalot's career
Diogo covers conversations with Cristiano, his route to United's first team and the crucial impact of his parents.")

output$dynamic <- renderDataTable(coord, options = list(pageLength= 5))
  
}

shinyApp(ui, server)


