artist_plot_fun <- function(artist, radio){
  if (radio == "") {
    return()
  }
  artist_table_stats <- get_artist_audio_features(artist)
    if (radio == "duration_ms") {
      duration_table <- select(artist_table_stats, radio)
      duration_table_scaled <- duration_table/1000
      duration_table_melt <- melt(duration_table_scaled)
      duration_boxplot <- ggplot(data = duration_table_melt, aes(x = value)) +
        geom_boxplot() +
        labs(x = "Seconds", title = paste("Boxplot of duration for artist ", artist, sep="")) +
        theme(plot.title = element_text(size = 22))
      return(duration_boxplot)
    }
    if (radio == "loudness") {
      loudness_table <- select(artist_table_stats, radio)
      loudness_table_melt <- melt(loudness_table)
      loudness_boxplot <- ggplot(data = loudness_table_melt, aes(x = value)) +
        geom_boxplot() +
        labs(x = "dB", title = paste("Boxplot of loudness for artist ", artist, sep="")) +
        theme(plot.title = element_text(size = 22))
      return(loudness_boxplot)
    }
    if (radio == "tempo") {
      tempo_table <- select(artist_table_stats, radio)
      tempo_table_melt <- melt(tempo_table)
      tempo_boxplot <- ggplot(data = tempo_table_melt, aes(x = value)) +
        geom_boxplot() +
        labs(x = "bpm", title = paste("Boxplot of tempo for artist ", artist, sep="")) +
        theme(plot.title = element_text(size = 22))
      return(tempo_boxplot)
    }
    if(radio == "time_signature"){
      time_histogram <- ggplot(data = artist_table_stats, aes(x = time_signature)) +
        geom_bar() +
        labs(x = "Time Signature", y = "Count", title = paste("Bar chart of time signature for artist ", artist, sep="")) +
        theme(plot.title = element_text(size = 22))
      return(time_histogram)
    }
    if(radio == "key_mode"){
      key_histogram <- ggplot(data = artist_table_stats, aes(x = key_mode)) +
        geom_bar() +
        labs(x = "Key Signature", y = "Count", title = paste("Bar chart of key signature for artist ", artist, sep="")) +
        theme(plot.title = element_text(size = 22))
      return(key_histogram)
    }
}
