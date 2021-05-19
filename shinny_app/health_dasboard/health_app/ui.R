
# Define UI for application
shinyUI(
    dashboardPage(
        dashboardHeader(title = tags$i("Scothland Health Dasboard")),
        
        
        # Sidebar content
        dashboardSidebar(
            
            # Home Menu
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
            
            # Scotland data Menu    
            sidebarMenu(id = "menu1",    
                menuItem("Scotland Data", tabName = "scotland_data", icon = icon("baby"))),
                
                conditionalPanel(
                    condition = "input.menu1 =='scotland_data'",
                    
                    radioButtons("scotland_comparison",
                                 "Comparison Selection",
                                 choices = c("Smoking Effects", "Age Effects"))
                    
                ),
            
            # Council data Menu      
            sidebarMenu(id = "menu1",    
                menuItem("Council Data", tabName = "council_data", icon = icon("plus"))),
                
                conditionalPanel(
                    condition = "input.menu1 =='council_data'",
                    
                    selectInput("council_selection",
                                "council",
                                choices = unique(low_birthweight$la_name)),
                    
                    radioButtons("council_comparison",
                                 "Comparison Selection",
                                 choices = c("Smoking Effects", "Age Effects"))
                ),
            
            # Stats data Menu
            sidebarMenu(id = "menu1",    
                        menuItem("Statistics", tabName = "stats", icon = icon("plus")),
                        
                        conditionalPanel(
                            condition = "input.menu1 =='stats'",
                            
                            radioButtons("stats_comparison",
                                         "Comparison Selection through the Years",
                                         choices = c("Smoking", "Mother's Age"))
                            )
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
                
                # Scotland menu content
                tabItem(tabName = "scotland_data",
                        h2("Scotland Data menu content"),
                        plotOutput("birth_scotland", "50%"),
                        
                        conditionalPanel(
                            condition = "input.scotland_comparison =='Smoking Effects'",
                            plotOutput("smokers_scotland", "50%"),
                            plotOutput("smokebirth_scotland", "50%")),
                        
                        conditionalPanel(
                            condition = "input.scotland_comparison =='Age Effects'",
                            plotOutput("mothers_ages_scotland", "50%"),
                            plotOutput("age_weight2_scotland", "50%"))
                ),
                
                # Council menu content
                tabItem(tabName = "council_data",
                        h2("Council menu content"),
                        plotOutput("birth_council", "50%"),
                        
                        conditionalPanel(
                            condition = "input.council_comparison =='Smoking Effects'",
                            plotOutput("smokers_council", "50%"),
                            plotOutput("smokebirth_council", "50%")),
                        
                        conditionalPanel(
                            condition = "input.council_comparison =='Age Effects'",
                            plotOutput("mothers_ages_council", "50%"),
                            plotOutput("age_weight2_council", "50%"))
                ),
                
                # Stats menu content
                tabItem(tabName = "stats",
                        h2("Statistics data"),
                        plotOutput("weights_hist_stats"),
                        
                        conditionalPanel(
                            condition = "input.stats_comparison =='Smoking'",
                            plotOutput("smoker_hist_stats")),
                        
                        conditionalPanel(
                            condition = "input.stats_comparison =='Mother\\'s Age'",
                            plotOutput("ages_hist_stats"))
                        
                        #plotOutput("weights_hist_stats")
                        # plotOutput("smoker_stats_stats"),
                )
            )
            
        )   # DashboardBody bracket
    ) #Dasboardpage bracket
) # UI bracket
