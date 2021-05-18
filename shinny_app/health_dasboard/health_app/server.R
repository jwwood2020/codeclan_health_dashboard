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
                scale_x_continuous(breaks = 2002:2019) +
                scale_y_continuous(limits = c(0, NA)) +
                geom_smooth(method=lm , color="grey", se = FALSE) +
                labs(x = "Year",
                     y = "Percentage of antenatal smokers",
                     title = "Fewer new mothers in Scotland are smokers") +
                theme_minimal()
        
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
                     y = "Percentage of low-weight births",
                     title = "Fewer newborns in Scotland are being classified as having low birthweight")
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
                     y = "% smoking",
                     size = "% of births classed as low birthweight",
                     title = "How have smoking and low birthweights in Scotland changed over time?") 
            
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
                scale_x_discrete(breaks = 2002:2019) +
                scale_y_continuous(limits = c(0, NA)) +
                #  geom_smooth(method=lm , color="red", se = FALSE) +
                labs(x = "Year",
                     y = "Percentage of first-time mothers",
                     title = "Are first-time mothers in Scotland getting older?")
        })
        
        output$age_weight_scotland <- renderPlot({
            low_birthweight %>% 
                filter(feature_code == "S92000003") %>% 
                ggplot() +
                aes(x = older_ratio,
                    y = weight_ratio,) +
                geom_point() +
                geom_smooth(method=lm , color="red") +
                labs(x = "Percentage of first-time mothers",
                     y = "Percentage of low-weight births",
                     title = "Is there a relationship between low birthweight and mother's age?",
                     subtitle = "Plot of low birthweight % vs mothers age band %, Scotland 2002 - 2019") +
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
                     y = "Percentage of first-time mothers aged 35+",
                     title = "Is there a relationship between low birthweight and mother's age?",
                     subtitle = "Plot of low birthweight % vs older mothers %, Scotland 2002 - 2019",
                     size = "% low birthweight") +
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
                     title = "Are more babies being breastfed?")
        })
        
        
        
    #Council Tab data
        
        output$smokers_council <- renderPlot({
            smokers %>% 
                filter(la_name == "Scotland" | la_name == input$council_selection) %>% 
                ggplot() +
                aes(x = year,
                    y = smoker_ratio,
                    fill = la_name) +
                geom_point() +
                geom_line() +
                scale_x_continuous(breaks = 2002:2019) +
                scale_y_continuous(limits = c(0, NA)) +
                labs(x = "Year",
                     y = "Percentage of antenatal smokers",
                     title = "Antenatal smokers") +
                theme_minimal()
            
        })
        output$birth_council <- renderPlot({
            low_birthweight %>% 
                filter(la_name == "Scotland" | la_name == input$council_selection) %>% 
                ggplot() +
                aes(x = year,
                    y = weight_ratio,
                    fill = la_name) +
                geom_point() +
                geom_line() +
                geom_smooth(method=lm , color="grey", se = FALSE) +
                labs(x = "Year",
                     y = "Percentage of low-weight births",
                     title = "Fewer newborns in Scotland are being classified as having low birthweight")
        })
        
        output$smokebirth_council <- renderPlot({
            low_birthweight %>%
                filter(la_name == "Scotland" | la_name == input$council_selection) %>% 
                ggplot() +
                aes(x = year, 
                    y = smoker_ratio,
                    size = weight_ratio,
                    fill = la_name) +
                geom_point() +
                #geom_smooth(method=lm , color="red", se = FALSE) +
                labs(x = "Year",
                     y = "% smoking",
                     size = "% of births classed as low birthweight",
                     title = "How have smoking and low birthweights in Scotland changed over time?") 
            
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
                     title = "Are first-time mothers in Scotland getting older?")
        })
        
        output$age_weight_council <- renderPlot({
            low_birthweight %>% 
                filter(la_name == "Scotland" | la_name == input$council_selection) %>% 
                ggplot() +
                aes(x = older_ratio,
                    y = weight_ratio,
                    fill = la_name) +
                geom_point() +
                geom_smooth(method=lm , color="red") +
                labs(x = "Percentage of first-time mothers",
                     y = "Percentage of low-weight births",
                     title = "Is there a relationship between low birthweight and mother's age?",
                     subtitle = "Plot of low birthweight % vs mothers age band %, Scotland 2002 - 2019") +
                facet_wrap(~ age_band)
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
                     subtitle = "Plot of low birthweight % vs older mothers %, Scotland 2002 - 2019",
                     size = "% low birthweight") +
                facet_wrap(~ age_band)
        })
        
        output$breastfed_council  <- renderPlot({
            breastfeeding %>% 
                filter(la_name == "Scotland" | la_name == input$council_selection) %>% 
                ggplot() +
                aes(x = year,
                    y = feeding_ratio,
                    fill = la_name) +
                geom_point() +
                scale_x_continuous(breaks = 2002:2019) +
                scale_y_continuous(limits = c(0, NA)) +
                geom_smooth(method=lm , color="red", se = FALSE) +
                labs(x = "Year",
                     y = "Percentage of babies breastfed",
                     title = "Are more babies being breastfed?")
        })
        
})