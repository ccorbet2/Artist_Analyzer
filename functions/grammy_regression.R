grammy_reg_fun <- function(radio, checkbox) {
  grammy <- read.csv("data/grammy.csv")
  if (radio %in% checkbox){
    return()
  }
  if (is.null(checkbox) == TRUE){
    return()
  }
  else {
    if (length(checkbox) == 1) {
      response = as.numeric(radio)
      checkbox1 = as.numeric(unlist(checkbox[1]))
      grammy_fit <- lm(grammy[, response] ~ grammy[, checkbox1])
      return(summary(grammy_fit))
    }
    if (length(checkbox) == 2) {
      response = as.numeric(radio)
      checkbox1 = as.numeric(unlist(checkbox[1]))
      checkbox2 = as.numeric(unlist(checkbox[2]))
      grammy_fit <- lm(grammy[, response] ~ grammy[, checkbox1] + grammy[, checkbox2])
      return(summary(grammy_fit))
    }
    if (length(checkbox) == 3) {
      response = as.numeric(radio)
      checkbox1 = as.numeric(unlist(checkbox[1]))
      checkbox2 = as.numeric(unlist(checkbox[2]))
      checkbox3 = as.numeric(unlist(checkbox[3]))
      grammy_fit <- lm(grammy[, response] ~ grammy[, checkbox1] + grammy[, checkbox2] + grammy[, checkbox3])
      return(summary(grammy_fit))
    }
    if (length(checkbox) == 4) {
      response = as.numeric(radio)
      checkbox1 = as.numeric(unlist(checkbox[1]))
      checkbox2 = as.numeric(unlist(checkbox[2]))
      checkbox3 = as.numeric(unlist(checkbox[3]))
      checkbox4 = as.numeric(unlist(checkbox[4]))
      grammy_fit <- lm(grammy[, response] ~ grammy[, checkbox1] + grammy[, checkbox2] + grammy[, checkbox3] + grammy[, checkbox4])
      return(summary(grammy_fit))
    }
    if (length(checkbox) == 5) {
      response = as.numeric(radio)
      checkbox1 = as.numeric(unlist(checkbox[1]))
      checkbox2 = as.numeric(unlist(checkbox[2]))
      checkbox3 = as.numeric(unlist(checkbox[3]))
      checkbox4 = as.numeric(unlist(checkbox[4]))
      checkbox5 = as.numeric(unlist(checkbox[5]))
      grammy_fit <- lm(grammy[, response] ~ grammy[, checkbox1] + grammy[, checkbox2] + grammy[, checkbox3] + grammy[, checkbox4] + grammy[, checkbox5])
      return(summary(grammy_fit))
    }
  }
}