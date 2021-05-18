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
        output$mothers_ages <- renderPlot({
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
        
    #Council Tab data
        
        output$smokers_council <- renderPlot({
            smokers %>% 
                # Can have a dropdown selector in the dashboard to filter on feature_code
                # so that we can select individual council areas
                ggplot() +
                aes(x = year,
                    y = smoker_ratio) +
                geom_point() +
                scale_x_continuous(breaks = 2002:2019) +
                scale_y_continuous(limits = c(0, NA)) +
                labs(x = "Year",
                     y = "Percentage of antenatal smokers",
                     title = "Antenatal smokers") +
                theme_minimal()
            
        })
        
        output$birthweight_council <- renderPlot({
            low_birthweight %>% 
                ggplot() +
                aes(x = year,
                    y = weight_ratio,) +
                geom_point() +
                labs(x = "Year",
                     y = "Percentage of low-weight births",
                     title = "tbc")
        })
        
})
