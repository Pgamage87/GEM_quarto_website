library(plotly)

# Aggregate data to get average values for each year and artist
agg_df <- aggregate(cbind(danceability, speechiness, acousticness, liveness) ~ album_release_year + artist_name, data = df, FUN = mean)

# Define custom colors for Beyoncé and Taylor Swift
custom_colors <- c("Beyoncé" = "blue", "Taylor Swift" = "red")

# Plot danceability subplot
fig1 <- plot_ly(agg_df, x = ~album_release_year, y = ~danceability, color = ~artist_name, 
                type = 'scatter', mode = 'markers', marker = list(line = list(width = 3)), 
                colors = custom_colors, legendgroup = ~artist_name) %>%
  layout(legend = list(itemsizing = "constant", title=list(text='<b> Artist </b>')))%>%
  layout(xaxis = list(showgrid = FALSE),yaxis = list(showgrid = FALSE))

# Plot speechiness subplot
fig2 <- plot_ly(agg_df, x = ~album_release_year, y = ~speechiness, color = ~artist_name,
                type = 'scatter', mode = 'markers', marker = list(line = list(width = 3)), 
                colors = custom_colors, legendgroup = ~artist_name,showlegend = F)%>%
  layout(xaxis = list(showgrid = FALSE),yaxis = list(showgrid = FALSE)) 

# Plot acousticness subplot
fig3 <- plot_ly(agg_df, x = ~album_release_year, y = ~acousticness, color = ~artist_name,
                type = 'scatter', mode = 'markers', marker = list(line = list(width = 3)), 
                colors = custom_colors, legendgroup = ~artist_name,showlegend = F)%>%
  layout(xaxis = list(showgrid = FALSE),yaxis = list(showgrid = FALSE))

# Plot liveness subplot
fig4 <- plot_ly(agg_df, x = ~album_release_year, y = ~liveness, color = ~artist_name,
                type = 'scatter', mode = 'markers', marker = list(line = list(width = 3)), 
                colors = custom_colors, legendgroup = ~artist_name,showlegend = F)%>%
  layout(xaxis = list(showgrid = FALSE),yaxis = list(showgrid = FALSE))

# Combine subplots
fig <- subplot(fig1, fig2, fig3, fig4, nrows = 2, shareX = T) %>% 
  layout(title = "Average Music Properties of Beyoncé and Taylor Swift's Songs",
         xaxis = list( 
           zerolinecolor = '#000', 
           zerolinewidth = 2), 
         yaxis = list( 
           zerolinecolor = '#000', 
           zerolinewidth = 2))

annotations <- list( 
  list( 
    x = 0.2,  
    y = 1.0,  
    text = "Danceability",  
    xref = "paper",  
    yref = "paper",  
    xanchor = "center",  
    yanchor = "bottom",  
    showarrow = FALSE 
  ),  
  list( 
    x = 0.8,  
    y = 1,  
    text = "Speechiness",  
    xref = "paper",  
    yref = "paper",  
    xanchor = "center",  
    yanchor = "bottom",  
    showarrow = FALSE 
  ),  
  list( 
    x = 0.2,  
    y = 0.45,  
    text = "Acousticness",  
    xref = "paper",  
    yref = "paper",  
    xanchor = "center",  
    yanchor = "bottom",  
    showarrow = FALSE 
  ),
  list( 
    x = 0.8,  
    y = 0.45,  
    text = "Liveness",  
    xref = "paper",  
    yref = "paper",  
    xanchor = "center",  
    yanchor = "bottom",  
    showarrow = FALSE 
  ))

fig <- fig %>% layout(annotations = annotations) 
fig


######



library(plotly)

# Aggregate data to get average values for each year and artist
agg_df <- aggregate(cbind(danceability, speechiness, acousticness, liveness) ~ album_release_year + artist_name, data = df, FUN = mean)

# Define custom colors for Beyoncé and Taylor Swift
custom_colors <- c("Beyoncé" = "blue", "Taylor Swift" = "red")



# Plot danceability bubble chart
fig1 <- plot_ly(agg_df, x = ~album_release_year, y = ~danceability, 
                size = ~danceability, color = ~artist_name, 
                type = 'scatter', mode = 'markers', 
                marker = list(sizemode = 'diameter', sizeref = 1.6, line = list(width = 2)), 
                colors = custom_colors, legendgroup = ~artist_name, showlegend = FALSE) %>%
  layout(xaxis = list(showgrid = FALSE),yaxis = list(showgrid = FALSE)) 

# Plot speechiness bubble chart
fig2 <- plot_ly(agg_df, x = ~album_release_year, y = ~speechiness, 
                size = ~speechiness, color = ~artist_name, 
                type = 'scatter', mode = 'markers', 
                marker = list(sizemode = 'diameter', sizeref = 1.6, line = list(width = 2)), 
                colors = custom_colors, legendgroup = ~artist_name, showlegend = FALSE) %>%
  layout(xaxis = list(showgrid = FALSE),yaxis = list(showgrid = FALSE)) 

# Plot acousticness bubble chart
fig3 <- plot_ly(agg_df, x = ~album_release_year, y =  ~acousticness, 
                size = ~acousticness, color = ~artist_name, 
                type = 'scatter', mode = 'markers', 
                marker = list(sizemode = 'diameter', sizeref = 1.6, line = list(width = 2)), 
                colors = custom_colors, legendgroup = ~artist_name, showlegend = FALSE) %>%
  layout(xaxis = list(showgrid = FALSE),yaxis = list(showgrid = FALSE)) 

# Plot liveness bubble chart
fig4 <- plot_ly(agg_df, x = ~album_release_year, y = ~liveness, 
                size = ~liveness, color = ~artist_name, 
                type = 'scatter', mode = 'markers', 
                marker = list(sizemode = 'diameter', sizeref = 1.6, line = list(width = 2)), 
                colors = custom_colors, legendgroup = ~artist_name, showlegend = FALSE) %>%
  layout(xaxis = list(showgrid = FALSE,zerolinecolor = '#000', 
                      zerolinewidth = 2),yaxis = list(showgrid = FALSE, zerolinecolor = '#000', 
                                                      zerolinewidth = 2))
 

# Combine subplots
#subplot(fig1, fig2, fig3, fig4, nrows = 2, shareX = TRUE)

#fig <- subplot(fig1, fig2, fig3, fig4, nrows = 2, shareX = T) %>% 
  #layout(title = "Average Music Properties of Beyoncé and Taylor Swift's Songs")

fig <- subplot(fig1, fig2, fig3, fig4, nrows = 2, shareX = T) %>% 
  layout(title = "Average Music Properties of Beyoncé and Taylor Swift's Songs",
         xaxis = list( 
           zerolinecolor = '#000', 
           zerolinewidth = 2), 
         yaxis = list( 
           zerolinecolor = '#000', 
           zerolinewidth = 2))

annotations <- list( 
  list( 
    x = 0.2,  
    y = 1.0,  
    text = "Danceability",  
    xref = "paper",  
    yref = "paper",  
    xanchor = "center",  
    yanchor = "bottom",  
    showarrow = FALSE 
  ),  
  list( 
    x = 0.8,  
    y = 1,  
    text = "Speechiness",  
    xref = "paper",  
    yref = "paper",  
    xanchor = "center",  
    yanchor = "bottom",  
    showarrow = FALSE 
  ),  
  list( 
    x = 0.2,  
    y = 0.45,  
    text = "Acousticness",  
    xref = "paper",  
    yref = "paper",  
    xanchor = "center",  
    yanchor = "bottom",  
    showarrow = FALSE 
  ),
  list( 
    x = 0.8,  
    y = 0.45,  
    text = "Liveness",  
    xref = "paper",  
    yref = "paper",  
    xanchor = "center",  
    yanchor = "bottom",  
    showarrow = FALSE 
  ))

fig <- fig %>% layout(annotations = annotations) 
fig


