library(shiny)
library(tidyverse)
library(shinydashboard)
library(dplyr)
library(ggplot2)


# Define UI for application
shinyUI(
    dashboardPage(
        dashboardHeader(title = tags$i("Scothland Health Dasboard")), 
        
        
        # Sidebar content
        dashboardSidebar(
            sidebarMenu(id = "menu1",
                menuItem("Home", tabName = "home", icon = icon("home"))
                ),
            
            conditionalPanel(
                condition = "input.menu1 =='home'",
                
                selectInput("location_button",
                            "Which location do you want to look at?",
                            choices = c("Need to Add")
                ),
                radioButtons("data_button",
                             "Which data do you want to look at",
                             choices = c("Data", "Selection")
                )
            ),
                
            sidebarMenu(id = "menu1",    
                menuItem("Baby Data", tabName = "baby_data", icon = icon("baby")),
                menuItem("Mother Data", tabName = "mother_data", icon = icon("plus"))
            )
        ),
        
        # Body content
        dashboardBody(
            tabItems(
                tabItem(tabName = "home",
                h2("Home menu content"),

                        valueBox("Quickstat1", 24524), #Needs to be valueBoxOutput to pick up data later on
                        valueBox("Quickstat2", 24535),
                        valueBox("Quickstat3", 42435)
                ),
            
            # Baby menu content
            tabItem(tabName = "baby_data",
                    h2("Baby Data menu content")
                    ),
            
            tabItem(tabName = "mother_data",
                    h2("Mother menu content")
            )
            )
        )
        )
)
    
# tabItem(tabName = "home",
#         h2("Home menu content"),
#         
#         valueBox("Quickstat1", 24524), #Needs to be valueBoxOutput to pick up data later on
#         valueBox("Quickstat2", 24535),
#         valueBox("Quickstat3", 42435)
# ),
