if (!require('shiny')) install.packages("shiny")
if (!require('shinythemes')) install.packages("shinythemes")
if (!require('reshape2')) install.packages("reshape2")
if (!require('tidyverse')) install.packages("tidyverse")
if (!require('spotifyr')) install.packages("spotifyr")

Sys.setenv(SPOTIFY_CLIENT_ID = '25619ab3a27f4ca3bbcf8453303d11c7')
Sys.setenv(SPOTIFY_CLIENT_SECRET = 'a2c3711fa4e34e679e0b5a7dd01540d3')
access_token <- get_spotify_access_token()