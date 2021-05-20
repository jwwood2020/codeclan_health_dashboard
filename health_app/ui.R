
# Define UI for application
shinyUI(
    dashboardPage(
        dashboardHeader(title = tags$i("Scotland Health Dashboard")),
        
        
        # Sidebar content
        dashboardSidebar(
            
            # Home Menu
            sidebarMenu(id = "menu1",
                menuItem("Home", tabName = "home", icon = icon("home"))),
            
            conditionalPanel(
                condition = "input.menu1 =='home'",
                
                selectInput("sex_selection",
                            "Gender Data Selection",
                            choices = unique(obesity$sex)),
                
                selectInput("year_selection",
                            "Year Selection",
                            choices = unique(obesity$date_code))
                    
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
                                "Council Selection",
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
                
                # Home Menu Content
                tabItem(tabName = "home",
                        
                h2("Welcome to the Scotland Health Dashboard"),
                h4("The dashboards and data available through this application are the 
                   result of ongoing collaboration between Scothish Public Heath Department and CodeClan D8 Team 1. 
                   The porpouse of this Dashboard on general LifStyle stats across Scotland and 
                   Baby Weight data across Scotland and by Concils as well. This Data can then be youse to make informed 
                   dicisions relating to Public Health of the people of Alba."),
                h4 ("Ps: We are the Best!!"),
                
                h3 ("Scotland LifeStyle Quick Stats"),
                h4 ("The following LifeStyle stats are the average across Scotland."),
                valueBoxOutput ("quickstat1", 3), 
                valueBoxOutput ("quickstat2", 3),
                valueBoxOutput ("quickstat3", 3),
                valueBoxOutput ("quickstat4", 3),
                
                h3("Council LifeStyle Stats"),
                h4("The following maps provide a detailed distribution of 
                   LifeStyle Stats across the counties in Scoltand"),
                br(),
                
                fluidRow(
                    column(6, plotOutput("alcohol_home")),
                    column(6, plotOutput("obesity_home"))),
                
                br(),
                
                fluidRow(
                    column(6, plotOutput("smoking_home")),
                    column(6, plotOutput("e_cig_home")))
                
                ),
                
                # Scotland menu content
                
                tabItem(tabName = "scotland_data",
                        h3 ("Scotland Birthweigh Data"),
                        h4 ("The following graphs provide information on birthweigh across Scotland as a whole. 
                            The effects of the mother's smoking habits and age,
                            can be compared by selecting the oprion on the right side."),
                        br(),
                        
                        fluidRow(column(6, plotOutput("birth_scotland"))),
                        br(),
                                 
                        conditionalPanel(
                            condition = "input.scotland_comparison =='Smoking Effects'",
                            fluidRow(
                                column(6, h4 ("Mother's smoking habit option Selected"), plotOutput("smokers_scotland")),
                                column(6, br(), br(), plotOutput("smokebirth_scotland")))
                        ),
                        
                        conditionalPanel(
                            condition = "input.scotland_comparison =='Age Effects'",
                            fluidRow(
                                column(6, h4 ("Mother's age option selected"), plotOutput("mothers_ages_scotland")),
                                column(6, br(), br(), plotOutput("age_weight2_scotland")))
                        )
                ),
                
                # Council menu content
                tabItem(tabName = "council_data",
                        h2 ("Council Birthweigh Data"),
                        h4 ("The following graphs provide information on birthweigh across Scotland and the 
                            Councils of Scotland, 
                            there by alerting council members if they fall below the average. 
                            The effects of the mother's smoking habits and age,
                            can be compared by selecting the oprion on the right side."),
                        
                        fluidRow(
                            column(6, plotOutput("birth_council"))),
                        br (),
                        
                        conditionalPanel(
                            condition = "input.council_comparison =='Smoking Effects'",
                            fluidRow(
                                column(6, h4 (" Mother's smoking habit option Selected"), plotOutput("smokers_council")),
                                column(6, br(), br(), plotOutput("smokebirth_council")))
                        ),
                        
                        conditionalPanel(
                            condition = "input.council_comparison =='Age Effects'",
                            fluidRow(
                                column(6, h4 (" Mother's age option selected"), plotOutput("mothers_ages_council")),
                                column(6, br(), br(), plotOutput("age_weight2_council")))
                        )
                ),
                
                # Stats menu content
                tabItem(tabName = "stats",
                        h2("Statistics data for Babybirth weight"),
                        h4("Do you want to add something here?"),
                        br(),
                        plotOutput("weights_hist_stats"),
                        br(),
                        
                        conditionalPanel(
                            condition = "input.stats_comparison =='Smoking'",
                            h4("stuff for smoker selection"),
                            plotOutput("smoker_hist_stats"),
                            br(),
                            dataTableOutput("weights_h_stats")),
                        
                        conditionalPanel(
                            condition = "input.stats_comparison =='Mother\\'s Age'",
                            h4("stuff for age selection"),
                            plotOutput("ages_hist_stats"),
                            br(),
                            dataTableOutput("smoker_stats_stats"))
                        
                )
            )
            
        )   # DashboardBody bracket
    ) #Dasboardpage bracket
) # UI bracket
