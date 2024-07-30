
# Assuming df is your data frame
years_to_keep <- c(2006, 2008, 2010, 2014, 2019, 2020, 2022)
filtered_df <- subset(df, album_release_year %in% years_to_keep)


  
  fig <- filtered_df%>%
    plot_ly(x = ~artist_name,
      y = ~tempo, 
      color = ~artist_name, 
      type = 'bar',
      frame = ~album_release_year, 
      text = ~artist_name, 
      hoverinfo = "text")
  

  fig <- fig %>% animation_button(
    x = 1, xanchor = "right", y = 0, yanchor = "bottom"
  )
  fig <- fig %>% animation_slider(
    currentvalue = list(prefix = "YEAR ", font = list(color="red"))
  )
  
  fig
  
  
  ###
  
  fig <- plot_ly(filtered_df,
                 x = ~artist_name,
                 y = ~tempo, 
                 color = ~artist_name, 
                 type = 'bar',
                 frame = ~album_release_year, 
                 text = ~artist_name, 
                 hoverinfo = "text")
  
  fig <- fig %>% animation_button(
    x = 1, xanchor = "right", y = 0, yanchor = "bottom"
  )
  fig <- fig %>% animation_slider(
    currentvalue = list(prefix = "YEAR ", font = list(color="red"))
  )
  
  fig
  
  
  #######
  
  # Aggregate tempo values by artist_name and album_release_year
  agg_df <- aggregate(tempo ~ artist_name + album_release_year, data = filtered_df, FUN = mean)
  
  # Create the animated bar plot
  fig <- plot_ly(agg_df,
                 x = ~artist_name,
                 y = ~tempo, 
                 color = ~artist_name, 
                 type = 'bar',
                 frame = ~album_release_year, 
                 text = ~artist_name, 
                 hoverinfo = "text")
  
  # Add animation button and slider
  fig <- fig %>% animation_button(
    x = 1, xanchor = "right", y = 0, yanchor = "bottom"
  )
  fig <- fig %>% animation_slider(
    currentvalue = list(prefix = "YEAR ", font = list(color="red"))
  )
  
  fig
  
  ###############
  
  library(plotly)
  
  # Your filtering code
  years_to_keep <- c(2006, 2008, 2010, 2014, 2019, 2020, 2022)
  filtered_df <- subset(df, album_release_year %in% years_to_keep)
  
  # Create the animated bar plot
  fig <- filtered_df %>%
    plot_ly(
      x = ~artist_name,
      y = ~tempo,
      color = ~artist_name,
      type = 'bar',
      frame = ~album_release_year,
      text = ~artist_name,
      hoverinfo = "text"
    )
  
  # Add animation button and slider
  fig <- fig %>% animation_button(
    x = 1, xanchor = "right", y = 0, yanchor = "bottom"
  )
  fig <- fig %>% animation_slider(
    currentvalue = list(prefix = "YEAR ", font = list(color="red"))
  )
  
  fig
  