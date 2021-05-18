
# Define UI for application
shinyUI(
    dashboardPage(
        dashboardHeader(title = tags$i("Scothland Health Dasboard")),
        
        
        # Sidebar content
        dashboardSidebar(
            sidebarMenu(id = "menu1",
                menuItem("Home", tabName = "home", icon = icon("home"))),
            
            conditionalPanel(
                condition = "input.menu1 =='home'",
                
                selectInput("location_button",
                            "Which location do you want to look at?",
                            choices = c("Need to Add")),
                
                radioButtons("data_button",
                             "Which data do you want to look at",
                             choices = c("Data", "Selection"))
            ),
                
            sidebarMenu(id = "menu1",    
                menuItem("Scotland Data", tabName = "scotland_data", icon = icon("baby"))),
                
                conditionalPanel(
                    condition = "input.menu1 =='scotland_data'",
                    
                    selectInput("location_button",
                                "What data do you want to look at?",
                                choices = c("Baby", "Mother"))
                    
                ),
            
                
            sidebarMenu(id = "menu1",    
                menuItem("Council Data", tabName = "council_data", icon = icon("plus"))),
                
                conditionalPanel(
                    condition = "input.menu1 =='council_data'",
                    
                    selectInput("location_button",
                                "What data do you want to look at?",
                                choices = c("Need Council data"))
                )
            
            ), # Dashboardsidebar bracket
        
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
            tabItem(tabName = "scotland_data",
                    h2("Scotland Data menu content"),
                    plotOutput("smokers_scotland"),
                    plotOutput("birth_scotland"),
                    plotOutput("smokebirth_scotland"),
                    plotOutput("mothers_ages")
                    ),
            
            tabItem(tabName = "council_data",
                    h2("Council menu content"),
                    plotOutput("smokers_council"),
                    plotOutput("birthweight_council")
                    )
            
            )
        )   # DashboardBody bracket
    ) #Dasboardpage bracket
) # UI bracket
