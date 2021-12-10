library(shiny)
library(shinythemes)
shinythemes::themeSelector()
navbarPage(
    theme = shinytheme("flatly"),
    "Artist Analyzer",
    #First tab (Descriptive Statistics)
    tabPanel("Artist Summary Statistics",
            sidebarPanel(
                textInput("artist_name_bar1", h4("Artist's Name"), "Steely Dan"),
                radioButtons("radio1", label = h4("Choose Your Variable"),
                             choices = list("Summary" = 1, "Duration" = 2, "Loudness" = 3, "Tempo" = 4, "Time Signature" = 5, "Key Signature" = 6),
                             selected = 1),
                actionButton("action_bar1", "Update"),
                width = 2
            ),
            mainPanel(
                tableOutput("Table_1")
            )
    ),  
    
    #Second tab (Descriptive Statistics)
    navbarMenu("Artist Data Visualization",
        tabPanel("Single Variable",
                   sidebarPanel(
                       textInput("artist_name_bar2a", h4("Artist's Name"), "Steely Dan"),
                       radioButtons("radio2a", label = h4("Choose Your Variable"),
                                    choices = list("None selected" = "", "Duration" = "duration_ms", "Loudness" = "loudness", "Tempo" = "tempo", "Time Signature" = "time_signature", "Key Signature" = "key_mode"),
                                    selected = NULL),
                       actionButton("action_bar2a", "Update"),
                       width = 2
                   ),
                   mainPanel(
                       # textOutput("Message_2a"),
                       plotOutput("Plot_2a", height = "400px")
                   )
        ),
        tabPanel("Interaction",
                 sidebarPanel(
                         textInput("artist_name_bar2b", h4("Artist's Name"), "Steely Dan"),
                         checkboxGroupInput("checkbox2b_1", label = h4("Choose Your  Continuous Variable"),
                                      choices = list("Duration" = "duration_ms", "Loudness" = "loudness", "Tempo" = "tempo"),
                                      selected = NULL),
                         checkboxGroupInput("checkbox2b_2", label = h4("Choose Your Categorical Variable"),
                                      choices = list("Time Signature" = "time_signature", "Key Signature" = "key_mode"),
                                      selected = NULL),
                         actionButton("action_bar2b", "Update"),
                         width = 2
                 ),
                 mainPanel(
                     textOutput("Message_2b"),
                     plotOutput("Plot_2b")
                 )
        )
    ),
    #Third Tab (Statistical Analysis)
    tabPanel("Grammy Regression Analysis",
             sidebarPanel(
                 radioButtons("radio3", label = h4("Choose Your Response Variable"),
                              choices = list("Year" = 3, "Duration" = 4, "Loudness" = 5, "Tempo" = 6, "Time Signature" = 7, "Key Signature" = 8),
                              selected = 4),
                 checkboxGroupInput("checkbox3", label = h4("Choose Your Predictor Variables"),
                              choices = list("Year" = 3, "Duration" = 4, "Loudness" = 5, "Tempo" = 6, "Time Signature" = 7, "Key Signature" = 8),
                              selected = 3),
                 actionButton("action_bar3", "Update"),
                 width = 2
             ),
             mainPanel(
                 verbatimTextOutput("LM3")
             ),
                            
    )
    
)


