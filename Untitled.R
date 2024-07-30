fig <- plot_ly(df5, x = ~album_release_year, y = ~danceability,name = 'danceability', type = 'scatter', mode = 'markers',size = ~danceability, 
               marker = list(opacity = 0.5, sizeref = 0.5))
fig <- fig %>% add_trace(y = ~liveness , size = ~liveness ,name = 'liveness', mode = 'markers') 
fig <- fig %>% add_trace(y = ~speechiness, size = ~speechiness,name = 'speechiness', mode = 'markers')
fig <- fig %>% add_trace(y = ~acousticness, size = ~acousticness,name = 'acousticness', mode = 'markers')
fig <- fig %>% layout(title = 'Number of Applications, Deposits and Admissions over the Years',
                      xaxis = list(showgrid = FALSE),
                      yaxis = list(showgrid = FALSE))


plot_ly(df5, x = ~artist_name, y = ~danceability, size = ~danceability, 
        type = 'scatter', mode = 'markers', text = ~paste("Artist: ", artist_name, "<br>Danceability: ", danceability)) %>%
  layout(title = "Danceability Across Different Artists",
         xaxis = list(title = "Artist Name"),
         yaxis = list(title = "Danceability"),
         hovermode = "closest")


p <- plot_ly(df5, x = ~artist_name, y = ~danceability, 
             size = ~danceability, frame = ~album_release_year,
             type = 'scatter', mode = 'markers',
             text = ~paste("Artist: ", artist_name, "<br>Danceability: ", danceability, "<br>Year: ", album_release_year)) %>%
  layout(title = "Danceability Across Different Artists Over the Years",
         xaxis = list(title = "Artist Name"),
         yaxis = list(title = "Danceability"),
         hovermode = "closest")
p


# Create the animated bubble plot with different colors for different categories
p <- plot_ly(df5, x = ~artist_name, y = ~danceability, 
             size = ~danceability, frame = ~album_release_year,
             color = ~artist_name,
             colors = colors,
             type = 'scatter', mode = 'markers',
             text = ~paste("Artist: ", artist_name, "<br>Danceability: ", danceability, "<br>Year: ", album_release_year)) %>%
  layout(title = "Danceability Across Different Artists Over the Years",
         xaxis = list(title = "Artist Name"),
         yaxis = list(title = "Danceability"),
         hovermode = "closest")

# Display the animated plot
p



#############

# Get the counts of songs per artist
artist_counts <- table(df5$artist_name)
artist_counts_df <- data.frame(artist_name = names(artist_counts), count = as.numeric(artist_counts))

# Sort the data by the count of songs
sorted_data <- artist_counts_df[order(artist_counts_df$count, decreasing = TRUE), ]

# Create the animated bar plot
p <- plot_ly(sorted_data, x = ~artist_name, y = ~count, type = 'bar', 
             text = ~paste("Artist: ", artist_name, "<br>Number of Songs: ", count)) %>%
  layout(title = "Top Artists Based on Number of Songs",
         xaxis = list(title = "Artist Name"),
         yaxis = list(title = "Number of Songs"),
         hovermode = "closest",
         updatemenus = list(
           list(
             type = "buttons",
             buttons = list(
               list(
                 label = "Play",
                 method = "animate",
                 args = list(list(frame = list(duration = 100, redraw = TRUE), fromcurrent = TRUE))
               )
             )
           )
         )) %>%
  animation_opts(frame = 100, redraw = TRUE)

# Display the animated bar plot
p




##########

# Get the counts of songs per artist per year
artist_counts <- table(df5$artist_name, df5$album_release_year)
artist_counts_df <- as.data.frame.table(artist_counts)
colnames(artist_counts_df) <- c("artist_name", "album_release_year", "count")

# Sort the data by the count of songs
sorted_data <- artist_counts_df[order(artist_counts_df$count, decreasing = TRUE), ]

# Create the animated bar plot
p <- plot_ly(sorted_data, x = ~artist_name, y = ~count, type = 'bar', 
             text = ~paste("Artist: ", artist_name, "<br>Number of Songs: ", count),
             frame = ~album_release_year) %>%
  layout(title = "Top Artists Based on Number of Songs",
         xaxis = list(title = "Artist Name"),
         yaxis = list(title = "Number of Songs"),
         hovermode = "closest",
         updatemenus = list(
           list(
             type = "buttons",
             buttons = list(
               list(
                 label = "Play",
                 method = "animate",
                 args = list(list(frame = list(duration = 1000, redraw = TRUE), fromcurrent = TRUE))
               )
             )
           )
         )) %>%
  animation_opts(frame = 1000, redraw = TRUE)

# Display the animated bar plot
p

###############################

# Load required libraries
library(plotly)
library(dplyr)
library(reshape2)

# Assuming df is your dataframe

# Filter the dataframe for Beyoncé and Taylor Swift
df_filtered <- df %>% filter(artist_name %in% c("Beyoncé", "Taylor Swift"))

# Group by artist_name and calculate the mean for each variable
df_mean <- df_filtered %>%
  group_by(artist_name) %>%
  summarize(across(c(Valence, danceability, energy, loudness, speechiness, acousticness, liveness, tempo), mean))

# Melt the dataframe for plotting
df_melted <- melt(df_mean, id.vars = "artist_name")

# Plot using Plotly
plot_ly(data = df_melted, x = ~variable, y = ~value, color = ~artist_name, type = "bar") %>%
  layout(title = "Comparison of Artists (Beyoncé vs Taylor Swift)",
         xaxis = list(title = "Variable"),
         yaxis = list(title = "Mean Value"),
         barmode = "group")


##############################################

# Load required libraries
library(plotly)
library(dplyr)
library(tidyr)  # for pivot_longer

# Load required libraries
library(plotly)
library(dplyr)
library(tidyr)  # for pivot_longer

# Assuming df is your dataframe

# Filter the dataframe for Beyoncé and Taylor Swift
df_filtered <- df %>% filter(artist_name %in% c("Beyoncé", "Taylor Swift"))

# Pivot the dataframe for plotting
df_long <- df_filtered %>%
  pivot_longer(cols = c(danceability, speechiness), names_to = "Variable", values_to = "Value")

# Plot using Plotly
plot_ly(data = df_long, x = ~album_release_year, y = ~Value, color = ~artist_name, 
        type = "scatter", mode = "lines", animation_group = ~Variable, 
        animation_frame = ~album_release_year) %>%
  add_annotations(
    text = "Danceability and Speechiness Over Time",
    xref = "paper", yref = "paper",
    x = 0.5, y = 1.05,
    showarrow = FALSE,
    font = list(size = 14)
  ) %>%
  layout(
    xaxis = list(title = "Year"),
    yaxis = list(title = "Value"),
    title = ""
  )

########################

# Filter the dataframe for Beyoncé and Taylor Swift
df_filtered <- df %>% filter(artist_name %in% c("Beyoncé", "Taylor Swift"))

# Pivot the dataframe for plotting
df_long <- df_filtered %>%
  pivot_longer(cols = c(danceability, speechiness), names_to = "Variable", values_to = "Value")

# Plot using Plotly
plot_ly(data = df_long, x = ~album_release_year, y = ~Value, color = ~artist_name, 
        type = "scatter", mode = "markers", marker = list(size = 10), 
        animation_frame = ~album_release_year, animation_group = ~Variable) %>%
  add_annotations(
    text = "Danceability and Speechiness Over Time",
    xref = "paper", yref = "paper",
    x = 0.5, y = 1.05,
    showarrow = FALSE,
    font = list(size = 14)
  ) %>%
  layout(
    xaxis = list(title = "Year"),
    yaxis = list(title = "Value"),
    title = ""
  )

################################

# Load required libraries
library(plotly)
library(dplyr)
library(tidyr)  # for pivot_longer

# Assuming df is your dataframe

# Filter the dataframe for Beyoncé and Taylor Swift
df_filtered <- df %>% filter(artist_name %in% c("Beyoncé", "Taylor Swift"))

# Pivot the dataframe for plotting
df_long <- df_filtered %>%
  pivot_longer(cols = c(danceability, speechiness), names_to = "Variable", values_to = "Value")

# Separate the data for danceability and speechiness
df_danceability <- df_long %>%
  filter(Variable == "danceability")

df_speechiness <- df_long %>%
  filter(Variable == "speechiness")

# Plot using Plotly
plot_ly() %>%
  add_trace(data = df_danceability, x = ~album_release_year, y = ~Value, color = ~artist_name, 
            type = "scatter", mode = "markers", marker = list(size = 10), 
            name = "Danceability") %>%
  add_trace(data = df_speechiness, x = ~album_release_year, y = ~Value, color = ~artist_name, 
            type = "scatter", mode = "markers", marker = list(size = 10), 
            name = "Speechiness") %>%
  add_annotations(
    text = "Danceability and Speechiness Over Time",
    xref = "paper", yref = "paper",
    x = 0.5, y = 1.05,
    showarrow = FALSE,
    font = list(size = 14)
  ) %>%
  layout(
    xaxis = list(title = "Year"),
    yaxis = list(title = "Value"),
    title = ""
  )

#################

# Load required libraries
library(plotly)
library(dplyr)
library(tidyr)  # for pivot_longer

# Assuming df is your dataframe

# Filter the dataframe for Beyoncé and Taylor Swift
df_filtered <- df %>% filter(artist_name %in% c("Beyoncé", "Taylor Swift"))

# Pivot the dataframe for plotting
df_long <- df_filtered %>%
  pivot_longer(cols = c(danceability, speechiness), names_to = "Variable", values_to = "Value")

# Separate the data for danceability and speechiness
df_danceability <- df_long %>%
  filter(Variable == "danceability")

df_speechiness <- df_long %>%
  filter(Variable == "speechiness")

# Plot using Plotly
plot_ly() %>%
  add_trace(data = df_danceability, x = ~album_release_year, y = ~Value, color = ~artist_name, 
            type = "scatter", mode = "markers", marker = list(size = 10), 
            name = "Danceability") %>%
  add_trace(data = df_speechiness, x = ~album_release_year, y = ~Value, color = ~artist_name, 
            type = "scatter", mode = "markers", marker = list(size = 10), 
            name = "Speechiness") %>%
  subplot(
    nrows = 1, shareX = TRUE,
    titleX = FALSE,
    title = list(
      text = "Danceability and Speechiness Over Time",
      xref = "paper",
      yref = "paper",
      x = 0.5,
      y = 1.05
    ),
    margin = 0.05
  ) %>%
  layout(
    xaxis = list(title = "Year"),
    yaxis = list(title = "Value"),
    showlegend = TRUE
  )


#################
# Load required libraries
library(plotly)
library(dplyr)
library(tidyr)  # for pivot_longer

# Assuming df is your dataframe

# Filter the dataframe for Beyoncé and Taylor Swift
df_filtered <- df %>% filter(artist_name %in% c("Beyoncé", "Taylor Swift"))

# Pivot the dataframe for plotting
df_long <- df_filtered %>%
  pivot_longer(cols = c(danceability, speechiness), names_to = "Variable", values_to = "Value")

# Plot danceability subplot
danceability_plot <- df_long %>%
  filter(Variable == "danceability") %>%
  plot_ly(x = ~album_release_year, y = ~Value, color = ~artist_name, 
          type = "scatter", mode = "markers", marker = list(size = 10)) %>%
  layout(title = "Danceability Over Time",
         xaxis = list(title = "Year"),
         yaxis = list(title = "Danceability"))

# Plot speechiness subplot
speechiness_plot <- df_long %>%
  filter(Variable == "speechiness") %>%
  plot_ly(x = ~album_release_year, y = ~Value, color = ~artist_name, 
          type = "scatter", mode = "markers", marker = list(size = 10)) %>%
  layout(title = "Speechiness Over Time",
         xaxis = list(title = "Year"),
         yaxis = list(title = "Speechiness"))

# Combine subplots
subplot(danceability_plot, speechiness_plot, nrows = 2)

