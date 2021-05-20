
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
                menuItem("Scotland Data", tabName = "scotland_data", icon = icon("plus"))),

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
                                choices = sort(unique(low_birthweight$la_name))),

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

                h2("Health Survey Results - Scotland"),
               # h4("This page shows summary Scotland-level results from the Scottish Health Survey for four
                 #  lifestyle metrics relating to Excess Alcohol Consumption, Smoking and Obesity."),

               # h3 ("Health Survey Results - Scotland"),
               # h4 ("The following LifeStyle stats are the average across Scotland."),
                valueBoxOutput ("quickstat1", 3),
                valueBoxOutput ("quickstat2", 3),
                valueBoxOutput ("quickstat3", 3),
                valueBoxOutput ("quickstat4", 3),
                h5(" - Alcohol: Prevalence of hazardous or harmful drinking"),
                h5(" - Obesity: % of adults who are obese"),
                h5(" - Smoking: % of adults who smoke"),
                h5(" - E Cig: % of adults who use e-cigarettes"),
                h2("Health Survey Results - Health Board level"),
               # h4("The maps show how the four metrics vary across local Health Board regions"),
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
                        h3 ("Low Birthweight - Scotland"),
                        h4 ("The following graphs provide information on prevalence of low birthweight
                            in Scotland.
                            The relationship with antenatal smoking or mothers' age
                            can be explored by selecting the option on the side panel."),
                        br(),

                        fluidRow(
                            column(8, plotOutput("birth_scotland")),
                            column(4, icon("baby", style="font-size: 300px"))),

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
                        h2 ("Low birthweight - Council area"),
                        h4 ("The following graphs provide information on prevalence of low birthweight
                            in Scotland.
                            The relationship with antenatal smoking or mothers' age
                            can be explored by selecting the option on the side panel"),


                        br(),

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
                            h4("and stuff here"),
                            dataTableOutput("smoker_stats_stats"))

                )
            )

        )   # DashboardBody bracket
    ) #Dasboardpage bracket
) # UI bracket
