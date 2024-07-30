

library(spotifyr)

########################
get_spotify_access_token(client_id = "f18ac4c3ad37430db8f3486d0f0ed245",
                         client_secret = "5c46c528b7ed4f3c9c2dd7fd5406691f")

Sys.setenv(SPOTIFY_CLIENT_ID = "f18ac4c3ad37430db8f3486d0f0ed245")
Sys.setenv(SPOTIFY_CLIENT_SECRET = "5c46c528b7ed4f3c9c2dd7fd5406691f")

access_token <- get_spotify_access_token()


########################
Taylor_wift<- get_artist_audio_features("Taylor Swift")
Taylor_Swift<-data.frame(Taylor_swift)
write.csv(Taylor_swift,"Taylor_swift.csv")


Beyonce <- get_artist_audio_features("Beyoncé")

Beyonce<-data.frame(Beyonce)





## You can also access the variables by indexes, but the names are here to see what I'm retreiving

Taylor_Swift_A <-data.frame(Taylor_Swift$artist_name,Taylor_Swift$valence,
                            Taylor_Swift$danceability,Taylor_Swift$energy,Taylor_Swift$loudness,
                            Taylor_Swift$speechiness,Taylor_Swift$acousticness,Taylor_Swift$liveness,
                            Taylor_Swift$tempo,Taylor_Swift$track_name, Taylor_Swift$album_name,Taylor_Swift$album_release_year)
colnames(Taylor_Swift_A) <- c("artist_name","Valence","danceability","energy",
                              "loudness","speechiness","acousticness","liveness",
                              "tempo","track_name","album_name","album_release_year")
head(Taylor_Swift_A)



Beyonce_A <-data.frame(Beyonce$artist_name,Beyonce$valence,
                       Beyonce$danceability,Beyonce$energy,Beyonce$loudness,
                       Beyonce$speechiness,Beyonce$acousticness,Beyonce$liveness,
                       Beyonce$tempo,Beyonce$track_name, Beyonce$album_name, Beyonce$album_release_year)

colnames(Beyonce_A) <- c("artist_name","Valence","danceability","energy",
                         "loudness","speechiness","acousticness","liveness",
                         "tempo","track_name","album_name","album_release_year")
head(Beyonce_A)


Artists_TS_B <-rbind(Taylor_Swift_A, Beyonce_A)
head(Artists_TS_B)
write.csv(Artists_TS_B, "Artists_TS_B.csv")

################



Charlie_Puth <- get_artist_audio_features("Charlie Puth")
Bruno_Mars <- get_artist_audio_features("Bruno Mars")
Billie_Eilish <- get_artist_audio_features("Billie Eilish")
Whitney_Houston <- get_artist_audio_features("Whitney Houston")
Lady_Gaga <- get_artist_audio_features("Lady_Gaga")

Charlie_Puth<-data.frame(Charlie_Puth)
Bruno_Mars<-data.frame(Bruno_Mars)
Billie_Eilish<-data.frame(Billie_Eilish)
Whitney_Houston<-data.frame(Whitney_Houston)
Lady_Gaga<-data.frame(Lady_Gaga)


spotifydata <-rbind(Charlie_Puth,Bruno_Mars, Billie_Eilish,Whitney_Houston,Lady_Gaga)
spotifydata<-data.frame(spotifydata)
head(spotifydata)
write.csv(spotifydata, "spotifydata.csv")

ag<-data.frame(spotifydata)
ag<-data.frame(ag$artist_name,ag$artist_id,ag$album_type,ag$album_release_date,ag$album_release_year,ag$album_release_date_precision,
               ag$danceability,ag$energy,ag$energy,ag$key,ag$loudness,ag$mode,ag$speechiness,ag$acousticness,ag$instrumentalness,ag$liveness,
               ag$liveness,ag$valence,ag$tempo,ag$track_id,ag$duration_ms,ag$explicit,ag$is_local,ag$track_name,ag$track_number,ag$type,
               ag$album_name,ag$key_name,ag$mode_name,ag$key_mode)

write.csv(ag, "spotify2.csv")

#write.csv(Kelly_Clarkson,"Kelly_Clarkson.csv")
#write.csv(Charlie_Puth,"Charlie_Puth.csv")



colnames(Kelly_Clarkson)


kc<-data.frame(Kelly_Clarkson)
kc<-data.frame(kc$artist_name,kc$artist_id,kc$album_type,kc$album_release_date,kc$album_release_year,kc$album_release_date_precision,
               kc$danceability,kc$energy,kc$energy,kc$key,kc$loudness,kc$mode,kc$speechiness,kc$acousticness,kc$instrumentalness,kc$liveness,
               kc$liveness,kc$valence,kc$tempo,kc$track_id,kc$duration_ms,kc$explicit,kc$is_local,kc$track_name,kc$track_number,kc$type,
               kc$album_name,kc$key_name,kc$mode_name,kc$key_mode)


ag<-data.frame(Charlie_Puth)
ag<-data.frame(ag$artist_name,ag$artist_id,ag$album_type,ag$album_release_date,ag$album_release_year,ag$album_release_date_precision,
               ag$danceability,ag$energy,ag$energy,ag$key,ag$loudness,ag$mode,ag$speechiness,ag$acousticness,ag$instrumentalness,ag$liveness,
               ag$liveness,ag$valence,ag$tempo,ag$track_id,ag$duration_ms,ag$explicit,ag$is_local,ag$track_name,ag$track_number,ag$type,
               ag$album_name,ag$key_name,ag$mode_name,ag$key_mode)

write.csv(kc,"Kelly_Clarkson.csv")

write.csv(ag,"Charlie_Puth.csv")
