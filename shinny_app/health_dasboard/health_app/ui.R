library(shiny)
library(tidyverse)
library(shinydashboard)
library(dplyr)
library(ggplot2)


# Define UI for application
shinyUI(
    dashboardPage(
        header <- dashboardHeader(title = tags$i("Scothland Health Dasboard")), 
        
        sidebar <- dashboardSidebar(
            sidebarMenu(
                menuItem("Home", tabName = "home", icon = icon("home"),
                         selectInput("location_button",
                                     "Which location do you want to look at?",
                                     choices = c("Need to Add")
                         ),
                         radioButtons("data_button",
                                      "Which data do you want to look at",
                                      choices = c("Data", "Selection")
                         )
                )
            ),
            sidebarMenu(
                menuItem("Baby Data", tabName = "baby_data", icon = icon("baby")
                )
            ),
            sidebarMenu(
                menuItem("Mother Data", tabName = "mother_data", icon = icon("plus")
                         )
            )
        ),
        
        body <- dashboardBody(
            valueBox("Quickstat1", 24524), #Needs to be valueBoxOutput to pick up data later on
            valueBox("Quickstat2", 24535),
            valueBox("Quickstat3", 42435)
            
            
        )
    )
    
    
    
)
