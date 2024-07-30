library(dplyr)
library(wordcloud2)
library(tidyr)
library(tidytext)

# Assuming df is your dataframe

# Filter data for Taylor Swift and Beyoncé
taylor_swift_data <- df %>% 
  filter(artist_name == "Taylor Swift")

beyonce_data <- df %>% 
  filter(artist_name == "Beyoncé")

# Tokenize track names and count word frequencies for Taylor Swift
taylor_swift_word_freq <- taylor_swift_data %>%
  unnest_tokens(word, track_name) %>%
  count(word) %>%
  arrange(desc(n))

# Tokenize track names and count word frequencies for Beyoncé
beyonce_word_freq <- beyonce_data %>%
  unnest_tokens(word, track_name) %>%
  count(word) %>%
  arrange(desc(n))

# Create word clouds for Taylor Swift and Beyoncé
wordcloud2(taylor_swift_word_freq, size = 1, backgroundColor = "white", color = "random")
wordcloud2(beyonce_word_freq, size = 1, backgroundColor = "white", color = "random")




#########


# Get the count of album release years separately for Taylor Swift
swift_counts <- table(df$album_release_year[df$artist_name == "Taylor Swift"])

# Get the count of album release years separately for Beyoncé
beyonce_counts <- table(df$album_release_year[df$artist_name == "Beyoncé"])

