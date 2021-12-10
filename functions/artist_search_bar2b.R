artist_plot_fun <- function(artist, radio1, radio2){
  if (length(radio1) + length(radio2) != 2) {
    return()
  }
  artist_table_stats <- get_artist_audio_features(artist)
  artist_table_stats$duration_ms <- artist_table_stats$duration_ms/1000
  artist_table_stats$time_signature <- as.character(artist_table_stats$time_signature)
  artist_table_select <- select(artist_table_stats, duration_ms, loudness, tempo, time_signature, key_mode)
  if (length(radio1) == 2) {
    continuous_plot <- ggplot(artist_table_select, aes_string(x = radio1[1], y = radio1[2])) +
      geom_point()
    return(continuous_plot)
  }
  if (length(radio2) == 2) {
    categorical_plot <- ggplot(artist_table_select, aes(x = key_mode)) +
      geom_bar() + 
      facet_wrap(~time_signature, ncol = 1)
    return(categorical_plot)
  }
  else{
    cont_cat_select <- select(artist_table_select, radio1, radio2)
    cont_cat_melt <- melt(cont_cat_select, id.vars = radio2)
    cont_cat_plot <- ggplot(cont_cat_melt, aes_string(x = "value", color = radio2[1])) +
      geom_boxplot()
    return(cont_cat_plot)
  }
}
