library(shiny)

shinyUI( pageWithSidebar(

  headerPanel("want a kitty served with shiny?"),

  sidebarPanel(
    uiOutput("kittySelection")
  ),

  mainPanel(
    h3( textOutput("caption") ),
    imageOutput("catpic")
  )
))

