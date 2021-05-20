# Define server logic required
shinyServer(function(input, output) {
        
    
    #Scotland Tab data
    
        output$smokers_scotland <- renderPlot({
            
             smokers %>% 
                filter(feature_code == "S92000003") %>% 
                ggplot() +
                aes(x = year,
                    y = smoker_ratio) +
                geom_point() +
                #scale_x_continuous(breaks = 2002:2019) +
                #scale_y_continuous(limits = c(0, NA)) +
                geom_smooth(method=lm , color="grey", se = FALSE) +
                labs(x = "Year",
                     y = "Percentage of new mothers smoking",
                     title = "Antenatal smokers in Scotland") +
                theme_classic() +
                theme(plot.title = element_text(face = "bold", size = 24),
                      plot.background = element_rect(colour = "black", size = 2))
        
        })
        
        output$birth_scotland <- renderPlot({
            low_birthweight %>% 
                filter(feature_code == "S92000003") %>% 
                ggplot() +
                aes(x = year,
                    y = weight_ratio,) +
                geom_point() +
                geom_smooth(method=lm , color="grey", se = FALSE) +
                labs(x = "Year",
                     y = "Percentage of births class as low weight",
                     title = "Low birthweight in Scotland") +
                theme_classic() +
                theme(plot.title = element_text(face = "bold", size = 24),
                      plot.background = element_rect(colour = "black", size = 2))
        })
        
        output$smokebirth_scotland <- renderPlot({
            low_birthweight %>% 
                filter(feature_code == "S92000003") %>% 
                ggplot() +
                aes(x = year, 
                    y = smoker_ratio,
                    size = weight_ratio
                ) +
                geom_point() +
                #geom_smooth(method=lm , color="red", se = FALSE) +
                labs(x = "Year",
                     y = "Percentage of new mothers smoking",
                     size = "Births classed as low birthweight",
                     title = "Change in smoking & low birthweight") +
                theme_classic() +
                theme(plot.title = element_text(face = "bold", size = 24),
                      plot.background = element_rect(colour = "black", size = 2))
            
        })
        
        output$mothers_ages_scotland  <- renderPlot({
            mothers_ages%>% 
                filter(feature_code == "S92000003") %>% 
                ggplot() +
                aes(x = year,
                    y = ratio,
                    group = age_band,
                    colour = age_band) +
                geom_point() +
                geom_line() +
                #scale_x_discrete(breaks = 2002:2019) +
                #scale_y_continuous(limits = c(0, NA)) +
                #  geom_smooth(method=lm , color="red", se = FALSE) +
                labs(x = "Year",
                     y = "Percentage of first-time mothers",
                     title = "First-time mothers in Scotland by age-band") +
                theme_classic() +
                theme(plot.title = element_text(face = "bold", size = 24),
                      plot.background = element_rect(colour = "black", size = 2))
        })
        
        output$age_weight_scotland <- renderPlot({
            low_birthweight %>% 
                filter(feature_code == "S92000003") %>% 
                ggplot() +
                aes(x = older_ratio,
                    y = weight_ratio,) +
                geom_point() +
                #geom_smooth(method=lm , color="red") +
                labs(x = "Percentage of first-time mothers",
                     y = "Percentage of low-weight births",
                     title = "Change in low birthweight and mother's age?",
                     subtitle = "Plot of low birthweight % vs mothers age band %, Scotland 2002 - 2019") +
                theme_classic() +
                facet_wrap(~ age_band)
        })
        
        output$age_weight2_scotland  <- renderPlot({
            low_birthweight %>% 
                filter(feature_code == "S92000003") %>% 
                ggplot() +
                aes(x = year,
                    y = older_ratio,
                    size = weight_ratio) +
                geom_point() +
                # geom_smooth(method=lm , color="red") +
                labs(x = "Year",
                     y = "Percentage of first-time mothers",
                     title = "Change in low birthweight and mother's age",
                     size = "% low birthweight") +
                theme_classic() +
                facet_wrap(~ age_band)
        })
        
        output$breastfed_scotland  <- renderPlot({
            breastfeeding %>% 
                filter(feature_code == "S92000003") %>% 
                ggplot() +
                aes(x = year,
                    y = feeding_ratio) +
                geom_point() +
                scale_x_continuous(breaks = 2002:2019) +
                scale_y_continuous(limits = c(0, NA)) +
                geom_smooth(method=lm , color="red", se = FALSE) +
                labs(x = "Year",
                     y = "Percentage of babies breastfed",
                     title = "G7 Are more babies being breastfed?")
        })
        
        
        
    #Council Tab data
        
        output$smokers_council <- renderPlot({
            smokers %>% 
                filter(la_name == "Scotland" | la_name == input$council_selection) %>% 
                ggplot() +
                aes(x = year,
                    y = smoker_ratio,
                    colour = la_name) +
                geom_point() +
                geom_line() +
               # scale_x_continuous(breaks = 2002:2019) +
                #scale_y_continuous(limits = c(0, NA)) +
                labs(x = "Year",
                     y = "Percentage of new mothers smoking",
                     title = "Antenatal smokers",
                     colour = "Council area") +
                theme_classic() +
                theme(plot.title = element_text(face = "bold", size = 24),
                      legend.position = c(1, 1), legend.justification = c(1, 1),
                      plot.background = element_rect(colour = "black", size = 2))
            
            
        })
        output$birth_council <- renderPlot({
            low_birthweight %>% 
                filter(la_name == "Scotland" | la_name == input$council_selection) %>% 
                ggplot() +
                aes(x = year,
                    y = weight_ratio,
                    colour = la_name) +
                geom_point() +
                geom_line() +
               # geom_smooth(method=lm , color="grey", se = FALSE) +
                labs(x = "Year",
                     y = "Percentage of births classed as low birthweight",
                     title = "Low Birthweight",
                     colour = "Council area") +
                theme_classic() +
                theme(plot.title = element_text(face = "bold", size = 24),
                      legend.position = c(1, 1), legend.justification = c(1, 1),
                      plot.background = element_rect(colour = "black", size = 2))
        })
        
        output$smokebirth_council <- renderPlot({
            low_birthweight %>%
                filter(la_name == "Scotland" | la_name == input$council_selection) %>% 
                ggplot() +
                aes(x = year, 
                    y = smoker_ratio,
                    size = weight_ratio,
                    colour = la_name) +
                geom_point() +
                #geom_smooth(method=lm , color="red", se = FALSE) +
                labs(x = "Year",
                     y = "% smoking",
                     size = "% of births classed as low birthweight",
                     title = "Change in smoking and low birthweights",
                     colour = "Council area",
                     size = "% loweight births") +
                theme_classic() +
                theme(plot.title = element_text(face = "bold", size = 24),
                      plot.background = element_rect(colour = "black", size = 2))
            
        })
        
        output$mothers_ages_council  <- renderPlot({
            mothers_ages_m %>% 
                filter(la_name == "Scotland" | la_name == input$council_selection) %>% 
                ggplot() +
                aes(x = year,
                    y = ratio,
                    group = age_band,
                    colour = age_band) +
                geom_point() +
                geom_line(fill = la_name) +
                scale_x_discrete(breaks = 2002:2019) +
                scale_y_continuous(limits = c(0, NA)) +
                #  geom_smooth(method=lm , color="red", se = FALSE) +
                labs(x = "Year",
                     y = "Percentage of first-time mothers",
                     title = "G4 Are first-time mothers in Scotland getting older?")
        })
        
        
        output$age_weight2_council  <- renderPlot({
            low_birthweight %>% 
                filter(la_name == "Scotland" | la_name == input$council_selection) %>% 
                ggplot() +
                aes(x = year,
                    y = older_ratio,
                    size = weight_ratio,
                    fill = la_name) +
                geom_point() +
                # geom_smooth(method=lm , color="red") +
                labs(x = "Year",
                     y = "Percentage of first-time mothers aged 35+",
                     title = "Is there a relationship between low birthweight and mother's age?",
                     subtitle = "G6 Plot of low birthweight % vs older mothers %, Scotland 2002 - 2019",
                     size = "% low birthweight") +
                facet_wrap(~ age_band)
        })
        
        # Stats data Menu
        
        output$smoker_hist_stats <- renderPlot({
            smokers %>%
                filter(year %in% c("2010", "2019")) %>%
                ggplot() +
                aes(x = smoker_ratio) +
                geom_histogram(bins = 10,
                               colour = "white") +
                facet_wrap(~ year) +
                labs(x = "Percentage of new mothers who smoke",
                     y = "Number of local councils",
                     title = "Histogram of antenatal smoking percentages") +
                theme_classic() +
                theme(plot.title = element_text(face = "bold", size = 24),
                      plot.background = element_rect(colour = "black", size = 2))
        })

        output$smoker_stats_stats <- renderDataTable({
        smokers %>%
            filter(year %in% c("2010", "2019")) %>%
            group_by(year) %>%
            summarise(mean_smoking = mean(smoker_ratio),
                      median_smoking = median(smoker_ratio),
                      min_smoking = min(smoker_ratio),
                      max_smoking = max(smoker_ratio),
                      sd_smoking = sd(smoker_ratio))
        })

        output$ages_hist_stats <- renderPlot({
            mothers_ages %>%
                filter(year %in% c("2010", "2019")) %>%
                ggplot() +
                aes(x = ratio) +
                geom_histogram(bins = 10,
                               colour = "white") +
                facet_wrap(year ~ age_band) +
                labs(y = "Number of councils",
                     x = "Percentage of first-time mothers in age band",
                     title = "Histogram of first-time mother age bands") +
                theme_classic() +
                theme(plot.title = element_text(face = "bold", size = 24),
                      plot.background = element_rect(colour = "black", size = 2))
        })

        output$weights_hist_stats <- renderPlot({
            low_birthweight %>%
                filter(year %in% c("2010", "2019")) %>%
                ggplot() +
                aes(x = weight_ratio) +
                geom_histogram(bins = 10,
                               colour = "white") +
                facet_wrap(~ year) +
                labs(y = "Number of councils",
                     x = "Percentage of births classed as low weight",
                     title = "Histogram of low birthweights") +
                theme_classic() +
                theme(plot.title = element_text(face = "bold", size = 24),
                      plot.background = element_rect(colour = "black", size = 2))
        })

        output$weights_h_stats <- renderDataTable({
            low_birthweight %>%
                filter(year %in% c("2010", "2019")) %>%
                group_by(year) %>%
                summarise(mean = mean(weight_ratio),
                          median = median(weight_ratio),
                          min = min(weight_ratio),
                          max = max(weight_ratio),
                          sd = sd(weight_ratio))
        })
        
        # Home Tab Menu
    
        output$alcohol_home <- renderPlot({
            scotland_simple %>% 
                left_join(alcohol, by = c("HBCode" = "feature_code")) %>%
                filter(sex == input$sex_selection | date_code == input$year_selection) %>%
                ggplot() +
                geom_sf(aes(group = hb_name, fill = value)) +
                theme_minimal() +
                theme(panel.grid.major = element_blank(), axis.text = element_blank()) +
                ggtitle("Alcohol Consumption in Scotland") + 
                scale_fill_gradient(low = "green", high = "red")
        })
        
        output$obesity_home <- renderPlot({
            scotland_simple %>% 
                left_join(obesity, by = c("HBCode" = "feature_code")) %>% 
                filter(sex == input$sex_selection | date_code == input$year_selection) %>%
                ggplot() +
                geom_sf(aes(group = hb_name, fill = value)) +
                theme_minimal() +
                theme(panel.grid.major = element_blank(), axis.text = element_blank()) +
                ggtitle("Obesity in Scotland") + 
                scale_fill_gradient(low = "green", high = "red")
        })
        
        output$smoking_home <- renderPlot({
            scotland_simple %>% 
                left_join(smoking_status, by = c("HBCode" = "feature_code")) %>% 
                filter(sex == input$sex_selection | date_code == input$year_selection) %>%
                ggplot() +
                geom_sf(aes(group = hb_name, fill = value)) +
                theme_minimal() +
                theme(panel.grid.major = element_blank(), axis.text = element_blank()) +
                ggtitle("Smoking Status in Scotland") + 
                scale_fill_gradient(low = "green", high = "red")
        })
        
        output$e_cig_home <- renderPlot({
            scotland_simple %>% 
                left_join(e_cig, by = c("HBCode" = "feature_code")) %>% 
                filter(sex == input$sex_selection | date_code == input$year_selection) %>%
                ggplot() +
                geom_sf(aes(group = hb_name, fill = value)) +
                theme_minimal() +
                theme(panel.grid.major = element_blank(), axis.text = element_blank()) +
                ggtitle("E-cigarette use in Scotland") + 
                scale_fill_gradient(low = "green", high = "red")
        })
        
        # Quick Stats
        
        output$quickstat1 <- renderValueBox({
            valueBox(
                value = tags$p("Alcoholic %", style = "font-size: 100%;"),
                subtitle = tags$p(quickstat1 <- alcohol %>%
                                      filter(sex == input$sex_selection, date_code == input$year_selection) %>%
                                      filter(hb_name == "Scotland") %>%
                                      filter(alcohol_consumption == "Hazardous/Harmful drinker") %>%
                                      select(value) %>%
                                      pull(), style = "font-size: 200%;"),
                icon = icon("wine-bottle"),
                color = "blue"
            )
            })
        
        output$quickstat2 <- renderValueBox({
            valueBox(
                value = tags$p("Obesity %", style = "font-size: 100%;"),
                subtitle = tags$p(obesity %>%
                                      filter(sex == input$sex_selection, date_code == input$year_selection) %>%
                                      filter(hb_name == "Scotland") %>%
                                      filter(obesity == "Obese") %>%
                                      select(value) %>%
                                      pull(), style = "font-size: 200%;"),
                icon = icon("arrows-alt-h"),
                color = "blue"
            )
        })
        
        output$quickstat3 <- renderValueBox({
            valueBox(
                value = tags$p("Smoking %", style = "font-size: 100%;"),
                subtitle = tags$p(smoking_status %>%
                                          filter(sex == input$sex_selection, date_code == input$year_selection) %>%
                                          filter(hb_name == "Scotland") %>%
                                          filter(smoking_status == "Current smoker") %>%
                                          select(value) %>%
                                          pull(), style = "font-size: 200%;"),
                icon = icon("smoking"),
                color = "blue"
            )
        })
        
        output$quickstat4 <- renderValueBox({
            valueBox(
                value = tags$p("E Cig %", style = "font-size: 100%;"),
                subtitle = tags$p(quickstat1 <- alcohol %>%
                                      filter(sex == input$sex_selection, date_code == input$year_selection) %>%
                                      filter(hb_name == "Scotland") %>%
                                      filter(alcohol_consumption == "Hazardous/Harmful drinker") %>%
                                      select(value) %>%
                                      pull(), style = "font-size: 200%;"),
                icon = icon("power-off"),
                color = "blue"
            )
        })
})

