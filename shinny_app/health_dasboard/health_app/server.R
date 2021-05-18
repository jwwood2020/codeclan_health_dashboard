# Define server logic required
shinyServer(function(input, output) {
        
    
    #Scotland Tab data
    
        output$smokers_scotland <- renderPlot({
        smokers %>% 
            # Can have a dropdown selector in the dashboard to filter on feature_code
            # so that we can show council areas
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
    
        output$smokers_council <- renderPlot({
        smokers %>% 
            # Can have a dropdown selector in the dashboard to filter on feature_code
            # so that we can select individual council areas
            filter(feature_code %in% council_vector) %>% 
            ggplot() +
            aes(x = year,
                y = smoker_ratio) +
            geom_point() +
            scale_x_continuous(breaks = 2002:2019) +
            scale_y_continuous(limits = c(0, NA)) +
            labs(x = "Year",
                 y = "Percentage of antenatal smokers",
                 title = "Fewer new mothers in Scotland are smokers") +
            theme_minimal()
        
        })
        
    #Council Tab data
        
        
})
