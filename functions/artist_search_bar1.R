artist_search_fun <- function(artist, radio){
  artist_table_stats <- get_artist_audio_features(artist)
  if(radio == 1){
    summary_table <- select(artist_table_stats, track_name, album_name, duration_ms, loudness, tempo, time_signature, key_mode)
    colnames(summary_table) <- c("Track Name", "Album Name", "Duration (ms)", "Loudness (dB)", "Tempo (bpm)", "Time Signature", "Key Signature")
    return(summary_table)
  }
  if(radio == 2){
    duration_table <- select(artist_table_stats, track_name, duration_ms)
    data_mean <- mean(duration_table$duration_ms)/1000
    data_median <- median(duration_table$duration_ms)/1000
    data_stdev <- sd(duration_table$duration_ms)/1000
    data_min <- round(min(duration_table$duration_ms)/1000)
    data_max <- round(max(duration_table$duration_ms)/1000)
    newrow1 <- c("Mean (sec)", "Median (sec)", "Standard Deviaion (sec)", "Minimum (sec)", "Maximum (sec)")
    newrow2 <- c(data_mean, data_median, data_stdev, data_min, data_max)
    duration_final <- rbind(newrow1, newrow2)
    return(duration_final)
  }
  if(radio == 3){
    loud_table <- select(artist_table_stats, track_name, loudness)
    loud_mean <- mean(loud_table$loudness)
    loud_median <- median(loud_table$loudness)
    loud_stdev <- sd(loud_table$loudness)
    loud_min <- min(loud_table$loudness)
    loud_max <- max(loud_table$loudness)
    newrow1 <- c("Mean (dB)", "Median (dB)", "Standard Deviaion (dB)", "Minimum (dB)", "Maximum (dB)")
    newrow2 <- c(loud_mean, loud_median, loud_stdev, loud_min, loud_max)
    loud_final <- rbind(newrow1, newrow2)
    return(loud_final)
  }
  if(radio == 4){
    tempo_table <- select(artist_table_stats, track_name, tempo)
    tempo_mean <- mean(tempo_table$tempo)
    tempo_median <- median(tempo_table$tempo)
    tempo_stdev <- sd(tempo_table$tempo)
    tempo_min <- min(tempo_table$tempo)
    tempo_max <- max(tempo_table$tempo)
    newrow1 <- c("Mean (bpm)", "Median (bpm)", "Standard Deviaion (bpm)", "Minimum (bpm)", "Maximum (bpm)")
    newrow2 <- c(tempo_mean, tempo_median, tempo_stdev, tempo_min, tempo_max)
    tempo_final <- rbind(newrow1, newrow2)
    return(tempo_final)
  }
  if(radio == 5){
    time_table <- count(artist_table_stats, time_signature, sort = TRUE)
    colnames(time_table) <- c("Time Signature", "Count")
    return(time_table)
  }
  if(radio == 6){
    key_table <- count(artist_table_stats, key_mode, sort = TRUE)
    colnames(key_table) <- c("Key Signature", "Count")
    return(key_table)
  }
}